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
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class Terminal implements _i1.SerializableModel {
  Terminal._({
    this.id,
    required this.name,
    required this.email,
    required this.storeId,
    required this.merchantId,
    required this.terminalNumber,
  });

  factory Terminal({
    int? id,
    required String name,
    required String email,
    required int storeId,
    required _i1.UuidValue merchantId,
    required String terminalNumber,
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
      terminalNumber: jsonSerialization['terminalNumber'] as String,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String name;

  String email;

  int storeId;

  _i1.UuidValue merchantId;

  String terminalNumber;

  /// Returns a shallow copy of this [Terminal]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Terminal copyWith({
    int? id,
    String? name,
    String? email,
    int? storeId,
    _i1.UuidValue? merchantId,
    String? terminalNumber,
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
      'terminalNumber': terminalNumber,
    };
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
    required String terminalNumber,
  }) : super._(
         id: id,
         name: name,
         email: email,
         storeId: storeId,
         merchantId: merchantId,
         terminalNumber: terminalNumber,
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
    String? terminalNumber,
  }) {
    return Terminal(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      storeId: storeId ?? this.storeId,
      merchantId: merchantId ?? this.merchantId,
      terminalNumber: terminalNumber ?? this.terminalNumber,
    );
  }
}
