import 'package:pos_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class ProductEndpoint extends Endpoint {
  Future<Product> createProduct(
    Session session, {
    required String name,
    required int basePrice,
    required int sellingPrice,
    String? imageUrl,
    required int storeId,
    required int categoryId,
    required int counterId,
    required UuidValue merchantId,
    SessionInfo? sessionInfo,
  }) async {
    if (name.isEmpty) {
      throw ValidationException(message: "Name is required.");
    }

    if (basePrice < 0 || sellingPrice < 0) {
      throw ValidationException(message: "Prices must be non-negative.");
    }

    final updatedName = name.trim().toUpperCase();
    final now = DateTime.now().toUtc();
    final product = Product(
      name: updatedName,
      basePrice: basePrice,
      sellingPrice: sellingPrice,
      categoryId: categoryId,
      counterId: counterId,
      storeId: storeId,
      merchantId: merchantId,
      stockMonitor: false,
      stockQuantity: 0,
      lowStockQuantity: 0,
      status: .INACTIVE,
      createdAt: now,
      updatedAt: now,
      imageUrl: imageUrl,
      sessionInfo: sessionInfo,
    );

    try {
      final createdProduct = await Product.db.insertRow(session, product);

      return createdProduct;
    } on DatabaseException catch (e) {
      if (e.message.contains('product_name_store_idx')) {
        throw ValidationException(
          message: "Product with this name already exists.",
        );
      }

      if (e.message.toLowerCase().contains('foreign key')) {
        throw ValidationException(
          message: "Invalid Store, Category, Counter or Merchant ID.",
        );
      }

      rethrow;
    }
  }

  Future<List<Product>> getAllProducts(
    Session session, {
    required int storeId,
  }) async {
    final products = await Product.db.find(
      session,
      where: (p) => p.storeId.equals(storeId),
    );

    return products;
  }

  Future<Product> updateProduct(
    Session session, {
    required int id,
    String? name,
    int? basePrice,
    int? sellingPrice,
    String? imageUrl,
    SessionInfo? sessionInfo,
    int? categoryId,
    int? counterId,
  }) async {
    if (basePrice != null && basePrice < 0) {
      throw ValidationException(message: "Prices must be non-negative.");
    }

    if (sellingPrice != null && sellingPrice < 0) {
      throw ValidationException(message: "Prices must be non-negative.");
    }

    String? updatedName;
    if (name != null && name.isNotEmpty) {
      updatedName = name.trim().toUpperCase();
    }

    final existingProduct = await Product.db.findById(session, id);
    if (existingProduct == null) {
      throw NotFoundException(message: "Product does not exist.");
    }

    final product = existingProduct.copyWith(
      name: updatedName ?? existingProduct.name,
      basePrice: basePrice ?? existingProduct.basePrice,
      sellingPrice: sellingPrice ?? existingProduct.sellingPrice,
      imageUrl: imageUrl ?? existingProduct.imageUrl,
      sessionInfo: sessionInfo ?? existingProduct.sessionInfo,
      categoryId: categoryId ?? existingProduct.categoryId,
      counterId: counterId ?? existingProduct.counterId,
      updatedAt: DateTime.now().toUtc(),
    );

    try {
      final updatedProduct = await Product.db.updateRow(session, product);

      return updatedProduct;
    } on DatabaseException catch (e) {
      if (e.message.contains('product_name_store_idx')) {
        throw ValidationException(
          message: "Product with this name already exists.",
        );
      }

      rethrow;
    }
  }

  Future<Product> updateStatus(
    Session session, {
    required int id,
    required ProductStatus status,
  }) async {
    final existingProduct = await Product.db.findById(session, id);

    if (existingProduct == null) {
      throw NotFoundException(message: "Product does not exist.");
    }

    existingProduct.status = status;
    existingProduct.updatedAt = DateTime.now().toUtc();

    final updatedProduct = await Product.db.updateRow(session, existingProduct);

    return updatedProduct;
  }

  Future<Product> updateSession(
    Session session, {
    required int id,
    required SessionInfo sessionInfo,
  }) async {
    final existingProduct = await Product.db.findById(session, id);

    if (existingProduct == null) {
      throw NotFoundException(message: "Product does not exist.");
    }

    existingProduct.sessionInfo = sessionInfo;
    existingProduct.updatedAt = DateTime.now().toUtc();

    final updatedProduct = await Product.db.updateRow(session, existingProduct);

    return updatedProduct;
  }

  Future<ApiResponse> deleteProduct(Session session, {required int id}) async {
    final existingProduct = await Product.db.findById(session, id);

    if (existingProduct == null) {
      throw NotFoundException(message: "Product does not exist.");
    }

    try {
      await Product.db.deleteRow(session, existingProduct);
      return ApiResponse(
        success: true,
        message: 'Product deleted successfully.',
      );
    } on DatabaseException catch (e) {
      if (e.message.toLowerCase().contains('foreign key')) {
        throw ValidationException(
          message: 'Product cannot be deleted while it has dependent records.',
        );
      }
      rethrow;
    }
  }

  Future<Product> resetStock(Session session, {required int id}) async {
    final product = await Product.db.findById(session, id);

    if (product == null) {
      throw NotFoundException(message: "Product does not exist.");
    }

    return _applyStockChange(
      session,
      product: product,
      quantity: product.stockQuantity,
      movementType: .WASTAGE,
      referenceType: .MANUAL,
      remarks: "RESET",
    );
  }

  Future<Product> addStock(
    Session session, {
    required int id,
    required int quantity,
    int? lowStock,
  }) async {
    final product = await Product.db.findById(session, id);

    if (product == null) {
      throw NotFoundException(message: "Product does not exist.");
    }

    if (quantity < 0) {
      throw ValidationException(message: "Quantity must be non-negative.");
    }

    return _applyStockChange(
      session,
      product: product,
      quantity: quantity,
      movementType: .IN,
      referenceType: .MANUAL,
      lowStock: lowStock,
      remarks: "ADD",
    );
  }

  Future<Product> reduceStockSale(
    Session session, {
    required int id,
    required int quantity,
  }) async {
    final product = await Product.db.findById(session, id);

    if (product == null) {
      throw NotFoundException(message: "Product does not exist.");
    }

    if (quantity < 0) {
      throw ValidationException(message: "Quantity must be non-negative.");
    }

    return _applyStockChange(
      session,
      product: product,
      quantity: quantity,
      movementType: .OUT,
      referenceType: .SALE,
      remarks: "REDUCE",
    );
  }

  Future<Product> reduceStockAdjustment(
    Session session, {
    required int id,
    required int quantity,
    int? lowStock,
  }) async {
    final product = await Product.db.findById(session, id);

    if (product == null) {
      throw NotFoundException(message: "Product does not exist.");
    }

    return _applyStockChange(
      session,
      product: product,
      quantity: quantity,
      movementType: .ADJUSTMENT,
      referenceType: .MANUAL,
      remarks: "REDUCE",
      lowStock: lowStock,
    );
  }

  Future<Product> reduceStockWastage(
    Session session, {
    required int id,
    required int quantity,
    int? lowStock,
  }) async {
    final product = await Product.db.findById(session, id);

    if (product == null) {
      throw NotFoundException(message: "Product does not exist.");
    }

    return _applyStockChange(
      session,
      product: product,
      quantity: quantity,
      movementType: .WASTAGE,
      referenceType: .MANUAL,
      remarks: "REDUCE",
      lowStock: lowStock,
    );
  }

  Future<Product> _applyStockChange(
    Session session, {
    required Product product,
    required int quantity,
    required StockMovementType movementType,
    required StockReferenceType referenceType,
    String? remarks,
    int? lowStock,
  }) async {
    int delta;

    switch (movementType) {
      case .IN:
        delta = quantity;
        break;
      case .OUT:
      case .WASTAGE:
      case .ADJUSTMENT:
        delta = -quantity;
        break;
    }

    return session.db.transaction((transaction) async {
      final newStock = product.stockQuantity + delta;

      if (newStock < 0) {
        throw ValidationException(message: "Not enough stock.");
      }

      final now = DateTime.now().toUtc();

      final updatedProduct = await Product.db.updateRow(
        session,
        product.copyWith(
          stockQuantity: newStock,
          lowStockQuantity: lowStock ?? product.lowStockQuantity,
          updatedAt: now,
        ),
        transaction: transaction,
      );

      final log = StockLog(
        storeId: product.storeId,
        productId: product.id!,
        movementType: movementType,
        quantity: quantity,
        referenceType: referenceType,
        stockBefore: product.stockQuantity,
        stockAfter: newStock,
        movementAt: now,
        createdAt: now,
        remarks: remarks,
      );

      await StockLog.db.insertRow(session, log, transaction: transaction);

      return updatedProduct;
    });
  }
}
