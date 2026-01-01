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
import '../enums/stock_movement_type.dart' as _i2;
import '../enums/stock_reference_type.dart' as _i3;

abstract class StockLog implements _i1.SerializableModel {
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
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
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
    };
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
    );
  }
}
