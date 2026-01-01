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

abstract class StockSummary implements _i1.SerializableModel {
  StockSummary._({
    required this.productId,
    required this.productName,
    required this.openingStock,
    required this.stockIn,
    required this.stockOut,
    required this.wastage,
    required this.adjustment,
    required this.closingStock,
  });

  factory StockSummary({
    required int productId,
    required String productName,
    required int openingStock,
    required int stockIn,
    required int stockOut,
    required int wastage,
    required int adjustment,
    required int closingStock,
  }) = _StockSummaryImpl;

  factory StockSummary.fromJson(Map<String, dynamic> jsonSerialization) {
    return StockSummary(
      productId: jsonSerialization['productId'] as int,
      productName: jsonSerialization['productName'] as String,
      openingStock: jsonSerialization['openingStock'] as int,
      stockIn: jsonSerialization['stockIn'] as int,
      stockOut: jsonSerialization['stockOut'] as int,
      wastage: jsonSerialization['wastage'] as int,
      adjustment: jsonSerialization['adjustment'] as int,
      closingStock: jsonSerialization['closingStock'] as int,
    );
  }

  int productId;

  String productName;

  int openingStock;

  int stockIn;

  int stockOut;

  int wastage;

  int adjustment;

  int closingStock;

  /// Returns a shallow copy of this [StockSummary]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  StockSummary copyWith({
    int? productId,
    String? productName,
    int? openingStock,
    int? stockIn,
    int? stockOut,
    int? wastage,
    int? adjustment,
    int? closingStock,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'StockSummary',
      'productId': productId,
      'productName': productName,
      'openingStock': openingStock,
      'stockIn': stockIn,
      'stockOut': stockOut,
      'wastage': wastage,
      'adjustment': adjustment,
      'closingStock': closingStock,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _StockSummaryImpl extends StockSummary {
  _StockSummaryImpl({
    required int productId,
    required String productName,
    required int openingStock,
    required int stockIn,
    required int stockOut,
    required int wastage,
    required int adjustment,
    required int closingStock,
  }) : super._(
         productId: productId,
         productName: productName,
         openingStock: openingStock,
         stockIn: stockIn,
         stockOut: stockOut,
         wastage: wastage,
         adjustment: adjustment,
         closingStock: closingStock,
       );

  /// Returns a shallow copy of this [StockSummary]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  StockSummary copyWith({
    int? productId,
    String? productName,
    int? openingStock,
    int? stockIn,
    int? stockOut,
    int? wastage,
    int? adjustment,
    int? closingStock,
  }) {
    return StockSummary(
      productId: productId ?? this.productId,
      productName: productName ?? this.productName,
      openingStock: openingStock ?? this.openingStock,
      stockIn: stockIn ?? this.stockIn,
      stockOut: stockOut ?? this.stockOut,
      wastage: wastage ?? this.wastage,
      adjustment: adjustment ?? this.adjustment,
      closingStock: closingStock ?? this.closingStock,
    );
  }
}
