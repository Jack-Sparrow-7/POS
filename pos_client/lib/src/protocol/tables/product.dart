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
import '../enums/product_status.dart' as _i2;
import '../session_info.dart' as _i3;
import 'package:pos_client/src/protocol/protocol.dart' as _i4;

abstract class Product implements _i1.SerializableModel {
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
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
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
    };
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
    );
  }
}
