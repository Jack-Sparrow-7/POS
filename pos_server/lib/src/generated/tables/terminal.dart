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

abstract class Terminal
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  Terminal._({
    this.id,
    required this.name,
    required this.email,
    required this.storeId,
    required this.merchantId,
    this.password,
    required this.terminalNumber,
    this.createdAt,
    this.updatedAt,
  });

  factory Terminal({
    int? id,
    required String name,
    required String email,
    required int storeId,
    required _i1.UuidValue merchantId,
    String? password,
    required String terminalNumber,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _TerminalImpl;

  factory Terminal.fromJson(Map<String, dynamic> jsonSerialization) {
    return Terminal(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      email: jsonSerialization['email'] as String,
      storeId: jsonSerialization['storeId'] as int,
      merchantId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['merchantId'],
      ),
      password: jsonSerialization['password'] as String?,
      terminalNumber: jsonSerialization['terminalNumber'] as String,
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt: jsonSerialization['updatedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
    );
  }

  static final t = TerminalTable();

  static const db = TerminalRepository._();

  @override
  int? id;

  String name;

  String email;

  int storeId;

  _i1.UuidValue merchantId;

  String? password;

  String terminalNumber;

  DateTime? createdAt;

  DateTime? updatedAt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [Terminal]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Terminal copyWith({
    int? id,
    String? name,
    String? email,
    int? storeId,
    _i1.UuidValue? merchantId,
    String? password,
    String? terminalNumber,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Terminal',
      if (id != null) 'id': id,
      'name': name,
      'email': email,
      'storeId': storeId,
      'merchantId': merchantId.toJson(),
      if (password != null) 'password': password,
      'terminalNumber': terminalNumber,
      if (createdAt != null) 'createdAt': createdAt?.toJson(),
      if (updatedAt != null) 'updatedAt': updatedAt?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Terminal',
      if (id != null) 'id': id,
      'name': name,
      'email': email,
      'storeId': storeId,
      'merchantId': merchantId.toJson(),
      'terminalNumber': terminalNumber,
    };
  }

  static TerminalInclude include() {
    return TerminalInclude._();
  }

  static TerminalIncludeList includeList({
    _i1.WhereExpressionBuilder<TerminalTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TerminalTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TerminalTable>? orderByList,
    TerminalInclude? include,
  }) {
    return TerminalIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Terminal.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Terminal.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _TerminalImpl extends Terminal {
  _TerminalImpl({
    int? id,
    required String name,
    required String email,
    required int storeId,
    required _i1.UuidValue merchantId,
    String? password,
    required String terminalNumber,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super._(
         id: id,
         name: name,
         email: email,
         storeId: storeId,
         merchantId: merchantId,
         password: password,
         terminalNumber: terminalNumber,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [Terminal]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Terminal copyWith({
    Object? id = _Undefined,
    String? name,
    String? email,
    int? storeId,
    _i1.UuidValue? merchantId,
    Object? password = _Undefined,
    String? terminalNumber,
    Object? createdAt = _Undefined,
    Object? updatedAt = _Undefined,
  }) {
    return Terminal(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      storeId: storeId ?? this.storeId,
      merchantId: merchantId ?? this.merchantId,
      password: password is String? ? password : this.password,
      terminalNumber: terminalNumber ?? this.terminalNumber,
      createdAt: createdAt is DateTime? ? createdAt : this.createdAt,
      updatedAt: updatedAt is DateTime? ? updatedAt : this.updatedAt,
    );
  }
}

class TerminalUpdateTable extends _i1.UpdateTable<TerminalTable> {
  TerminalUpdateTable(super.table);

  _i1.ColumnValue<String, String> name(String value) => _i1.ColumnValue(
    table.name,
    value,
  );

  _i1.ColumnValue<String, String> email(String value) => _i1.ColumnValue(
    table.email,
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

  _i1.ColumnValue<String, String> password(String? value) => _i1.ColumnValue(
    table.password,
    value,
  );

  _i1.ColumnValue<String, String> terminalNumber(String value) =>
      _i1.ColumnValue(
        table.terminalNumber,
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

class TerminalTable extends _i1.Table<int?> {
  TerminalTable({super.tableRelation}) : super(tableName: 'terminal') {
    updateTable = TerminalUpdateTable(this);
    name = _i1.ColumnString(
      'name',
      this,
    );
    email = _i1.ColumnString(
      'email',
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
    password = _i1.ColumnString(
      'password',
      this,
    );
    terminalNumber = _i1.ColumnString(
      'terminalNumber',
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

  late final TerminalUpdateTable updateTable;

  late final _i1.ColumnString name;

  late final _i1.ColumnString email;

  late final _i1.ColumnInt storeId;

  late final _i1.ColumnUuid merchantId;

  late final _i1.ColumnString password;

  late final _i1.ColumnString terminalNumber;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  @override
  List<_i1.Column> get columns => [
    id,
    name,
    email,
    storeId,
    merchantId,
    password,
    terminalNumber,
    createdAt,
    updatedAt,
  ];
}

class TerminalInclude extends _i1.IncludeObject {
  TerminalInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => Terminal.t;
}

class TerminalIncludeList extends _i1.IncludeList {
  TerminalIncludeList._({
    _i1.WhereExpressionBuilder<TerminalTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Terminal.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Terminal.t;
}

class TerminalRepository {
  const TerminalRepository._();

  /// Returns a list of [Terminal]s matching the given query parameters.
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
  Future<List<Terminal>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TerminalTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TerminalTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TerminalTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Terminal>(
      where: where?.call(Terminal.t),
      orderBy: orderBy?.call(Terminal.t),
      orderByList: orderByList?.call(Terminal.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [Terminal] matching the given query parameters.
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
  Future<Terminal?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TerminalTable>? where,
    int? offset,
    _i1.OrderByBuilder<TerminalTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TerminalTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Terminal>(
      where: where?.call(Terminal.t),
      orderBy: orderBy?.call(Terminal.t),
      orderByList: orderByList?.call(Terminal.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [Terminal] by its [id] or null if no such row exists.
  Future<Terminal?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Terminal>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [Terminal]s in the list and returns the inserted rows.
  ///
  /// The returned [Terminal]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Terminal>> insert(
    _i1.Session session,
    List<Terminal> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Terminal>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Terminal] and returns the inserted row.
  ///
  /// The returned [Terminal] will have its `id` field set.
  Future<Terminal> insertRow(
    _i1.Session session,
    Terminal row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Terminal>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Terminal]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Terminal>> update(
    _i1.Session session,
    List<Terminal> rows, {
    _i1.ColumnSelections<TerminalTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Terminal>(
      rows,
      columns: columns?.call(Terminal.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Terminal]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Terminal> updateRow(
    _i1.Session session,
    Terminal row, {
    _i1.ColumnSelections<TerminalTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Terminal>(
      row,
      columns: columns?.call(Terminal.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Terminal] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Terminal?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<TerminalUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<Terminal>(
      id,
      columnValues: columnValues(Terminal.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Terminal]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<Terminal>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<TerminalUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<TerminalTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TerminalTable>? orderBy,
    _i1.OrderByListBuilder<TerminalTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<Terminal>(
      columnValues: columnValues(Terminal.t.updateTable),
      where: where(Terminal.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Terminal.t),
      orderByList: orderByList?.call(Terminal.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [Terminal]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Terminal>> delete(
    _i1.Session session,
    List<Terminal> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Terminal>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Terminal].
  Future<Terminal> deleteRow(
    _i1.Session session,
    Terminal row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Terminal>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Terminal>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<TerminalTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Terminal>(
      where: where(Terminal.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TerminalTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Terminal>(
      where: where?.call(Terminal.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
