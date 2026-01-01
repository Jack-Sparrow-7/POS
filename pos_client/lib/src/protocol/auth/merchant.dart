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

abstract class Merchant implements _i1.SerializableModel {
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

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String name;

  String businessName;

  String whatsappNumber;

  String email;

  _i1.UuidValue authUserId;

  DateTime createdAt;

  DateTime updatedAt;

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
