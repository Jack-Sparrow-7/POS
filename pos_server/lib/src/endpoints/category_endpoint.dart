import 'package:pos_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class CategoryEndpoint extends Endpoint {
  Future<Category> createCategory(
    Session session, {
    required String name,
    required int storeId,
    required UuidValue merchantId,
  }) async {
    final trimmedName = name.trim();
    if (trimmedName.isEmpty) {
      throw ValidationException(message: 'Name is required.');
    }

    if (storeId <= 0) {
      throw ValidationException(message: 'Invalid storeId.');
    }

    if (merchantId.uuid.isEmpty) {
      throw ValidationException(message: 'Merchant ID is required.');
    }

    final updatedName = trimmedName.toUpperCase();
    final now = DateTime.now().toUtc();
    final category = Category(
      name: updatedName,
      storeId: storeId,
      merchantId: merchantId,
      createdAt: now,
      updatedAt: now,
    );

    try {
      final createdCategory = await Category.db.insertRow(session, category);
      return createdCategory;
    } on DatabaseException catch (e) {
      if (e.message.contains('category_name_store_idx')) {
        throw ValidationException(message: 'Category already exists.');
      }

      if (e.message.toLowerCase().contains('foreign key')) {
        throw ValidationException(message: 'Invalid Store ID');
      }

      rethrow;
    }
  }

  Future<Category> updateCategory(
    Session session, {
    required String name,
    required int id,
  }) async {
    final trimmedName = name.trim();
    if (trimmedName.isEmpty) {
      throw ValidationException(message: 'Name is required.');
    }

    final existing = await Category.db.findById(session, id);
    if (existing == null) {
      throw NotFoundException(message: 'Category does not exist.');
    }
    final updatedName = trimmedName.toUpperCase();
    existing.name = updatedName;
    existing.updatedAt = DateTime.now().toUtc();

    try {
      final updatedCategory = await Category.db.updateRow(session, existing);
      return updatedCategory;
    } on DatabaseException catch (e) {
      if (e.message.contains('category_name_store_idx')) {
        throw ValidationException(message: 'Category already exists.');
      }

      rethrow;
    }
  }

  Future<Category> getCategory(Session session, {required int id}) async {
    final category = await Category.db.findById(session, id);

    if (category == null) {
      throw NotFoundException(message: 'Category does not exist.');
    }

    return category;
  }

  Future<List<Category>> getAllCategories(
    Session session, {
    required int storeId,
  }) async {
    final categories = await Category.db.find(
      session,
      where: (c) => c.storeId.equals(storeId),
      orderBy: (c) => c.name,
    );

    return categories;
  }

  // TODO: Restrict or remove in production (exposes all categories).
  Future<List<Category>> getAllCategoriesDev(Session session) async {
    final categories = await Category.db.find(
      session,
    );

    return categories;
  }

  Future<ApiResponse> deleteCategory(
    Session session, {
    required int id,
  }) async {
    final existing = await Category.db.findById(session, id);

    if (existing == null) {
      throw NotFoundException(message: 'Category does not exist.');
    }

    try {
      await Category.db.deleteRow(session, existing);
    } on DatabaseException catch (e) {
      if (e.message.toLowerCase().contains('foreign key')) {
        throw ValidationException(
          message: 'Category cannot be deleted while in use.',
        );
      }
      rethrow;
    }
    return ApiResponse(
      success: true,
      message: 'Category deleted successfully.',
    );
  }
}
