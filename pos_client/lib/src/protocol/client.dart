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
import 'dart:async' as _i2;
import 'package:pos_client/src/protocol/auth/customer.dart' as _i3;
import 'package:serverpod_auth_core_client/serverpod_auth_core_client.dart'
    as _i4;
import 'package:pos_client/src/protocol/responses/api_response.dart' as _i5;
import 'package:serverpod_auth_idp_client/serverpod_auth_idp_client.dart'
    as _i6;
import 'package:pos_client/src/protocol/tables/category.dart' as _i7;
import 'package:pos_client/src/protocol/tables/counter.dart' as _i8;
import 'package:pos_client/src/protocol/auth/merchant.dart' as _i9;
import 'package:pos_client/src/protocol/tables/product.dart' as _i10;
import 'package:pos_client/src/protocol/session_info.dart' as _i11;
import 'package:pos_client/src/protocol/enums/product_status.dart' as _i12;
import 'package:pos_client/src/protocol/tables/stock_log.dart' as _i13;
import 'package:pos_client/src/protocol/tables/store.dart' as _i14;
import 'package:pos_client/src/protocol/tables/terminal.dart' as _i15;
import 'protocol.dart' as _i16;

/// {@category Endpoint}
class EndpointEmailAuth extends _i1.EndpointRef {
  EndpointEmailAuth(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'emailAuth';

  _i2.Future<_i3.Customer> registerCustomer({
    required String email,
    required String password,
  }) => caller.callServerEndpoint<_i3.Customer>(
    'emailAuth',
    'registerCustomer',
    {
      'email': email,
      'password': password,
    },
  );

  _i2.Future<_i3.Customer> registerMerchant({
    required String email,
    required String password,
    required String name,
    required String businessName,
    required String whatsappNumber,
  }) => caller.callServerEndpoint<_i3.Customer>(
    'emailAuth',
    'registerMerchant',
    {
      'email': email,
      'password': password,
      'name': name,
      'businessName': businessName,
      'whatsappNumber': whatsappNumber,
    },
  );

  _i2.Future<List<_i4.AuthUserModel>> getAllUsers() =>
      caller.callServerEndpoint<List<_i4.AuthUserModel>>(
        'emailAuth',
        'getAllUsers',
        {},
      );

  _i2.Future<_i5.ApiResponse> deleteCustomerById({required _i1.UuidValue id}) =>
      caller.callServerEndpoint<_i5.ApiResponse>(
        'emailAuth',
        'deleteCustomerById',
        {'id': id},
      );
}

/// By extending [EmailIdpBaseEndpoint], the email identity provider endpoints
/// are made available on the server and enable the corresponding sign-in widget
/// on the client.
/// {@category Endpoint}
class EndpointEmailIdp extends _i6.EndpointEmailIdpBase {
  EndpointEmailIdp(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'emailIdp';

  /// Logs in the user and returns a new session.
  ///
  /// Throws an [EmailAccountLoginException] in case of errors, with reason:
  /// - [EmailAccountLoginExceptionReason.invalidCredentials] if the email or
  ///   password is incorrect.
  /// - [EmailAccountLoginExceptionReason.tooManyAttempts] if there have been
  ///   too many failed login attempts.
  ///
  /// Throws an [AuthUserBlockedException] if the auth user is blocked.
  @override
  _i2.Future<_i4.AuthSuccess> login({
    required String email,
    required String password,
  }) => caller.callServerEndpoint<_i4.AuthSuccess>(
    'emailIdp',
    'login',
    {
      'email': email,
      'password': password,
    },
  );

  /// Starts the registration for a new user account with an email-based login
  /// associated to it.
  ///
  /// Upon successful completion of this method, an email will have been
  /// sent to [email] with a verification link, which the user must open to
  /// complete the registration.
  ///
  /// Always returns a account request ID, which can be used to complete the
  /// registration. If the email is already registered, the returned ID will not
  /// be valid.
  @override
  _i2.Future<_i1.UuidValue> startRegistration({required String email}) =>
      caller.callServerEndpoint<_i1.UuidValue>(
        'emailIdp',
        'startRegistration',
        {'email': email},
      );

  /// Verifies an account request code and returns a token
  /// that can be used to complete the account creation.
  ///
  /// Throws an [EmailAccountRequestException] in case of errors, with reason:
  /// - [EmailAccountRequestExceptionReason.expired] if the account request has
  ///   already expired.
  /// - [EmailAccountRequestExceptionReason.policyViolation] if the password
  ///   does not comply with the password policy.
  /// - [EmailAccountRequestExceptionReason.invalid] if no request exists
  ///   for the given [accountRequestId] or [verificationCode] is invalid.
  @override
  _i2.Future<String> verifyRegistrationCode({
    required _i1.UuidValue accountRequestId,
    required String verificationCode,
  }) => caller.callServerEndpoint<String>(
    'emailIdp',
    'verifyRegistrationCode',
    {
      'accountRequestId': accountRequestId,
      'verificationCode': verificationCode,
    },
  );

  /// Completes a new account registration, creating a new auth user with a
  /// profile and attaching the given email account to it.
  ///
  /// Throws an [EmailAccountRequestException] in case of errors, with reason:
  /// - [EmailAccountRequestExceptionReason.expired] if the account request has
  ///   already expired.
  /// - [EmailAccountRequestExceptionReason.policyViolation] if the password
  ///   does not comply with the password policy.
  /// - [EmailAccountRequestExceptionReason.invalid] if the [registrationToken]
  ///   is invalid.
  ///
  /// Throws an [AuthUserBlockedException] if the auth user is blocked.
  ///
  /// Returns a session for the newly created user.
  @override
  _i2.Future<_i4.AuthSuccess> finishRegistration({
    required String registrationToken,
    required String password,
  }) => caller.callServerEndpoint<_i4.AuthSuccess>(
    'emailIdp',
    'finishRegistration',
    {
      'registrationToken': registrationToken,
      'password': password,
    },
  );

  /// Requests a password reset for [email].
  ///
  /// If the email address is registered, an email with reset instructions will
  /// be send out. If the email is unknown, this method will have no effect.
  ///
  /// Always returns a password reset request ID, which can be used to complete
  /// the reset. If the email is not registered, the returned ID will not be
  /// valid.
  ///
  /// Throws an [EmailAccountPasswordResetException] in case of errors, with reason:
  /// - [EmailAccountPasswordResetExceptionReason.tooManyAttempts] if the user has
  ///   made too many attempts trying to request a password reset.
  ///
  @override
  _i2.Future<_i1.UuidValue> startPasswordReset({required String email}) =>
      caller.callServerEndpoint<_i1.UuidValue>(
        'emailIdp',
        'startPasswordReset',
        {'email': email},
      );

  /// Verifies a password reset code and returns a finishPasswordResetToken
  /// that can be used to finish the password reset.
  ///
  /// Throws an [EmailAccountPasswordResetException] in case of errors, with reason:
  /// - [EmailAccountPasswordResetExceptionReason.expired] if the password reset
  ///   request has already expired.
  /// - [EmailAccountPasswordResetExceptionReason.tooManyAttempts] if the user has
  ///   made too many attempts trying to verify the password reset.
  /// - [EmailAccountPasswordResetExceptionReason.invalid] if no request exists
  ///   for the given [passwordResetRequestId] or [verificationCode] is invalid.
  ///
  /// If multiple steps are required to complete the password reset, this endpoint
  /// should be overridden to return credentials for the next step instead
  /// of the credentials for setting the password.
  @override
  _i2.Future<String> verifyPasswordResetCode({
    required _i1.UuidValue passwordResetRequestId,
    required String verificationCode,
  }) => caller.callServerEndpoint<String>(
    'emailIdp',
    'verifyPasswordResetCode',
    {
      'passwordResetRequestId': passwordResetRequestId,
      'verificationCode': verificationCode,
    },
  );

  /// Completes a password reset request by setting a new password.
  ///
  /// The [verificationCode] returned from [verifyPasswordResetCode] is used to
  /// validate the password reset request.
  ///
  /// Throws an [EmailAccountPasswordResetException] in case of errors, with reason:
  /// - [EmailAccountPasswordResetExceptionReason.expired] if the password reset
  ///   request has already expired.
  /// - [EmailAccountPasswordResetExceptionReason.policyViolation] if the new
  ///   password does not comply with the password policy.
  /// - [EmailAccountPasswordResetExceptionReason.invalid] if no request exists
  ///   for the given [passwordResetRequestId] or [verificationCode] is invalid.
  ///
  /// Throws an [AuthUserBlockedException] if the auth user is blocked.
  @override
  _i2.Future<void> finishPasswordReset({
    required String finishPasswordResetToken,
    required String newPassword,
  }) => caller.callServerEndpoint<void>(
    'emailIdp',
    'finishPasswordReset',
    {
      'finishPasswordResetToken': finishPasswordResetToken,
      'newPassword': newPassword,
    },
  );
}

/// By extending [RefreshJwtTokensEndpoint], the JWT token refresh endpoint
/// is made available on the server and enables automatic token refresh on the client.
/// {@category Endpoint}
class EndpointJwtRefresh extends _i4.EndpointRefreshJwtTokens {
  EndpointJwtRefresh(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'jwtRefresh';

  /// Creates a new token pair for the given [refreshToken].
  ///
  /// Can throw the following exceptions:
  /// -[RefreshTokenMalformedException]: refresh token is malformed and could
  ///   not be parsed. Not expected to happen for tokens issued by the server.
  /// -[RefreshTokenNotFoundException]: refresh token is unknown to the server.
  ///   Either the token was deleted or generated by a different server.
  /// -[RefreshTokenExpiredException]: refresh token has expired. Will happen
  ///   only if it has not been used within configured `refreshTokenLifetime`.
  /// -[RefreshTokenInvalidSecretException]: refresh token is incorrect, meaning
  ///   it does not refer to the current secret refresh token. This indicates
  ///   either a malfunctioning client or a malicious attempt by someone who has
  ///   obtained the refresh token. In this case the underlying refresh token
  ///   will be deleted, and access to it will expire fully when the last access
  ///   token is elapsed.
  ///
  /// This endpoint is unauthenticated, meaning the client won't include any
  /// authentication information with the call.
  @override
  _i2.Future<_i4.AuthSuccess> refreshAccessToken({
    required String refreshToken,
  }) => caller.callServerEndpoint<_i4.AuthSuccess>(
    'jwtRefresh',
    'refreshAccessToken',
    {'refreshToken': refreshToken},
    authenticated: false,
  );
}

/// {@category Endpoint}
class EndpointCategory extends _i1.EndpointRef {
  EndpointCategory(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'category';

  _i2.Future<_i7.Category> createCategory({
    required String name,
    required int storeId,
    required _i1.UuidValue merchantId,
  }) => caller.callServerEndpoint<_i7.Category>(
    'category',
    'createCategory',
    {
      'name': name,
      'storeId': storeId,
      'merchantId': merchantId,
    },
  );

  _i2.Future<_i7.Category> updateCategory({
    required String name,
    required int id,
  }) => caller.callServerEndpoint<_i7.Category>(
    'category',
    'updateCategory',
    {
      'name': name,
      'id': id,
    },
  );

  _i2.Future<_i7.Category> getCategory({required int id}) =>
      caller.callServerEndpoint<_i7.Category>(
        'category',
        'getCategory',
        {'id': id},
      );

  _i2.Future<List<_i7.Category>> getAllCategories({required int storeId}) =>
      caller.callServerEndpoint<List<_i7.Category>>(
        'category',
        'getAllCategories',
        {'storeId': storeId},
      );

  _i2.Future<List<_i7.Category>> getAllCategoriesDev() =>
      caller.callServerEndpoint<List<_i7.Category>>(
        'category',
        'getAllCategoriesDev',
        {},
      );

  _i2.Future<_i5.ApiResponse> deleteCategory({required int id}) =>
      caller.callServerEndpoint<_i5.ApiResponse>(
        'category',
        'deleteCategory',
        {'id': id},
      );
}

/// {@category Endpoint}
class EndpointCounter extends _i1.EndpointRef {
  EndpointCounter(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'counter';

  _i2.Future<_i8.Counter> createCounter({
    required String name,
    required _i1.UuidValue merchantId,
    required int storeId,
  }) => caller.callServerEndpoint<_i8.Counter>(
    'counter',
    'createCounter',
    {
      'name': name,
      'merchantId': merchantId,
      'storeId': storeId,
    },
  );

  _i2.Future<_i8.Counter> updateCounter({
    required String name,
    required int id,
  }) => caller.callServerEndpoint<_i8.Counter>(
    'counter',
    'updateCounter',
    {
      'name': name,
      'id': id,
    },
  );

  _i2.Future<_i5.ApiResponse> deleteCounter({required int id}) =>
      caller.callServerEndpoint<_i5.ApiResponse>(
        'counter',
        'deleteCounter',
        {'id': id},
      );

  _i2.Future<List<_i8.Counter>> getAllCountersDev() =>
      caller.callServerEndpoint<List<_i8.Counter>>(
        'counter',
        'getAllCountersDev',
        {},
      );

  _i2.Future<List<_i8.Counter>> getAllCounters({required int storeId}) =>
      caller.callServerEndpoint<List<_i8.Counter>>(
        'counter',
        'getAllCounters',
        {'storeId': storeId},
      );
}

/// {@category Endpoint}
class EndpointCustomer extends _i1.EndpointRef {
  EndpointCustomer(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'customer';

  _i2.Future<_i3.Customer> createCustomer({
    required _i1.UuidValue id,
    required String email,
  }) => caller.callServerEndpoint<_i3.Customer>(
    'customer',
    'createCustomer',
    {
      'id': id,
      'email': email,
    },
  );

  _i2.Future<List<_i3.Customer>> getAllCustomers() =>
      caller.callServerEndpoint<List<_i3.Customer>>(
        'customer',
        'getAllCustomers',
        {},
      );

  _i2.Future<_i3.Customer> getCustomerByUserId({
    required _i1.UuidValue userId,
  }) => caller.callServerEndpoint<_i3.Customer>(
    'customer',
    'getCustomerByUserId',
    {'userId': userId},
  );

  _i2.Future<_i3.Customer> getCustomerById({required int id}) =>
      caller.callServerEndpoint<_i3.Customer>(
        'customer',
        'getCustomerById',
        {'id': id},
      );

  _i2.Future<_i5.ApiResponse> deleteCustomerByUserId({
    required _i1.UuidValue userId,
  }) => caller.callServerEndpoint<_i5.ApiResponse>(
    'customer',
    'deleteCustomerByUserId',
    {'userId': userId},
  );

  _i2.Future<_i5.ApiResponse> deleteCustomerById({required int id}) =>
      caller.callServerEndpoint<_i5.ApiResponse>(
        'customer',
        'deleteCustomerById',
        {'id': id},
      );
}

/// {@category Endpoint}
class EndpointMerchant extends _i1.EndpointRef {
  EndpointMerchant(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'merchant';

  _i2.Future<_i9.Merchant> createMerchant({
    required _i1.UuidValue userId,
    required String name,
    required String businessName,
    required String email,
    required String whatsappNumber,
  }) => caller.callServerEndpoint<_i9.Merchant>(
    'merchant',
    'createMerchant',
    {
      'userId': userId,
      'name': name,
      'businessName': businessName,
      'email': email,
      'whatsappNumber': whatsappNumber,
    },
  );

  _i2.Future<List<_i9.Merchant>> getAllMerchants() =>
      caller.callServerEndpoint<List<_i9.Merchant>>(
        'merchant',
        'getAllMerchants',
        {},
      );

  _i2.Future<_i9.Merchant> getMerchantByUserId({
    required _i1.UuidValue userId,
  }) => caller.callServerEndpoint<_i9.Merchant>(
    'merchant',
    'getMerchantByUserId',
    {'userId': userId},
  );

  _i2.Future<_i9.Merchant> getMerchantById({required int id}) =>
      caller.callServerEndpoint<_i9.Merchant>(
        'merchant',
        'getMerchantById',
        {'id': id},
      );

  _i2.Future<_i5.ApiResponse> deleteMerchantByUuid({
    required _i1.UuidValue uuid,
  }) => caller.callServerEndpoint<_i5.ApiResponse>(
    'merchant',
    'deleteMerchantByUuid',
    {'uuid': uuid},
  );

  _i2.Future<_i5.ApiResponse> deleteMerchantById({required int id}) =>
      caller.callServerEndpoint<_i5.ApiResponse>(
        'merchant',
        'deleteMerchantById',
        {'id': id},
      );
}

/// {@category Endpoint}
class EndpointProduct extends _i1.EndpointRef {
  EndpointProduct(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'product';

  _i2.Future<_i10.Product> createProduct({
    required String name,
    required int basePrice,
    required int sellingPrice,
    String? imageUrl,
    required int storeId,
    required int categoryId,
    required int counterId,
    required _i1.UuidValue merchantId,
    _i11.SessionInfo? sessionInfo,
  }) => caller.callServerEndpoint<_i10.Product>(
    'product',
    'createProduct',
    {
      'name': name,
      'basePrice': basePrice,
      'sellingPrice': sellingPrice,
      'imageUrl': imageUrl,
      'storeId': storeId,
      'categoryId': categoryId,
      'counterId': counterId,
      'merchantId': merchantId,
      'sessionInfo': sessionInfo,
    },
  );

  _i2.Future<List<_i10.Product>> getAllProducts({required int storeId}) =>
      caller.callServerEndpoint<List<_i10.Product>>(
        'product',
        'getAllProducts',
        {'storeId': storeId},
      );

  _i2.Future<_i10.Product> updateProduct({
    required int id,
    String? name,
    int? basePrice,
    int? sellingPrice,
    String? imageUrl,
    _i11.SessionInfo? sessionInfo,
    int? categoryId,
    int? counterId,
  }) => caller.callServerEndpoint<_i10.Product>(
    'product',
    'updateProduct',
    {
      'id': id,
      'name': name,
      'basePrice': basePrice,
      'sellingPrice': sellingPrice,
      'imageUrl': imageUrl,
      'sessionInfo': sessionInfo,
      'categoryId': categoryId,
      'counterId': counterId,
    },
  );

  _i2.Future<_i10.Product> updateStatus({
    required int id,
    required _i12.ProductStatus status,
  }) => caller.callServerEndpoint<_i10.Product>(
    'product',
    'updateStatus',
    {
      'id': id,
      'status': status,
    },
  );

  _i2.Future<_i10.Product> updateSession({
    required int id,
    required _i11.SessionInfo sessionInfo,
  }) => caller.callServerEndpoint<_i10.Product>(
    'product',
    'updateSession',
    {
      'id': id,
      'sessionInfo': sessionInfo,
    },
  );

  _i2.Future<_i5.ApiResponse> deleteProduct({required int id}) =>
      caller.callServerEndpoint<_i5.ApiResponse>(
        'product',
        'deleteProduct',
        {'id': id},
      );

  _i2.Future<_i10.Product> resetStock({required int id}) =>
      caller.callServerEndpoint<_i10.Product>(
        'product',
        'resetStock',
        {'id': id},
      );

  _i2.Future<_i10.Product> addStock({
    required int id,
    required int quantity,
    int? lowStock,
  }) => caller.callServerEndpoint<_i10.Product>(
    'product',
    'addStock',
    {
      'id': id,
      'quantity': quantity,
      'lowStock': lowStock,
    },
  );

  _i2.Future<_i10.Product> reduceStockSale({
    required int id,
    required int quantity,
  }) => caller.callServerEndpoint<_i10.Product>(
    'product',
    'reduceStockSale',
    {
      'id': id,
      'quantity': quantity,
    },
  );

  _i2.Future<_i10.Product> reduceStockAdjustment({
    required int id,
    required int quantity,
    int? lowStock,
  }) => caller.callServerEndpoint<_i10.Product>(
    'product',
    'reduceStockAdjustment',
    {
      'id': id,
      'quantity': quantity,
      'lowStock': lowStock,
    },
  );

  _i2.Future<_i10.Product> reduceStockWastage({
    required int id,
    required int quantity,
    int? lowStock,
  }) => caller.callServerEndpoint<_i10.Product>(
    'product',
    'reduceStockWastage',
    {
      'id': id,
      'quantity': quantity,
      'lowStock': lowStock,
    },
  );
}

/// {@category Endpoint}
class EndpointStock extends _i1.EndpointRef {
  EndpointStock(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'stock';

  _i2.Future<_i13.StockLog> createStockLog({required _i13.StockLog log}) =>
      caller.callServerEndpoint<_i13.StockLog>(
        'stock',
        'createStockLog',
        {'log': log},
      );

  _i2.Future<List<_i13.StockLog>> getAllStockLogs({required int storeId}) =>
      caller.callServerEndpoint<List<_i13.StockLog>>(
        'stock',
        'getAllStockLogs',
        {'storeId': storeId},
      );

  _i2.Future<List<_i13.StockLog>> getAllStockLogsDev() =>
      caller.callServerEndpoint<List<_i13.StockLog>>(
        'stock',
        'getAllStockLogsDev',
        {},
      );

  _i2.Future<List<dynamic>> getStockSummary({
    required int storeId,
    required DateTime startDate,
    required DateTime endDate,
  }) => caller.callServerEndpoint<List<dynamic>>(
    'stock',
    'getStockSummary',
    {
      'storeId': storeId,
      'startDate': startDate,
      'endDate': endDate,
    },
  );
}

/// {@category Endpoint}
class EndpointStore extends _i1.EndpointRef {
  EndpointStore(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'store';

  _i2.Future<_i14.Store> createStore({
    required String name,
    required _i1.UuidValue merchantId,
    required String email,
    String? type,
  }) => caller.callServerEndpoint<_i14.Store>(
    'store',
    'createStore',
    {
      'name': name,
      'merchantId': merchantId,
      'email': email,
      'type': type,
    },
  );

  _i2.Future<List<_i14.Store>> getAllStores({
    required _i1.UuidValue merchantId,
  }) => caller.callServerEndpoint<List<_i14.Store>>(
    'store',
    'getAllStores',
    {'merchantId': merchantId},
  );

  _i2.Future<List<_i14.Store>> getAllStoresDev() =>
      caller.callServerEndpoint<List<_i14.Store>>(
        'store',
        'getAllStoresDev',
        {},
      );

  _i2.Future<_i14.Store> getStore({required int id}) =>
      caller.callServerEndpoint<_i14.Store>(
        'store',
        'getStore',
        {'id': id},
      );

  _i2.Future<_i14.Store> updateStore({
    required int id,
    String? name,
    String? type,
    String? email,
  }) => caller.callServerEndpoint<_i14.Store>(
    'store',
    'updateStore',
    {
      'id': id,
      'name': name,
      'type': type,
      'email': email,
    },
  );

  _i2.Future<_i5.ApiResponse> deleteStore({required int id}) =>
      caller.callServerEndpoint<_i5.ApiResponse>(
        'store',
        'deleteStore',
        {'id': id},
      );
}

/// {@category Endpoint}
class EndpointTerminal extends _i1.EndpointRef {
  EndpointTerminal(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'terminal';

  _i2.Future<_i15.Terminal> createTerminal({
    required String name,
    required String email,
    required int storeId,
    required _i1.UuidValue merchantId,
    required String password,
  }) => caller.callServerEndpoint<_i15.Terminal>(
    'terminal',
    'createTerminal',
    {
      'name': name,
      'email': email,
      'storeId': storeId,
      'merchantId': merchantId,
      'password': password,
    },
  );

  _i2.Future<_i15.Terminal> updateTerminal({
    required int id,
    required String name,
  }) => caller.callServerEndpoint<_i15.Terminal>(
    'terminal',
    'updateTerminal',
    {
      'id': id,
      'name': name,
    },
  );

  _i2.Future<_i15.Terminal> getTerminal({required int id}) =>
      caller.callServerEndpoint<_i15.Terminal>(
        'terminal',
        'getTerminal',
        {'id': id},
      );

  _i2.Future<List<_i15.Terminal>> getAllTerminalsDev() =>
      caller.callServerEndpoint<List<_i15.Terminal>>(
        'terminal',
        'getAllTerminalsDev',
        {},
      );

  _i2.Future<List<_i15.Terminal>> getAllTerminals({required int storeId}) =>
      caller.callServerEndpoint<List<_i15.Terminal>>(
        'terminal',
        'getAllTerminals',
        {'storeId': storeId},
      );

  _i2.Future<_i5.ApiResponse> deleteTerminal({required int id}) =>
      caller.callServerEndpoint<_i5.ApiResponse>(
        'terminal',
        'deleteTerminal',
        {'id': id},
      );
}

class Modules {
  Modules(Client client) {
    serverpod_auth_idp = _i6.Caller(client);
    serverpod_auth_core = _i4.Caller(client);
  }

  late final _i6.Caller serverpod_auth_idp;

  late final _i4.Caller serverpod_auth_core;
}

class Client extends _i1.ServerpodClientShared {
  Client(
    String host, {
    dynamic securityContext,
    @Deprecated(
      'Use authKeyProvider instead. This will be removed in future releases.',
    )
    super.authenticationKeyManager,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
    Function(
      _i1.MethodCallContext,
      Object,
      StackTrace,
    )?
    onFailedCall,
    Function(_i1.MethodCallContext)? onSucceededCall,
    bool? disconnectStreamsOnLostInternetConnection,
  }) : super(
         host,
         _i16.Protocol(),
         securityContext: securityContext,
         streamingConnectionTimeout: streamingConnectionTimeout,
         connectionTimeout: connectionTimeout,
         onFailedCall: onFailedCall,
         onSucceededCall: onSucceededCall,
         disconnectStreamsOnLostInternetConnection:
             disconnectStreamsOnLostInternetConnection,
       ) {
    emailAuth = EndpointEmailAuth(this);
    emailIdp = EndpointEmailIdp(this);
    jwtRefresh = EndpointJwtRefresh(this);
    category = EndpointCategory(this);
    counter = EndpointCounter(this);
    customer = EndpointCustomer(this);
    merchant = EndpointMerchant(this);
    product = EndpointProduct(this);
    stock = EndpointStock(this);
    store = EndpointStore(this);
    terminal = EndpointTerminal(this);
    modules = Modules(this);
  }

  late final EndpointEmailAuth emailAuth;

  late final EndpointEmailIdp emailIdp;

  late final EndpointJwtRefresh jwtRefresh;

  late final EndpointCategory category;

  late final EndpointCounter counter;

  late final EndpointCustomer customer;

  late final EndpointMerchant merchant;

  late final EndpointProduct product;

  late final EndpointStock stock;

  late final EndpointStore store;

  late final EndpointTerminal terminal;

  late final Modules modules;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
    'emailAuth': emailAuth,
    'emailIdp': emailIdp,
    'jwtRefresh': jwtRefresh,
    'category': category,
    'counter': counter,
    'customer': customer,
    'merchant': merchant,
    'product': product,
    'stock': stock,
    'store': store,
    'terminal': terminal,
  };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup => {
    'serverpod_auth_idp': modules.serverpod_auth_idp,
    'serverpod_auth_core': modules.serverpod_auth_core,
  };
}
