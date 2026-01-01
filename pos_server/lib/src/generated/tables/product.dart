/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../enums/product_status.dart' as _i2;
import '../session_info.dart' as _i3;
import 'package:pos_server/src/generated/protocol.dart' as _i4;

abstract class Product
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  Product._({
    this.id,
    required this.name,
    required this.basePrice,
    required this.sellingPrice,
    this.imageUrl,
    required this.categoryId,
    required this.counterId,
    required this.storeId,
    required this.merchantId,
    required this.stockMonitor,
    required this.stockQuantity,
    required this.lowStockQuantity,
    required this.status,
    this.sessionInfo,
    this.createdAt,
    this.updatedAt,
  });

  factory Product({
    int? id,
    required String name,
    required int basePrice,
    required int sellingPrice,
    String? imageUrl,
    required int categoryId,
    required int counterId,
    required int storeId,
    required _i1.UuidValue merchantId,
    required bool stockMonitor,
    required int stockQuantity,
    required int lowStockQuantity,
    required _i2.ProductStatus status,
    _i3.SessionInfo? sessionInfo,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _ProductImpl;

  factory Product.fromJson(Map<String, dynamic> jsonSerialization) {
    return Product(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      basePrice: jsonSerialization['basePrice'] as int,
      sellingPrice: jsonSerialization['sellingPrice'] as int,
      imageUrl: jsonSerialization['imageUrl'] as String?,
      categoryId: jsonSerialization['categoryId'] as int,
      counterId: jsonSerialization['counterId'] as int,
      storeId: jsonSerialization['storeId'] as int,
      merchantId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['merchantId'],
      ),
      stockMonitor: jsonSerialization['stockMonitor'] as bool,
      stockQuantity: jsonSerialization['stockQuantity'] as int,
      lowStockQuantity: jsonSerialization['lowStockQuantity'] as int,
      status: _i2.ProductStatus.fromJson(
        (jsonSerialization['status'] as String),
      ),
      sessionInfo: jsonSerialization['sessionInfo'] == null
          ? null
          : _i4.Protocol().deserialize<_i3.SessionInfo>(
              jsonSerialization['sessionInfo'],
            ),
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt: jsonSerialization['updatedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
    );
  }

  static final t = ProductTable();

  static const db = ProductRepository._();

  @override
  int? id;

  String name;

  int basePrice;

  int sellingPrice;

  String? imageUrl;

  int categoryId;

  int counterId;

  int storeId;

  _i1.UuidValue merchantId;

  bool stockMonitor;

  int stockQuantity;

  int lowStockQuantity;

  _i2.ProductStatus status;

  _i3.SessionInfo? sessionInfo;

  DateTime? createdAt;

  DateTime? updatedAt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [Product]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Product copyWith({
    int? id,
    String? name,
    int? basePrice,
    int? sellingPrice,
    String? imageUrl,
    int? categoryId,
    int? counterId,
    int? storeId,
    _i1.UuidValue? merchantId,
    bool? stockMonitor,
    int? stockQuantity,
    int? lowStockQuantity,
    _i2.ProductStatus? status,
    _i3.SessionInfo? sessionInfo,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Product',
      if (id != null) 'id': id,
      'name': name,
      'basePrice': basePrice,
      'sellingPrice': sellingPrice,
      if (imageUrl != null) 'imageUrl': imageUrl,
      'categoryId': categoryId,
      'counterId': counterId,
      'storeId': storeId,
      'merchantId': merchantId.toJson(),
      'stockMonitor': stockMonitor,
      'stockQuantity': stockQuantity,
      'lowStockQuantity': lowStockQuantity,
      'status': status.toJson(),
      if (sessionInfo != null) 'sessionInfo': sessionInfo?.toJson(),
      if (createdAt != null) 'createdAt': createdAt?.toJson(),
      if (updatedAt != null) 'updatedAt': updatedAt?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Product',
      if (id != null) 'id': id,
      'name': name,
      'basePrice': basePrice,
      'sellingPrice': sellingPrice,
      if (imageUrl != null) 'imageUrl': imageUrl,
      'categoryId': categoryId,
      'counterId': counterId,
      'storeId': storeId,
      'merchantId': merchantId.toJson(),
      'stockMonitor': stockMonitor,
      'stockQuantity': stockQuantity,
      'lowStockQuantity': lowStockQuantity,
      'status': status.toJson(),
      if (sessionInfo != null) 'sessionInfo': sessionInfo?.toJsonForProtocol(),
    };
  }

  static ProductInclude include() {
    return ProductInclude._();
  }

  static ProductIncludeList includeList({
    _i1.WhereExpressionBuilder<ProductTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ProductTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ProductTable>? orderByList,
    ProductInclude? include,
  }) {
    return ProductIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Product.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Product.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ProductImpl extends Product {
  _ProductImpl({
    int? id,
    required String name,
    required int basePrice,
    required int sellingPrice,
    String? imageUrl,
    required int categoryId,
    required int counterId,
    required int storeId,
    required _i1.UuidValue merchantId,
    required bool stockMonitor,
    required int stockQuantity,
    required int lowStockQuantity,
    required _i2.ProductStatus status,
    _i3.SessionInfo? sessionInfo,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super._(
         id: id,
         name: name,
         basePrice: basePrice,
         sellingPrice: sellingPrice,
         imageUrl: imageUrl,
         categoryId: categoryId,
         counterId: counterId,
         storeId: storeId,
         merchantId: merchantId,
         stockMonitor: stockMonitor,
         stockQuantity: stockQuantity,
         lowStockQuantity: lowStockQuantity,
         status: status,
         sessionInfo: sessionInfo,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [Product]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Product copyWith({
    Object? id = _Undefined,
    String? name,
    int? basePrice,
    int? sellingPrice,
    Object? imageUrl = _Undefined,
    int? categoryId,
    int? counterId,
    int? storeId,
    _i1.UuidValue? merchantId,
    bool? stockMonitor,
    int? stockQuantity,
    int? lowStockQuantity,
    _i2.ProductStatus? status,
    Object? sessionInfo = _Undefined,
    Object? createdAt = _Undefined,
    Object? updatedAt = _Undefined,
  }) {
    return Product(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      basePrice: basePrice ?? this.basePrice,
      sellingPrice: sellingPrice ?? this.sellingPrice,
      imageUrl: imageUrl is String? ? imageUrl : this.imageUrl,
      categoryId: categoryId ?? this.categoryId,
      counterId: counterId ?? this.counterId,
      storeId: storeId ?? this.storeId,
      merchantId: merchantId ?? this.merchantId,
      stockMonitor: stockMonitor ?? this.stockMonitor,
      stockQuantity: stockQuantity ?? this.stockQuantity,
      lowStockQuantity: lowStockQuantity ?? this.lowStockQuantity,
      status: status ?? this.status,
      sessionInfo: sessionInfo is _i3.SessionInfo?
          ? sessionInfo
          : this.sessionInfo?.copyWith(),
      createdAt: createdAt is DateTime? ? createdAt : this.createdAt,
      updatedAt: updatedAt is DateTime? ? updatedAt : this.updatedAt,
    );
  }
}

class ProductUpdateTable extends _i1.UpdateTable<ProductTable> {
  ProductUpdateTable(super.table);

  _i1.ColumnValue<String, String> name(String value) => _i1.ColumnValue(
    table.name,
    value,
  );

  _i1.ColumnValue<int, int> basePrice(int value) => _i1.ColumnValue(
    table.basePrice,
    value,
  );

  _i1.ColumnValue<int, int> sellingPrice(int value) => _i1.ColumnValue(
    table.sellingPrice,
    value,
  );

  _i1.ColumnValue<String, String> imageUrl(String? value) => _i1.ColumnValue(
    table.imageUrl,
    value,
  );

  _i1.ColumnValue<int, int> categoryId(int value) => _i1.ColumnValue(
    table.categoryId,
    value,
  );

  _i1.ColumnValue<int, int> counterId(int value) => _i1.ColumnValue(
    table.counterId,
    value,
  );

  _i1.ColumnValue<int, int> storeId(int value) => _i1.ColumnValue(
    table.storeId,
    value,
  );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> merchantId(
    _i1.UuidValue value,
  ) => _i1.ColumnValue(
    table.merchantId,
    value,
  );

  _i1.ColumnValue<bool, bool> stockMonitor(bool value) => _i1.ColumnValue(
    table.stockMonitor,
    value,
  );

  _i1.ColumnValue<int, int> stockQuantity(int value) => _i1.ColumnValue(
    table.stockQuantity,
    value,
  );

  _i1.ColumnValue<int, int> lowStockQuantity(int value) => _i1.ColumnValue(
    table.lowStockQuantity,
    value,
  );

  _i1.ColumnValue<_i2.ProductStatus, _i2.ProductStatus> status(
    _i2.ProductStatus value,
  ) => _i1.ColumnValue(
    table.status,
    value,
  );

  _i1.ColumnValue<_i3.SessionInfo, _i3.SessionInfo> sessionInfo(
    _i3.SessionInfo? value,
  ) => _i1.ColumnValue(
    table.sessionInfo,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> createdAt(DateTime? value) =>
      _i1.ColumnValue(
        table.createdAt,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> updatedAt(DateTime? value) =>
      _i1.ColumnValue(
        table.updatedAt,
        value,
      );
}

class ProductTable extends _i1.Table<int?> {
  ProductTable({super.tableRelation}) : super(tableName: 'product') {
    updateTable = ProductUpdateTable(this);
    name = _i1.ColumnString(
      'name',
      this,
    );
    basePrice = _i1.ColumnInt(
      'basePrice',
      this,
    );
    sellingPrice = _i1.ColumnInt(
      'sellingPrice',
      this,
    );
    imageUrl = _i1.ColumnString(
      'imageUrl',
      this,
    );
    categoryId = _i1.ColumnInt(
      'categoryId',
      this,
    );
    counterId = _i1.ColumnInt(
      'counterId',
      this,
    );
    storeId = _i1.ColumnInt(
      'storeId',
      this,
    );
    merchantId = _i1.ColumnUuid(
      'merchantId',
      this,
    );
    stockMonitor = _i1.ColumnBool(
      'stockMonitor',
      this,
    );
    stockQuantity = _i1.ColumnInt(
      'stockQuantity',
      this,
    );
    lowStockQuantity = _i1.ColumnInt(
      'lowStockQuantity',
      this,
    );
    status = _i1.ColumnEnum(
      'status',
      this,
      _i1.EnumSerialization.byName,
    );
    sessionInfo = _i1.ColumnSerializable<_i3.SessionInfo>(
      'sessionInfo',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
    );
    updatedAt = _i1.ColumnDateTime(
      'updatedAt',
      this,
    );
  }

  late final ProductUpdateTable updateTable;

  late final _i1.ColumnString name;

  late final _i1.ColumnInt basePrice;

  late final _i1.ColumnInt sellingPrice;

  late final _i1.ColumnString imageUrl;

  late final _i1.ColumnInt categoryId;

  late final _i1.ColumnInt counterId;

  late final _i1.ColumnInt storeId;

  late final _i1.ColumnUuid merchantId;

  late final _i1.ColumnBool stockMonitor;

  late final _i1.ColumnInt stockQuantity;

  late final _i1.ColumnInt lowStockQuantity;

  late final _i1.ColumnEnum<_i2.ProductStatus> status;

  late final _i1.ColumnSerializable<_i3.SessionInfo> sessionInfo;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  @override
  List<_i1.Column> get columns => [
    id,
    name,
    basePrice,
    sellingPrice,
    imageUrl,
    categoryId,
    counterId,
    storeId,
    merchantId,
    stockMonitor,
    stockQuantity,
    lowStockQuantity,
    status,
    sessionInfo,
    createdAt,
    updatedAt,
  ];
}

class ProductInclude extends _i1.IncludeObject {
  ProductInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => Product.t;
}

class ProductIncludeList extends _i1.IncludeList {
  ProductIncludeList._({
    _i1.WhereExpressionBuilder<ProductTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Product.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Product.t;
}

class ProductRepository {
  const ProductRepository._();

  /// Returns a list of [Product]s matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order of the items use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// The maximum number of items can be set by [limit]. If no limit is set,
  /// all items matching the query will be returned.
  ///
  /// [offset] defines how many items to skip, after which [limit] (or all)
  /// items are read from the database.
  ///
  /// ```dart
  /// var persons = await Persons.db.find(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.firstName,
  ///   limit: 100,
  /// );
  /// ```
  Future<List<Product>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ProductTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ProductTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ProductTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Product>(
      where: where?.call(Product.t),
      orderBy: orderBy?.call(Product.t),
      orderByList: orderByList?.call(Product.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [Product] matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// [offset] defines how many items to skip, after which the next one will be picked.
  ///
  /// ```dart
  /// var youngestPerson = await Persons.db.findFirstRow(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.age,
  /// );
  /// ```
  Future<Product?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ProductTable>? where,
    int? offset,
    _i1.OrderByBuilder<ProductTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ProductTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Product>(
      where: where?.call(Product.t),
      orderBy: orderBy?.call(Product.t),
      orderByList: orderByList?.call(Product.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [Product] by its [id] or null if no such row exists.
  Future<Product?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Product>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [Product]s in the list and returns the inserted rows.
  ///
  /// The returned [Product]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Product>> insert(
    _i1.Session session,
    List<Product> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Product>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Product] and returns the inserted row.
  ///
  /// The returned [Product] will have its `id` field set.
  Future<Product> insertRow(
    _i1.Session session,
    Product row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Product>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Product]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Product>> update(
    _i1.Session session,
    List<Product> rows, {
    _i1.ColumnSelections<ProductTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Product>(
      rows,
      columns: columns?.call(Product.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Product]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Product> updateRow(
    _i1.Session session,
    Product row, {
    _i1.ColumnSelections<ProductTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Product>(
      row,
      columns: columns?.call(Product.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Product] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Product?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<ProductUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<Product>(
      id,
      columnValues: columnValues(Product.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Product]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<Product>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<ProductUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<ProductTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ProductTable>? orderBy,
    _i1.OrderByListBuilder<ProductTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<Product>(
      columnValues: columnValues(Product.t.updateTable),
      where: where(Product.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Product.t),
      orderByList: orderByList?.call(Product.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [Product]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Product>> delete(
    _i1.Session session,
    List<Product> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Product>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Product].
  Future<Product> deleteRow(
    _i1.Session session,
    Product row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Product>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Product>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<ProductTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Product>(
      where: where(Product.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ProductTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Product>(
      where: where?.call(Product.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
