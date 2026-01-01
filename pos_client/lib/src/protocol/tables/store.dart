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

abstract class Store implements _i1.SerializableModel {
  Store._({
    this.id,
    required this.name,
    required this.email,
    required this.merchantId,
    this.type,
  });

  factory Store({
    int? id,
    required String name,
    required String email,
    required _i1.UuidValue merchantId,
    String? type,
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
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String name;

  String email;

  _i1.UuidValue merchantId;

  String? type;

  /// Returns a shallow copy of this [Store]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Store copyWith({
    int? id,
    String? name,
    String? email,
    _i1.UuidValue? merchantId,
    String? type,
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
    };
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
  }) : super._(
         id: id,
         name: name,
         email: email,
         merchantId: merchantId,
         type: type,
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
  }) {
    return Store(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      merchantId: merchantId ?? this.merchantId,
      type: type is String? ? type : this.type,
    );
  }
}
