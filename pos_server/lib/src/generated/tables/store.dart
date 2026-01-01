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

abstract class Store implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  Store._({
    this.id,
    required this.name,
    required this.email,
    required this.merchantId,
    this.type,
    this.createdAt,
    this.updatedAt,
  });

  factory Store({
    int? id,
    required String name,
    required String email,
    required _i1.UuidValue merchantId,
    String? type,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _StoreImpl;

  factory Store.fromJson(Map<String, dynamic> jsonSerialization) {
    return Store(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      email: jsonSerialization['email'] as String,
      merchantId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['merchantId'],
      ),
      type: jsonSerialization['type'] as String?,
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt: jsonSerialization['updatedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
    );
  }

  static final t = StoreTable();

  static const db = StoreRepository._();

  @override
  int? id;

  String name;

  String email;

  _i1.UuidValue merchantId;

  String? type;

  DateTime? createdAt;

  DateTime? updatedAt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [Store]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Store copyWith({
    int? id,
    String? name,
    String? email,
    _i1.UuidValue? merchantId,
    String? type,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Store',
      if (id != null) 'id': id,
      'name': name,
      'email': email,
      'merchantId': merchantId.toJson(),
      if (type != null) 'type': type,
      if (createdAt != null) 'createdAt': createdAt?.toJson(),
      if (updatedAt != null) 'updatedAt': updatedAt?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Store',
      if (id != null) 'id': id,
      'name': name,
      'email': email,
      'merchantId': merchantId.toJson(),
      if (type != null) 'type': type,
    };
  }

  static StoreInclude include() {
    return StoreInclude._();
  }

  static StoreIncludeList includeList({
    _i1.WhereExpressionBuilder<StoreTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<StoreTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<StoreTable>? orderByList,
    StoreInclude? include,
  }) {
    return StoreIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Store.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Store.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _StoreImpl extends Store {
  _StoreImpl({
    int? id,
    required String name,
    required String email,
    required _i1.UuidValue merchantId,
    String? type,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super._(
         id: id,
         name: name,
         email: email,
         merchantId: merchantId,
         type: type,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [Store]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Store copyWith({
    Object? id = _Undefined,
    String? name,
    String? email,
    _i1.UuidValue? merchantId,
    Object? type = _Undefined,
    Object? createdAt = _Undefined,
    Object? updatedAt = _Undefined,
  }) {
    return Store(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      merchantId: merchantId ?? this.merchantId,
      type: type is String? ? type : this.type,
      createdAt: createdAt is DateTime? ? createdAt : this.createdAt,
      updatedAt: updatedAt is DateTime? ? updatedAt : this.updatedAt,
    );
  }
}

class StoreUpdateTable extends _i1.UpdateTable<StoreTable> {
  StoreUpdateTable(super.table);

  _i1.ColumnValue<String, String> name(String value) => _i1.ColumnValue(
    table.name,
    value,
  );

  _i1.ColumnValue<String, String> email(String value) => _i1.ColumnValue(
    table.email,
    value,
  );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> merchantId(
    _i1.UuidValue value,
  ) => _i1.ColumnValue(
    table.merchantId,
    value,
  );

  _i1.ColumnValue<String, String> type(String? value) => _i1.ColumnValue(
    table.type,
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

class StoreTable extends _i1.Table<int?> {
  StoreTable({super.tableRelation}) : super(tableName: 'store') {
    updateTable = StoreUpdateTable(this);
    name = _i1.ColumnString(
      'name',
      this,
    );
    email = _i1.ColumnString(
      'email',
      this,
    );
    merchantId = _i1.ColumnUuid(
      'merchantId',
      this,
    );
    type = _i1.ColumnString(
      'type',
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

  late final StoreUpdateTable updateTable;

  late final _i1.ColumnString name;

  late final _i1.ColumnString email;

  late final _i1.ColumnUuid merchantId;

  late final _i1.ColumnString type;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  @override
  List<_i1.Column> get columns => [
    id,
    name,
    email,
    merchantId,
    type,
    createdAt,
    updatedAt,
  ];
}

class StoreInclude extends _i1.IncludeObject {
  StoreInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => Store.t;
}

class StoreIncludeList extends _i1.IncludeList {
  StoreIncludeList._({
    _i1.WhereExpressionBuilder<StoreTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Store.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Store.t;
}

class StoreRepository {
  const StoreRepository._();

  /// Returns a list of [Store]s matching the given query parameters.
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
  Future<List<Store>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<StoreTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<StoreTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<StoreTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Store>(
      where: where?.call(Store.t),
      orderBy: orderBy?.call(Store.t),
      orderByList: orderByList?.call(Store.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [Store] matching the given query parameters.
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
  Future<Store?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<StoreTable>? where,
    int? offset,
    _i1.OrderByBuilder<StoreTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<StoreTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Store>(
      where: where?.call(Store.t),
      orderBy: orderBy?.call(Store.t),
      orderByList: orderByList?.call(Store.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [Store] by its [id] or null if no such row exists.
  Future<Store?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Store>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [Store]s in the list and returns the inserted rows.
  ///
  /// The returned [Store]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Store>> insert(
    _i1.Session session,
    List<Store> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Store>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Store] and returns the inserted row.
  ///
  /// The returned [Store] will have its `id` field set.
  Future<Store> insertRow(
    _i1.Session session,
    Store row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Store>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Store]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Store>> update(
    _i1.Session session,
    List<Store> rows, {
    _i1.ColumnSelections<StoreTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Store>(
      rows,
      columns: columns?.call(Store.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Store]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Store> updateRow(
    _i1.Session session,
    Store row, {
    _i1.ColumnSelections<StoreTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Store>(
      row,
      columns: columns?.call(Store.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Store] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Store?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<StoreUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<Store>(
      id,
      columnValues: columnValues(Store.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Store]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<Store>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<StoreUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<StoreTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<StoreTable>? orderBy,
    _i1.OrderByListBuilder<StoreTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<Store>(
      columnValues: columnValues(Store.t.updateTable),
      where: where(Store.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Store.t),
      orderByList: orderByList?.call(Store.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [Store]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Store>> delete(
    _i1.Session session,
    List<Store> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Store>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Store].
  Future<Store> deleteRow(
    _i1.Session session,
    Store row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Store>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Store>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<StoreTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Store>(
      where: where(Store.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<StoreTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Store>(
      where: where?.call(Store.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
