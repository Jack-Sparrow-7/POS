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
import '../enums/stock_movement_type.dart' as _i2;
import '../enums/stock_reference_type.dart' as _i3;

abstract class StockLog
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  StockLog._({
    this.id,
    required this.storeId,
    required this.productId,
    required this.movementType,
    required this.quantity,
    required this.referenceType,
    this.orderId,
    this.remarks,
    required this.stockBefore,
    required this.stockAfter,
    required this.movementAt,
    this.createdAt,
  });

  factory StockLog({
    int? id,
    required int storeId,
    required int productId,
    required _i2.StockMovementType movementType,
    required int quantity,
    required _i3.StockReferenceType referenceType,
    int? orderId,
    String? remarks,
    required int stockBefore,
    required int stockAfter,
    required DateTime movementAt,
    DateTime? createdAt,
  }) = _StockLogImpl;

  factory StockLog.fromJson(Map<String, dynamic> jsonSerialization) {
    return StockLog(
      id: jsonSerialization['id'] as int?,
      storeId: jsonSerialization['storeId'] as int,
      productId: jsonSerialization['productId'] as int,
      movementType: _i2.StockMovementType.fromJson(
        (jsonSerialization['movementType'] as String),
      ),
      quantity: jsonSerialization['quantity'] as int,
      referenceType: _i3.StockReferenceType.fromJson(
        (jsonSerialization['referenceType'] as String),
      ),
      orderId: jsonSerialization['orderId'] as int?,
      remarks: jsonSerialization['remarks'] as String?,
      stockBefore: jsonSerialization['stockBefore'] as int,
      stockAfter: jsonSerialization['stockAfter'] as int,
      movementAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['movementAt'],
      ),
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  static final t = StockLogTable();

  static const db = StockLogRepository._();

  @override
  int? id;

  int storeId;

  int productId;

  _i2.StockMovementType movementType;

  int quantity;

  _i3.StockReferenceType referenceType;

  int? orderId;

  String? remarks;

  int stockBefore;

  int stockAfter;

  DateTime movementAt;

  DateTime? createdAt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [StockLog]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  StockLog copyWith({
    int? id,
    int? storeId,
    int? productId,
    _i2.StockMovementType? movementType,
    int? quantity,
    _i3.StockReferenceType? referenceType,
    int? orderId,
    String? remarks,
    int? stockBefore,
    int? stockAfter,
    DateTime? movementAt,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'StockLog',
      if (id != null) 'id': id,
      'storeId': storeId,
      'productId': productId,
      'movementType': movementType.toJson(),
      'quantity': quantity,
      'referenceType': referenceType.toJson(),
      if (orderId != null) 'orderId': orderId,
      if (remarks != null) 'remarks': remarks,
      'stockBefore': stockBefore,
      'stockAfter': stockAfter,
      'movementAt': movementAt.toJson(),
      if (createdAt != null) 'createdAt': createdAt?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'StockLog',
      if (id != null) 'id': id,
      'storeId': storeId,
      'productId': productId,
      'movementType': movementType.toJson(),
      'quantity': quantity,
      'referenceType': referenceType.toJson(),
      if (orderId != null) 'orderId': orderId,
      if (remarks != null) 'remarks': remarks,
      'stockBefore': stockBefore,
      'stockAfter': stockAfter,
      'movementAt': movementAt.toJson(),
    };
  }

  static StockLogInclude include() {
    return StockLogInclude._();
  }

  static StockLogIncludeList includeList({
    _i1.WhereExpressionBuilder<StockLogTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<StockLogTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<StockLogTable>? orderByList,
    StockLogInclude? include,
  }) {
    return StockLogIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(StockLog.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(StockLog.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _StockLogImpl extends StockLog {
  _StockLogImpl({
    int? id,
    required int storeId,
    required int productId,
    required _i2.StockMovementType movementType,
    required int quantity,
    required _i3.StockReferenceType referenceType,
    int? orderId,
    String? remarks,
    required int stockBefore,
    required int stockAfter,
    required DateTime movementAt,
    DateTime? createdAt,
  }) : super._(
         id: id,
         storeId: storeId,
         productId: productId,
         movementType: movementType,
         quantity: quantity,
         referenceType: referenceType,
         orderId: orderId,
         remarks: remarks,
         stockBefore: stockBefore,
         stockAfter: stockAfter,
         movementAt: movementAt,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [StockLog]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  StockLog copyWith({
    Object? id = _Undefined,
    int? storeId,
    int? productId,
    _i2.StockMovementType? movementType,
    int? quantity,
    _i3.StockReferenceType? referenceType,
    Object? orderId = _Undefined,
    Object? remarks = _Undefined,
    int? stockBefore,
    int? stockAfter,
    DateTime? movementAt,
    Object? createdAt = _Undefined,
  }) {
    return StockLog(
      id: id is int? ? id : this.id,
      storeId: storeId ?? this.storeId,
      productId: productId ?? this.productId,
      movementType: movementType ?? this.movementType,
      quantity: quantity ?? this.quantity,
      referenceType: referenceType ?? this.referenceType,
      orderId: orderId is int? ? orderId : this.orderId,
      remarks: remarks is String? ? remarks : this.remarks,
      stockBefore: stockBefore ?? this.stockBefore,
      stockAfter: stockAfter ?? this.stockAfter,
      movementAt: movementAt ?? this.movementAt,
      createdAt: createdAt is DateTime? ? createdAt : this.createdAt,
    );
  }
}

class StockLogUpdateTable extends _i1.UpdateTable<StockLogTable> {
  StockLogUpdateTable(super.table);

  _i1.ColumnValue<int, int> storeId(int value) => _i1.ColumnValue(
    table.storeId,
    value,
  );

  _i1.ColumnValue<int, int> productId(int value) => _i1.ColumnValue(
    table.productId,
    value,
  );

  _i1.ColumnValue<_i2.StockMovementType, _i2.StockMovementType> movementType(
    _i2.StockMovementType value,
  ) => _i1.ColumnValue(
    table.movementType,
    value,
  );

  _i1.ColumnValue<int, int> quantity(int value) => _i1.ColumnValue(
    table.quantity,
    value,
  );

  _i1.ColumnValue<_i3.StockReferenceType, _i3.StockReferenceType> referenceType(
    _i3.StockReferenceType value,
  ) => _i1.ColumnValue(
    table.referenceType,
    value,
  );

  _i1.ColumnValue<int, int> orderId(int? value) => _i1.ColumnValue(
    table.orderId,
    value,
  );

  _i1.ColumnValue<String, String> remarks(String? value) => _i1.ColumnValue(
    table.remarks,
    value,
  );

  _i1.ColumnValue<int, int> stockBefore(int value) => _i1.ColumnValue(
    table.stockBefore,
    value,
  );

  _i1.ColumnValue<int, int> stockAfter(int value) => _i1.ColumnValue(
    table.stockAfter,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> movementAt(DateTime value) =>
      _i1.ColumnValue(
        table.movementAt,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> createdAt(DateTime? value) =>
      _i1.ColumnValue(
        table.createdAt,
        value,
      );
}

class StockLogTable extends _i1.Table<int?> {
  StockLogTable({super.tableRelation}) : super(tableName: 'stock_log') {
    updateTable = StockLogUpdateTable(this);
    storeId = _i1.ColumnInt(
      'storeId',
      this,
    );
    productId = _i1.ColumnInt(
      'productId',
      this,
    );
    movementType = _i1.ColumnEnum(
      'movementType',
      this,
      _i1.EnumSerialization.byName,
    );
    quantity = _i1.ColumnInt(
      'quantity',
      this,
    );
    referenceType = _i1.ColumnEnum(
      'referenceType',
      this,
      _i1.EnumSerialization.byName,
    );
    orderId = _i1.ColumnInt(
      'orderId',
      this,
    );
    remarks = _i1.ColumnString(
      'remarks',
      this,
    );
    stockBefore = _i1.ColumnInt(
      'stockBefore',
      this,
    );
    stockAfter = _i1.ColumnInt(
      'stockAfter',
      this,
    );
    movementAt = _i1.ColumnDateTime(
      'movementAt',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
    );
  }

  late final StockLogUpdateTable updateTable;

  late final _i1.ColumnInt storeId;

  late final _i1.ColumnInt productId;

  late final _i1.ColumnEnum<_i2.StockMovementType> movementType;

  late final _i1.ColumnInt quantity;

  late final _i1.ColumnEnum<_i3.StockReferenceType> referenceType;

  late final _i1.ColumnInt orderId;

  late final _i1.ColumnString remarks;

  late final _i1.ColumnInt stockBefore;

  late final _i1.ColumnInt stockAfter;

  late final _i1.ColumnDateTime movementAt;

  late final _i1.ColumnDateTime createdAt;

  @override
  List<_i1.Column> get columns => [
    id,
    storeId,
    productId,
    movementType,
    quantity,
    referenceType,
    orderId,
    remarks,
    stockBefore,
    stockAfter,
    movementAt,
    createdAt,
  ];
}

class StockLogInclude extends _i1.IncludeObject {
  StockLogInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => StockLog.t;
}

class StockLogIncludeList extends _i1.IncludeList {
  StockLogIncludeList._({
    _i1.WhereExpressionBuilder<StockLogTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(StockLog.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => StockLog.t;
}

class StockLogRepository {
  const StockLogRepository._();

  /// Returns a list of [StockLog]s matching the given query parameters.
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
  Future<List<StockLog>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<StockLogTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<StockLogTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<StockLogTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<StockLog>(
      where: where?.call(StockLog.t),
      orderBy: orderBy?.call(StockLog.t),
      orderByList: orderByList?.call(StockLog.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [StockLog] matching the given query parameters.
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
  Future<StockLog?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<StockLogTable>? where,
    int? offset,
    _i1.OrderByBuilder<StockLogTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<StockLogTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<StockLog>(
      where: where?.call(StockLog.t),
      orderBy: orderBy?.call(StockLog.t),
      orderByList: orderByList?.call(StockLog.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [StockLog] by its [id] or null if no such row exists.
  Future<StockLog?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<StockLog>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [StockLog]s in the list and returns the inserted rows.
  ///
  /// The returned [StockLog]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<StockLog>> insert(
    _i1.Session session,
    List<StockLog> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<StockLog>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [StockLog] and returns the inserted row.
  ///
  /// The returned [StockLog] will have its `id` field set.
  Future<StockLog> insertRow(
    _i1.Session session,
    StockLog row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<StockLog>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [StockLog]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<StockLog>> update(
    _i1.Session session,
    List<StockLog> rows, {
    _i1.ColumnSelections<StockLogTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<StockLog>(
      rows,
      columns: columns?.call(StockLog.t),
      transaction: transaction,
    );
  }

  /// Updates a single [StockLog]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<StockLog> updateRow(
    _i1.Session session,
    StockLog row, {
    _i1.ColumnSelections<StockLogTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<StockLog>(
      row,
      columns: columns?.call(StockLog.t),
      transaction: transaction,
    );
  }

  /// Updates a single [StockLog] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<StockLog?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<StockLogUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<StockLog>(
      id,
      columnValues: columnValues(StockLog.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [StockLog]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<StockLog>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<StockLogUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<StockLogTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<StockLogTable>? orderBy,
    _i1.OrderByListBuilder<StockLogTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<StockLog>(
      columnValues: columnValues(StockLog.t.updateTable),
      where: where(StockLog.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(StockLog.t),
      orderByList: orderByList?.call(StockLog.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [StockLog]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<StockLog>> delete(
    _i1.Session session,
    List<StockLog> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<StockLog>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [StockLog].
  Future<StockLog> deleteRow(
    _i1.Session session,
    StockLog row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<StockLog>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<StockLog>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<StockLogTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<StockLog>(
      where: where(StockLog.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<StockLogTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<StockLog>(
      where: where?.call(StockLog.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
