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

abstract class Counter implements _i1.SerializableModel {
  Counter._({
    this.id,
    required this.name,
    required this.merchantId,
    required this.storeId,
  });

  factory Counter({
    int? id,
    required String name,
    required _i1.UuidValue merchantId,
    required int storeId,
  }) = _CounterImpl;

  factory Counter.fromJson(Map<String, dynamic> jsonSerialization) {
    return Counter(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      merchantId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['merchantId'],
      ),
      storeId: jsonSerialization['storeId'] as int,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String name;

  _i1.UuidValue merchantId;

  int storeId;

  /// Returns a shallow copy of this [Counter]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Counter copyWith({
    int? id,
    String? name,
    _i1.UuidValue? merchantId,
    int? storeId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Counter',
      if (id != null) 'id': id,
      'name': name,
      'merchantId': merchantId.toJson(),
      'storeId': storeId,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CounterImpl extends Counter {
  _CounterImpl({
    int? id,
    required String name,
    required _i1.UuidValue merchantId,
    required int storeId,
  }) : super._(
         id: id,
         name: name,
         merchantId: merchantId,
         storeId: storeId,
       );

  /// Returns a shallow copy of this [Counter]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Counter copyWith({
    Object? id = _Undefined,
    String? name,
    _i1.UuidValue? merchantId,
    int? storeId,
  }) {
    return Counter(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      merchantId: merchantId ?? this.merchantId,
      storeId: storeId ?? this.storeId,
    );
  }
}
