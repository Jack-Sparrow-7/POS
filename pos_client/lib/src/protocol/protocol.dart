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
import 'auth/customer.dart' as _i2;
import 'auth/merchant.dart' as _i3;
import 'enums/day.dart' as _i4;
import 'enums/product_status.dart' as _i5;
import 'enums/stock_movement_type.dart' as _i6;
import 'enums/stock_reference_type.dart' as _i7;
import 'exceptions/not_found_exception.dart' as _i8;
import 'exceptions/validation_exception.dart' as _i9;
import 'responses/api_response.dart' as _i10;
import 'session_info.dart' as _i11;
import 'stock_summary.dart' as _i12;
import 'tables/category.dart' as _i13;
import 'tables/counter.dart' as _i14;
import 'tables/product.dart' as _i15;
import 'tables/stock_log.dart' as _i16;
import 'tables/store.dart' as _i17;
import 'tables/terminal.dart' as _i18;
import 'time_slot.dart' as _i19;
import 'package:serverpod_auth_core_client/serverpod_auth_core_client.dart'
    as _i20;
import 'package:pos_client/src/protocol/tables/category.dart' as _i21;
import 'package:pos_client/src/protocol/tables/counter.dart' as _i22;
import 'package:pos_client/src/protocol/auth/customer.dart' as _i23;
import 'package:pos_client/src/protocol/auth/merchant.dart' as _i24;
import 'package:pos_client/src/protocol/tables/product.dart' as _i25;
import 'package:pos_client/src/protocol/tables/stock_log.dart' as _i26;
import 'package:pos_client/src/protocol/tables/store.dart' as _i27;
import 'package:pos_client/src/protocol/tables/terminal.dart' as _i28;
import 'package:serverpod_auth_idp_client/serverpod_auth_idp_client.dart'
    as _i29;
export 'auth/customer.dart';
export 'auth/merchant.dart';
export 'enums/day.dart';
export 'enums/product_status.dart';
export 'enums/stock_movement_type.dart';
export 'enums/stock_reference_type.dart';
export 'exceptions/not_found_exception.dart';
export 'exceptions/validation_exception.dart';
export 'responses/api_response.dart';
export 'session_info.dart';
export 'stock_summary.dart';
export 'tables/category.dart';
export 'tables/counter.dart';
export 'tables/product.dart';
export 'tables/stock_log.dart';
export 'tables/store.dart';
export 'tables/terminal.dart';
export 'time_slot.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  static String? getClassNameFromObjectJson(dynamic data) {
    if (data is! Map) return null;
    final className = data['__className__'] as String?;
    return className;
  }

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;

    final dataClassName = getClassNameFromObjectJson(data);
    if (dataClassName != null && dataClassName != getClassNameForType(t)) {
      try {
        return deserializeByClassName({
          'className': dataClassName,
          'data': data,
        });
      } on FormatException catch (_) {
        // If the className is not recognized (e.g., older client receiving
        // data with a new subtype), fall back to deserializing without the
        // className, using the expected type T.
      }
    }

    if (t == _i2.Customer) {
      return _i2.Customer.fromJson(data) as T;
    }
    if (t == _i3.Merchant) {
      return _i3.Merchant.fromJson(data) as T;
    }
    if (t == _i4.Day) {
      return _i4.Day.fromJson(data) as T;
    }
    if (t == _i5.ProductStatus) {
      return _i5.ProductStatus.fromJson(data) as T;
    }
    if (t == _i6.StockMovementType) {
      return _i6.StockMovementType.fromJson(data) as T;
    }
    if (t == _i7.StockReferenceType) {
      return _i7.StockReferenceType.fromJson(data) as T;
    }
    if (t == _i8.NotFoundException) {
      return _i8.NotFoundException.fromJson(data) as T;
    }
    if (t == _i9.ValidationException) {
      return _i9.ValidationException.fromJson(data) as T;
    }
    if (t == _i10.ApiResponse) {
      return _i10.ApiResponse.fromJson(data) as T;
    }
    if (t == _i11.SessionInfo) {
      return _i11.SessionInfo.fromJson(data) as T;
    }
    if (t == _i12.StockSummary) {
      return _i12.StockSummary.fromJson(data) as T;
    }
    if (t == _i13.Category) {
      return _i13.Category.fromJson(data) as T;
    }
    if (t == _i14.Counter) {
      return _i14.Counter.fromJson(data) as T;
    }
    if (t == _i15.Product) {
      return _i15.Product.fromJson(data) as T;
    }
    if (t == _i16.StockLog) {
      return _i16.StockLog.fromJson(data) as T;
    }
    if (t == _i17.Store) {
      return _i17.Store.fromJson(data) as T;
    }
    if (t == _i18.Terminal) {
      return _i18.Terminal.fromJson(data) as T;
    }
    if (t == _i19.TimeSlot) {
      return _i19.TimeSlot.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.Customer?>()) {
      return (data != null ? _i2.Customer.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.Merchant?>()) {
      return (data != null ? _i3.Merchant.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.Day?>()) {
      return (data != null ? _i4.Day.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.ProductStatus?>()) {
      return (data != null ? _i5.ProductStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.StockMovementType?>()) {
      return (data != null ? _i6.StockMovementType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.StockReferenceType?>()) {
      return (data != null ? _i7.StockReferenceType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.NotFoundException?>()) {
      return (data != null ? _i8.NotFoundException.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.ValidationException?>()) {
      return (data != null ? _i9.ValidationException.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i10.ApiResponse?>()) {
      return (data != null ? _i10.ApiResponse.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.SessionInfo?>()) {
      return (data != null ? _i11.SessionInfo.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.StockSummary?>()) {
      return (data != null ? _i12.StockSummary.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i13.Category?>()) {
      return (data != null ? _i13.Category.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i14.Counter?>()) {
      return (data != null ? _i14.Counter.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i15.Product?>()) {
      return (data != null ? _i15.Product.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i16.StockLog?>()) {
      return (data != null ? _i16.StockLog.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i17.Store?>()) {
      return (data != null ? _i17.Store.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i18.Terminal?>()) {
      return (data != null ? _i18.Terminal.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i19.TimeSlot?>()) {
      return (data != null ? _i19.TimeSlot.fromJson(data) : null) as T;
    }
    if (t == List<_i19.TimeSlot>) {
      return (data as List).map((e) => deserialize<_i19.TimeSlot>(e)).toList()
          as T;
    }
    if (t == List<_i20.AuthUserModel>) {
      return (data as List)
              .map((e) => deserialize<_i20.AuthUserModel>(e))
              .toList()
          as T;
    }
    if (t == List<_i21.Category>) {
      return (data as List).map((e) => deserialize<_i21.Category>(e)).toList()
          as T;
    }
    if (t == List<_i22.Counter>) {
      return (data as List).map((e) => deserialize<_i22.Counter>(e)).toList()
          as T;
    }
    if (t == List<_i23.Customer>) {
      return (data as List).map((e) => deserialize<_i23.Customer>(e)).toList()
          as T;
    }
    if (t == List<_i24.Merchant>) {
      return (data as List).map((e) => deserialize<_i24.Merchant>(e)).toList()
          as T;
    }
    if (t == List<_i25.Product>) {
      return (data as List).map((e) => deserialize<_i25.Product>(e)).toList()
          as T;
    }
    if (t == List<_i26.StockLog>) {
      return (data as List).map((e) => deserialize<_i26.StockLog>(e)).toList()
          as T;
    }
    if (t == List<dynamic>) {
      return (data as List).map((e) => deserialize<dynamic>(e)).toList() as T;
    }
    if (t == List<_i27.Store>) {
      return (data as List).map((e) => deserialize<_i27.Store>(e)).toList()
          as T;
    }
    if (t == List<_i28.Terminal>) {
      return (data as List).map((e) => deserialize<_i28.Terminal>(e)).toList()
          as T;
    }
    try {
      return _i29.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _i20.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  static String? getClassNameForType(Type type) {
    return switch (type) {
      _i2.Customer => 'Customer',
      _i3.Merchant => 'Merchant',
      _i4.Day => 'Day',
      _i5.ProductStatus => 'ProductStatus',
      _i6.StockMovementType => 'StockMovementType',
      _i7.StockReferenceType => 'StockReferenceType',
      _i8.NotFoundException => 'NotFoundException',
      _i9.ValidationException => 'ValidationException',
      _i10.ApiResponse => 'ApiResponse',
      _i11.SessionInfo => 'SessionInfo',
      _i12.StockSummary => 'StockSummary',
      _i13.Category => 'Category',
      _i14.Counter => 'Counter',
      _i15.Product => 'Product',
      _i16.StockLog => 'StockLog',
      _i17.Store => 'Store',
      _i18.Terminal => 'Terminal',
      _i19.TimeSlot => 'TimeSlot',
      _ => null,
    };
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;

    if (data is Map<String, dynamic> && data['__className__'] is String) {
      return (data['__className__'] as String).replaceFirst('pos.', '');
    }

    switch (data) {
      case _i2.Customer():
        return 'Customer';
      case _i3.Merchant():
        return 'Merchant';
      case _i4.Day():
        return 'Day';
      case _i5.ProductStatus():
        return 'ProductStatus';
      case _i6.StockMovementType():
        return 'StockMovementType';
      case _i7.StockReferenceType():
        return 'StockReferenceType';
      case _i8.NotFoundException():
        return 'NotFoundException';
      case _i9.ValidationException():
        return 'ValidationException';
      case _i10.ApiResponse():
        return 'ApiResponse';
      case _i11.SessionInfo():
        return 'SessionInfo';
      case _i12.StockSummary():
        return 'StockSummary';
      case _i13.Category():
        return 'Category';
      case _i14.Counter():
        return 'Counter';
      case _i15.Product():
        return 'Product';
      case _i16.StockLog():
        return 'StockLog';
      case _i17.Store():
        return 'Store';
      case _i18.Terminal():
        return 'Terminal';
      case _i19.TimeSlot():
        return 'TimeSlot';
    }
    className = _i29.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth_idp.$className';
    }
    className = _i20.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth_core.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'Customer') {
      return deserialize<_i2.Customer>(data['data']);
    }
    if (dataClassName == 'Merchant') {
      return deserialize<_i3.Merchant>(data['data']);
    }
    if (dataClassName == 'Day') {
      return deserialize<_i4.Day>(data['data']);
    }
    if (dataClassName == 'ProductStatus') {
      return deserialize<_i5.ProductStatus>(data['data']);
    }
    if (dataClassName == 'StockMovementType') {
      return deserialize<_i6.StockMovementType>(data['data']);
    }
    if (dataClassName == 'StockReferenceType') {
      return deserialize<_i7.StockReferenceType>(data['data']);
    }
    if (dataClassName == 'NotFoundException') {
      return deserialize<_i8.NotFoundException>(data['data']);
    }
    if (dataClassName == 'ValidationException') {
      return deserialize<_i9.ValidationException>(data['data']);
    }
    if (dataClassName == 'ApiResponse') {
      return deserialize<_i10.ApiResponse>(data['data']);
    }
    if (dataClassName == 'SessionInfo') {
      return deserialize<_i11.SessionInfo>(data['data']);
    }
    if (dataClassName == 'StockSummary') {
      return deserialize<_i12.StockSummary>(data['data']);
    }
    if (dataClassName == 'Category') {
      return deserialize<_i13.Category>(data['data']);
    }
    if (dataClassName == 'Counter') {
      return deserialize<_i14.Counter>(data['data']);
    }
    if (dataClassName == 'Product') {
      return deserialize<_i15.Product>(data['data']);
    }
    if (dataClassName == 'StockLog') {
      return deserialize<_i16.StockLog>(data['data']);
    }
    if (dataClassName == 'Store') {
      return deserialize<_i17.Store>(data['data']);
    }
    if (dataClassName == 'Terminal') {
      return deserialize<_i18.Terminal>(data['data']);
    }
    if (dataClassName == 'TimeSlot') {
      return deserialize<_i19.TimeSlot>(data['data']);
    }
    if (dataClassName.startsWith('serverpod_auth_idp.')) {
      data['className'] = dataClassName.substring(19);
      return _i29.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth_core.')) {
      data['className'] = dataClassName.substring(20);
      return _i20.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }
}
