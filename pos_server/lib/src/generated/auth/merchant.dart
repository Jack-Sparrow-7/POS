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

abstract class Merchant
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  Merchant._({
    this.id,
    required this.name,
    required this.businessName,
    required this.whatsappNumber,
    required this.email,
    required this.authUserId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Merchant({
    int? id,
    required String name,
    required String businessName,
    required String whatsappNumber,
    required String email,
    required _i1.UuidValue authUserId,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _MerchantImpl;

  factory Merchant.fromJson(Map<String, dynamic> jsonSerialization) {
    return Merchant(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      businessName: jsonSerialization['businessName'] as String,
      whatsappNumber: jsonSerialization['whatsappNumber'] as String,
      email: jsonSerialization['email'] as String,
      authUserId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['authUserId'],
      ),
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      updatedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['updatedAt'],
      ),
    );
  }

  static final t = MerchantTable();

  static const db = MerchantRepository._();

  @override
  int? id;

  String name;

  String businessName;

  String whatsappNumber;

  String email;

  _i1.UuidValue authUserId;

  DateTime createdAt;

  DateTime updatedAt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [Merchant]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Merchant copyWith({
    int? id,
    String? name,
    String? businessName,
    String? whatsappNumber,
    String? email,
    _i1.UuidValue? authUserId,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Merchant',
      if (id != null) 'id': id,
      'name': name,
      'businessName': businessName,
      'whatsappNumber': whatsappNumber,
      'email': email,
      'authUserId': authUserId.toJson(),
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Merchant',
      if (id != null) 'id': id,
      'name': name,
      'businessName': businessName,
      'whatsappNumber': whatsappNumber,
      'email': email,
      'authUserId': authUserId.toJson(),
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  static MerchantInclude include() {
    return MerchantInclude._();
  }

  static MerchantIncludeList includeList({
    _i1.WhereExpressionBuilder<MerchantTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<MerchantTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MerchantTable>? orderByList,
    MerchantInclude? include,
  }) {
    return MerchantIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Merchant.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Merchant.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _MerchantImpl extends Merchant {
  _MerchantImpl({
    int? id,
    required String name,
    required String businessName,
    required String whatsappNumber,
    required String email,
    required _i1.UuidValue authUserId,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : super._(
         id: id,
         name: name,
         businessName: businessName,
         whatsappNumber: whatsappNumber,
         email: email,
         authUserId: authUserId,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [Merchant]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Merchant copyWith({
    Object? id = _Undefined,
    String? name,
    String? businessName,
    String? whatsappNumber,
    String? email,
    _i1.UuidValue? authUserId,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Merchant(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      businessName: businessName ?? this.businessName,
      whatsappNumber: whatsappNumber ?? this.whatsappNumber,
      email: email ?? this.email,
      authUserId: authUserId ?? this.authUserId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

class MerchantUpdateTable extends _i1.UpdateTable<MerchantTable> {
  MerchantUpdateTable(super.table);

  _i1.ColumnValue<String, String> name(String value) => _i1.ColumnValue(
    table.name,
    value,
  );

  _i1.ColumnValue<String, String> businessName(String value) => _i1.ColumnValue(
    table.businessName,
    value,
  );

  _i1.ColumnValue<String, String> whatsappNumber(String value) =>
      _i1.ColumnValue(
        table.whatsappNumber,
        value,
      );

  _i1.ColumnValue<String, String> email(String value) => _i1.ColumnValue(
    table.email,
    value,
  );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> authUserId(
    _i1.UuidValue value,
  ) => _i1.ColumnValue(
    table.authUserId,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _i1.ColumnValue(
        table.createdAt,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> updatedAt(DateTime value) =>
      _i1.ColumnValue(
        table.updatedAt,
        value,
      );
}

class MerchantTable extends _i1.Table<int?> {
  MerchantTable({super.tableRelation}) : super(tableName: 'merchant') {
    updateTable = MerchantUpdateTable(this);
    name = _i1.ColumnString(
      'name',
      this,
    );
    businessName = _i1.ColumnString(
      'businessName',
      this,
    );
    whatsappNumber = _i1.ColumnString(
      'whatsappNumber',
      this,
    );
    email = _i1.ColumnString(
      'email',
      this,
    );
    authUserId = _i1.ColumnUuid(
      'authUserId',
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

  late final MerchantUpdateTable updateTable;

  late final _i1.ColumnString name;

  late final _i1.ColumnString businessName;

  late final _i1.ColumnString whatsappNumber;

  late final _i1.ColumnString email;

  late final _i1.ColumnUuid authUserId;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  @override
  List<_i1.Column> get columns => [
    id,
    name,
    businessName,
    whatsappNumber,
    email,
    authUserId,
    createdAt,
    updatedAt,
  ];
}

class MerchantInclude extends _i1.IncludeObject {
  MerchantInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => Merchant.t;
}

class MerchantIncludeList extends _i1.IncludeList {
  MerchantIncludeList._({
    _i1.WhereExpressionBuilder<MerchantTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Merchant.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Merchant.t;
}

class MerchantRepository {
  const MerchantRepository._();

  /// Returns a list of [Merchant]s matching the given query parameters.
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
  Future<List<Merchant>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MerchantTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<MerchantTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MerchantTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Merchant>(
      where: where?.call(Merchant.t),
      orderBy: orderBy?.call(Merchant.t),
      orderByList: orderByList?.call(Merchant.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [Merchant] matching the given query parameters.
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
  Future<Merchant?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MerchantTable>? where,
    int? offset,
    _i1.OrderByBuilder<MerchantTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MerchantTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Merchant>(
      where: where?.call(Merchant.t),
      orderBy: orderBy?.call(Merchant.t),
      orderByList: orderByList?.call(Merchant.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [Merchant] by its [id] or null if no such row exists.
  Future<Merchant?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Merchant>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [Merchant]s in the list and returns the inserted rows.
  ///
  /// The returned [Merchant]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Merchant>> insert(
    _i1.Session session,
    List<Merchant> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Merchant>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Merchant] and returns the inserted row.
  ///
  /// The returned [Merchant] will have its `id` field set.
  Future<Merchant> insertRow(
    _i1.Session session,
    Merchant row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Merchant>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Merchant]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Merchant>> update(
    _i1.Session session,
    List<Merchant> rows, {
    _i1.ColumnSelections<MerchantTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Merchant>(
      rows,
      columns: columns?.call(Merchant.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Merchant]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Merchant> updateRow(
    _i1.Session session,
    Merchant row, {
    _i1.ColumnSelections<MerchantTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Merchant>(
      row,
      columns: columns?.call(Merchant.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Merchant] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Merchant?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<MerchantUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<Merchant>(
      id,
      columnValues: columnValues(Merchant.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Merchant]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<Merchant>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<MerchantUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<MerchantTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<MerchantTable>? orderBy,
    _i1.OrderByListBuilder<MerchantTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<Merchant>(
      columnValues: columnValues(Merchant.t.updateTable),
      where: where(Merchant.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Merchant.t),
      orderByList: orderByList?.call(Merchant.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [Merchant]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Merchant>> delete(
    _i1.Session session,
    List<Merchant> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Merchant>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Merchant].
  Future<Merchant> deleteRow(
    _i1.Session session,
    Merchant row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Merchant>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Merchant>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<MerchantTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Merchant>(
      where: where(Merchant.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MerchantTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Merchant>(
      where: where?.call(Merchant.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
