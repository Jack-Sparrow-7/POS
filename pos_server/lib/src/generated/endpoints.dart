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
import '../auth/email_auth_endpoint.dart' as _i2;
import '../auth/email_idp_endpoint.dart' as _i3;
import '../auth/jwt_refresh_endpoint.dart' as _i4;
import '../endpoints/category_endpoint.dart' as _i5;
import '../endpoints/counter_endpoint.dart' as _i6;
import '../endpoints/customer_endpoint.dart' as _i7;
import '../endpoints/merchant_endpoint.dart' as _i8;
import '../endpoints/product_endpoint.dart' as _i9;
import '../endpoints/stock_endpoint.dart' as _i10;
import '../endpoints/store_endpoint.dart' as _i11;
import '../endpoints/terminal_endpoint.dart' as _i12;
import 'package:pos_server/src/generated/session_info.dart' as _i13;
import 'package:pos_server/src/generated/enums/product_status.dart' as _i14;
import 'package:pos_server/src/generated/tables/stock_log.dart' as _i15;
import 'package:serverpod_auth_idp_server/serverpod_auth_idp_server.dart'
    as _i16;
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart'
    as _i17;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'emailAuth': _i2.EmailAuthEndpoint()
        ..initialize(
          server,
          'emailAuth',
          null,
        ),
      'emailIdp': _i3.EmailIdpEndpoint()
        ..initialize(
          server,
          'emailIdp',
          null,
        ),
      'jwtRefresh': _i4.JwtRefreshEndpoint()
        ..initialize(
          server,
          'jwtRefresh',
          null,
        ),
      'category': _i5.CategoryEndpoint()
        ..initialize(
          server,
          'category',
          null,
        ),
      'counter': _i6.CounterEndpoint()
        ..initialize(
          server,
          'counter',
          null,
        ),
      'customer': _i7.CustomerEndpoint()
        ..initialize(
          server,
          'customer',
          null,
        ),
      'merchant': _i8.MerchantEndpoint()
        ..initialize(
          server,
          'merchant',
          null,
        ),
      'product': _i9.ProductEndpoint()
        ..initialize(
          server,
          'product',
          null,
        ),
      'stock': _i10.StockEndpoint()
        ..initialize(
          server,
          'stock',
          null,
        ),
      'store': _i11.StoreEndpoint()
        ..initialize(
          server,
          'store',
          null,
        ),
      'terminal': _i12.TerminalEndpoint()
        ..initialize(
          server,
          'terminal',
          null,
        ),
    };
    connectors['emailAuth'] = _i1.EndpointConnector(
      name: 'emailAuth',
      endpoint: endpoints['emailAuth']!,
      methodConnectors: {
        'registerCustomer': _i1.MethodConnector(
          name: 'registerCustomer',
          params: {
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'password': _i1.ParameterDescription(
              name: 'password',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailAuth'] as _i2.EmailAuthEndpoint)
                  .registerCustomer(
                    session,
                    email: params['email'],
                    password: params['password'],
                  ),
        ),
        'registerMerchant': _i1.MethodConnector(
          name: 'registerMerchant',
          params: {
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'password': _i1.ParameterDescription(
              name: 'password',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'businessName': _i1.ParameterDescription(
              name: 'businessName',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'whatsappNumber': _i1.ParameterDescription(
              name: 'whatsappNumber',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailAuth'] as _i2.EmailAuthEndpoint)
                  .registerMerchant(
                    session,
                    email: params['email'],
                    password: params['password'],
                    name: params['name'],
                    businessName: params['businessName'],
                    whatsappNumber: params['whatsappNumber'],
                  ),
        ),
        'getAllUsers': _i1.MethodConnector(
          name: 'getAllUsers',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailAuth'] as _i2.EmailAuthEndpoint)
                  .getAllUsers(session),
        ),
        'deleteCustomerById': _i1.MethodConnector(
          name: 'deleteCustomerById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailAuth'] as _i2.EmailAuthEndpoint)
                  .deleteCustomerById(
                    session,
                    id: params['id'],
                  ),
        ),
      },
    );
    connectors['emailIdp'] = _i1.EndpointConnector(
      name: 'emailIdp',
      endpoint: endpoints['emailIdp']!,
      methodConnectors: {
        'login': _i1.MethodConnector(
          name: 'login',
          params: {
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'password': _i1.ParameterDescription(
              name: 'password',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i3.EmailIdpEndpoint).login(
                session,
                email: params['email'],
                password: params['password'],
              ),
        ),
        'startRegistration': _i1.MethodConnector(
          name: 'startRegistration',
          params: {
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i3.EmailIdpEndpoint)
                  .startRegistration(
                    session,
                    email: params['email'],
                  ),
        ),
        'verifyRegistrationCode': _i1.MethodConnector(
          name: 'verifyRegistrationCode',
          params: {
            'accountRequestId': _i1.ParameterDescription(
              name: 'accountRequestId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
            'verificationCode': _i1.ParameterDescription(
              name: 'verificationCode',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i3.EmailIdpEndpoint)
                  .verifyRegistrationCode(
                    session,
                    accountRequestId: params['accountRequestId'],
                    verificationCode: params['verificationCode'],
                  ),
        ),
        'finishRegistration': _i1.MethodConnector(
          name: 'finishRegistration',
          params: {
            'registrationToken': _i1.ParameterDescription(
              name: 'registrationToken',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'password': _i1.ParameterDescription(
              name: 'password',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i3.EmailIdpEndpoint)
                  .finishRegistration(
                    session,
                    registrationToken: params['registrationToken'],
                    password: params['password'],
                  ),
        ),
        'startPasswordReset': _i1.MethodConnector(
          name: 'startPasswordReset',
          params: {
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i3.EmailIdpEndpoint)
                  .startPasswordReset(
                    session,
                    email: params['email'],
                  ),
        ),
        'verifyPasswordResetCode': _i1.MethodConnector(
          name: 'verifyPasswordResetCode',
          params: {
            'passwordResetRequestId': _i1.ParameterDescription(
              name: 'passwordResetRequestId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
            'verificationCode': _i1.ParameterDescription(
              name: 'verificationCode',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i3.EmailIdpEndpoint)
                  .verifyPasswordResetCode(
                    session,
                    passwordResetRequestId: params['passwordResetRequestId'],
                    verificationCode: params['verificationCode'],
                  ),
        ),
        'finishPasswordReset': _i1.MethodConnector(
          name: 'finishPasswordReset',
          params: {
            'finishPasswordResetToken': _i1.ParameterDescription(
              name: 'finishPasswordResetToken',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'newPassword': _i1.ParameterDescription(
              name: 'newPassword',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i3.EmailIdpEndpoint)
                  .finishPasswordReset(
                    session,
                    finishPasswordResetToken:
                        params['finishPasswordResetToken'],
                    newPassword: params['newPassword'],
                  ),
        ),
      },
    );
    connectors['jwtRefresh'] = _i1.EndpointConnector(
      name: 'jwtRefresh',
      endpoint: endpoints['jwtRefresh']!,
      methodConnectors: {
        'refreshAccessToken': _i1.MethodConnector(
          name: 'refreshAccessToken',
          params: {
            'refreshToken': _i1.ParameterDescription(
              name: 'refreshToken',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['jwtRefresh'] as _i4.JwtRefreshEndpoint)
                  .refreshAccessToken(
                    session,
                    refreshToken: params['refreshToken'],
                  ),
        ),
      },
    );
    connectors['category'] = _i1.EndpointConnector(
      name: 'category',
      endpoint: endpoints['category']!,
      methodConnectors: {
        'createCategory': _i1.MethodConnector(
          name: 'createCategory',
          params: {
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'storeId': _i1.ParameterDescription(
              name: 'storeId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'merchantId': _i1.ParameterDescription(
              name: 'merchantId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['category'] as _i5.CategoryEndpoint)
                  .createCategory(
                    session,
                    name: params['name'],
                    storeId: params['storeId'],
                    merchantId: params['merchantId'],
                  ),
        ),
        'updateCategory': _i1.MethodConnector(
          name: 'updateCategory',
          params: {
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['category'] as _i5.CategoryEndpoint)
                  .updateCategory(
                    session,
                    name: params['name'],
                    id: params['id'],
                  ),
        ),
        'getCategory': _i1.MethodConnector(
          name: 'getCategory',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['category'] as _i5.CategoryEndpoint).getCategory(
                    session,
                    id: params['id'],
                  ),
        ),
        'getAllCategories': _i1.MethodConnector(
          name: 'getAllCategories',
          params: {
            'storeId': _i1.ParameterDescription(
              name: 'storeId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['category'] as _i5.CategoryEndpoint)
                  .getAllCategories(
                    session,
                    storeId: params['storeId'],
                  ),
        ),
        'getAllCategoriesDev': _i1.MethodConnector(
          name: 'getAllCategoriesDev',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['category'] as _i5.CategoryEndpoint)
                  .getAllCategoriesDev(session),
        ),
        'deleteCategory': _i1.MethodConnector(
          name: 'deleteCategory',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['category'] as _i5.CategoryEndpoint)
                  .deleteCategory(
                    session,
                    id: params['id'],
                  ),
        ),
      },
    );
    connectors['counter'] = _i1.EndpointConnector(
      name: 'counter',
      endpoint: endpoints['counter']!,
      methodConnectors: {
        'createCounter': _i1.MethodConnector(
          name: 'createCounter',
          params: {
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'merchantId': _i1.ParameterDescription(
              name: 'merchantId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
            'storeId': _i1.ParameterDescription(
              name: 'storeId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['counter'] as _i6.CounterEndpoint).createCounter(
                    session,
                    name: params['name'],
                    merchantId: params['merchantId'],
                    storeId: params['storeId'],
                  ),
        ),
        'updateCounter': _i1.MethodConnector(
          name: 'updateCounter',
          params: {
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['counter'] as _i6.CounterEndpoint).updateCounter(
                    session,
                    name: params['name'],
                    id: params['id'],
                  ),
        ),
        'deleteCounter': _i1.MethodConnector(
          name: 'deleteCounter',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['counter'] as _i6.CounterEndpoint).deleteCounter(
                    session,
                    id: params['id'],
                  ),
        ),
        'getAllCountersDev': _i1.MethodConnector(
          name: 'getAllCountersDev',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['counter'] as _i6.CounterEndpoint)
                  .getAllCountersDev(session),
        ),
        'getAllCounters': _i1.MethodConnector(
          name: 'getAllCounters',
          params: {
            'storeId': _i1.ParameterDescription(
              name: 'storeId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['counter'] as _i6.CounterEndpoint).getAllCounters(
                    session,
                    storeId: params['storeId'],
                  ),
        ),
      },
    );
    connectors['customer'] = _i1.EndpointConnector(
      name: 'customer',
      endpoint: endpoints['customer']!,
      methodConnectors: {
        'createCustomer': _i1.MethodConnector(
          name: 'createCustomer',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['customer'] as _i7.CustomerEndpoint)
                  .createCustomer(
                    session,
                    id: params['id'],
                    email: params['email'],
                  ),
        ),
        'getAllCustomers': _i1.MethodConnector(
          name: 'getAllCustomers',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['customer'] as _i7.CustomerEndpoint)
                  .getAllCustomers(session),
        ),
        'getCustomerByUserId': _i1.MethodConnector(
          name: 'getCustomerByUserId',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['customer'] as _i7.CustomerEndpoint)
                  .getCustomerByUserId(
                    session,
                    userId: params['userId'],
                  ),
        ),
        'getCustomerById': _i1.MethodConnector(
          name: 'getCustomerById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['customer'] as _i7.CustomerEndpoint)
                  .getCustomerById(
                    session,
                    id: params['id'],
                  ),
        ),
        'deleteCustomerByUserId': _i1.MethodConnector(
          name: 'deleteCustomerByUserId',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['customer'] as _i7.CustomerEndpoint)
                  .deleteCustomerByUserId(
                    session,
                    userId: params['userId'],
                  ),
        ),
        'deleteCustomerById': _i1.MethodConnector(
          name: 'deleteCustomerById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['customer'] as _i7.CustomerEndpoint)
                  .deleteCustomerById(
                    session,
                    id: params['id'],
                  ),
        ),
      },
    );
    connectors['merchant'] = _i1.EndpointConnector(
      name: 'merchant',
      endpoint: endpoints['merchant']!,
      methodConnectors: {
        'createMerchant': _i1.MethodConnector(
          name: 'createMerchant',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'businessName': _i1.ParameterDescription(
              name: 'businessName',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'whatsappNumber': _i1.ParameterDescription(
              name: 'whatsappNumber',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['merchant'] as _i8.MerchantEndpoint)
                  .createMerchant(
                    session,
                    userId: params['userId'],
                    name: params['name'],
                    businessName: params['businessName'],
                    email: params['email'],
                    whatsappNumber: params['whatsappNumber'],
                  ),
        ),
        'getAllMerchants': _i1.MethodConnector(
          name: 'getAllMerchants',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['merchant'] as _i8.MerchantEndpoint)
                  .getAllMerchants(session),
        ),
        'getMerchantByUserId': _i1.MethodConnector(
          name: 'getMerchantByUserId',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['merchant'] as _i8.MerchantEndpoint)
                  .getMerchantByUserId(
                    session,
                    userId: params['userId'],
                  ),
        ),
        'getMerchantById': _i1.MethodConnector(
          name: 'getMerchantById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['merchant'] as _i8.MerchantEndpoint)
                  .getMerchantById(
                    session,
                    id: params['id'],
                  ),
        ),
        'deleteMerchantByUuid': _i1.MethodConnector(
          name: 'deleteMerchantByUuid',
          params: {
            'uuid': _i1.ParameterDescription(
              name: 'uuid',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['merchant'] as _i8.MerchantEndpoint)
                  .deleteMerchantByUuid(
                    session,
                    uuid: params['uuid'],
                  ),
        ),
        'deleteMerchantById': _i1.MethodConnector(
          name: 'deleteMerchantById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['merchant'] as _i8.MerchantEndpoint)
                  .deleteMerchantById(
                    session,
                    id: params['id'],
                  ),
        ),
      },
    );
    connectors['product'] = _i1.EndpointConnector(
      name: 'product',
      endpoint: endpoints['product']!,
      methodConnectors: {
        'createProduct': _i1.MethodConnector(
          name: 'createProduct',
          params: {
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'basePrice': _i1.ParameterDescription(
              name: 'basePrice',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'sellingPrice': _i1.ParameterDescription(
              name: 'sellingPrice',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'imageUrl': _i1.ParameterDescription(
              name: 'imageUrl',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'storeId': _i1.ParameterDescription(
              name: 'storeId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'categoryId': _i1.ParameterDescription(
              name: 'categoryId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'counterId': _i1.ParameterDescription(
              name: 'counterId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'merchantId': _i1.ParameterDescription(
              name: 'merchantId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
            'sessionInfo': _i1.ParameterDescription(
              name: 'sessionInfo',
              type: _i1.getType<_i13.SessionInfo?>(),
              nullable: true,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['product'] as _i9.ProductEndpoint).createProduct(
                    session,
                    name: params['name'],
                    basePrice: params['basePrice'],
                    sellingPrice: params['sellingPrice'],
                    imageUrl: params['imageUrl'],
                    storeId: params['storeId'],
                    categoryId: params['categoryId'],
                    counterId: params['counterId'],
                    merchantId: params['merchantId'],
                    sessionInfo: params['sessionInfo'],
                  ),
        ),
        'getAllProducts': _i1.MethodConnector(
          name: 'getAllProducts',
          params: {
            'storeId': _i1.ParameterDescription(
              name: 'storeId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['product'] as _i9.ProductEndpoint).getAllProducts(
                    session,
                    storeId: params['storeId'],
                  ),
        ),
        'updateProduct': _i1.MethodConnector(
          name: 'updateProduct',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'basePrice': _i1.ParameterDescription(
              name: 'basePrice',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
            'sellingPrice': _i1.ParameterDescription(
              name: 'sellingPrice',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
            'imageUrl': _i1.ParameterDescription(
              name: 'imageUrl',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'sessionInfo': _i1.ParameterDescription(
              name: 'sessionInfo',
              type: _i1.getType<_i13.SessionInfo?>(),
              nullable: true,
            ),
            'categoryId': _i1.ParameterDescription(
              name: 'categoryId',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
            'counterId': _i1.ParameterDescription(
              name: 'counterId',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['product'] as _i9.ProductEndpoint).updateProduct(
                    session,
                    id: params['id'],
                    name: params['name'],
                    basePrice: params['basePrice'],
                    sellingPrice: params['sellingPrice'],
                    imageUrl: params['imageUrl'],
                    sessionInfo: params['sessionInfo'],
                    categoryId: params['categoryId'],
                    counterId: params['counterId'],
                  ),
        ),
        'updateStatus': _i1.MethodConnector(
          name: 'updateStatus',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'status': _i1.ParameterDescription(
              name: 'status',
              type: _i1.getType<_i14.ProductStatus>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['product'] as _i9.ProductEndpoint).updateStatus(
                    session,
                    id: params['id'],
                    status: params['status'],
                  ),
        ),
        'updateSession': _i1.MethodConnector(
          name: 'updateSession',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'sessionInfo': _i1.ParameterDescription(
              name: 'sessionInfo',
              type: _i1.getType<_i13.SessionInfo>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['product'] as _i9.ProductEndpoint).updateSession(
                    session,
                    id: params['id'],
                    sessionInfo: params['sessionInfo'],
                  ),
        ),
        'deleteProduct': _i1.MethodConnector(
          name: 'deleteProduct',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['product'] as _i9.ProductEndpoint).deleteProduct(
                    session,
                    id: params['id'],
                  ),
        ),
        'resetStock': _i1.MethodConnector(
          name: 'resetStock',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['product'] as _i9.ProductEndpoint).resetStock(
                    session,
                    id: params['id'],
                  ),
        ),
        'addStock': _i1.MethodConnector(
          name: 'addStock',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'quantity': _i1.ParameterDescription(
              name: 'quantity',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'lowStock': _i1.ParameterDescription(
              name: 'lowStock',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['product'] as _i9.ProductEndpoint).addStock(
                session,
                id: params['id'],
                quantity: params['quantity'],
                lowStock: params['lowStock'],
              ),
        ),
        'reduceStockSale': _i1.MethodConnector(
          name: 'reduceStockSale',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'quantity': _i1.ParameterDescription(
              name: 'quantity',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['product'] as _i9.ProductEndpoint).reduceStockSale(
                    session,
                    id: params['id'],
                    quantity: params['quantity'],
                  ),
        ),
        'reduceStockAdjustment': _i1.MethodConnector(
          name: 'reduceStockAdjustment',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'quantity': _i1.ParameterDescription(
              name: 'quantity',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'lowStock': _i1.ParameterDescription(
              name: 'lowStock',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['product'] as _i9.ProductEndpoint)
                  .reduceStockAdjustment(
                    session,
                    id: params['id'],
                    quantity: params['quantity'],
                    lowStock: params['lowStock'],
                  ),
        ),
        'reduceStockWastage': _i1.MethodConnector(
          name: 'reduceStockWastage',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'quantity': _i1.ParameterDescription(
              name: 'quantity',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'lowStock': _i1.ParameterDescription(
              name: 'lowStock',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['product'] as _i9.ProductEndpoint)
                  .reduceStockWastage(
                    session,
                    id: params['id'],
                    quantity: params['quantity'],
                    lowStock: params['lowStock'],
                  ),
        ),
      },
    );
    connectors['stock'] = _i1.EndpointConnector(
      name: 'stock',
      endpoint: endpoints['stock']!,
      methodConnectors: {
        'createStockLog': _i1.MethodConnector(
          name: 'createStockLog',
          params: {
            'log': _i1.ParameterDescription(
              name: 'log',
              type: _i1.getType<_i15.StockLog>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['stock'] as _i10.StockEndpoint).createStockLog(
                    session,
                    log: params['log'],
                  ),
        ),
        'getAllStockLogs': _i1.MethodConnector(
          name: 'getAllStockLogs',
          params: {
            'storeId': _i1.ParameterDescription(
              name: 'storeId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['stock'] as _i10.StockEndpoint).getAllStockLogs(
                    session,
                    storeId: params['storeId'],
                  ),
        ),
        'getAllStockLogsDev': _i1.MethodConnector(
          name: 'getAllStockLogsDev',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['stock'] as _i10.StockEndpoint)
                  .getAllStockLogsDev(session),
        ),
        'getStockSummary': _i1.MethodConnector(
          name: 'getStockSummary',
          params: {
            'storeId': _i1.ParameterDescription(
              name: 'storeId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'startDate': _i1.ParameterDescription(
              name: 'startDate',
              type: _i1.getType<DateTime>(),
              nullable: false,
            ),
            'endDate': _i1.ParameterDescription(
              name: 'endDate',
              type: _i1.getType<DateTime>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['stock'] as _i10.StockEndpoint).getStockSummary(
                    session,
                    storeId: params['storeId'],
                    startDate: params['startDate'],
                    endDate: params['endDate'],
                  ),
        ),
      },
    );
    connectors['store'] = _i1.EndpointConnector(
      name: 'store',
      endpoint: endpoints['store']!,
      methodConnectors: {
        'createStore': _i1.MethodConnector(
          name: 'createStore',
          params: {
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'merchantId': _i1.ParameterDescription(
              name: 'merchantId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'type': _i1.ParameterDescription(
              name: 'type',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['store'] as _i11.StoreEndpoint).createStore(
                session,
                name: params['name'],
                merchantId: params['merchantId'],
                email: params['email'],
                type: params['type'],
              ),
        ),
        'getAllStores': _i1.MethodConnector(
          name: 'getAllStores',
          params: {
            'merchantId': _i1.ParameterDescription(
              name: 'merchantId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['store'] as _i11.StoreEndpoint).getAllStores(
                    session,
                    merchantId: params['merchantId'],
                  ),
        ),
        'getAllStoresDev': _i1.MethodConnector(
          name: 'getAllStoresDev',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['store'] as _i11.StoreEndpoint)
                  .getAllStoresDev(session),
        ),
        'getStore': _i1.MethodConnector(
          name: 'getStore',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['store'] as _i11.StoreEndpoint).getStore(
                session,
                id: params['id'],
              ),
        ),
        'updateStore': _i1.MethodConnector(
          name: 'updateStore',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'type': _i1.ParameterDescription(
              name: 'type',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['store'] as _i11.StoreEndpoint).updateStore(
                session,
                id: params['id'],
                name: params['name'],
                type: params['type'],
                email: params['email'],
              ),
        ),
        'deleteStore': _i1.MethodConnector(
          name: 'deleteStore',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['store'] as _i11.StoreEndpoint).deleteStore(
                session,
                id: params['id'],
              ),
        ),
      },
    );
    connectors['terminal'] = _i1.EndpointConnector(
      name: 'terminal',
      endpoint: endpoints['terminal']!,
      methodConnectors: {
        'createTerminal': _i1.MethodConnector(
          name: 'createTerminal',
          params: {
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'storeId': _i1.ParameterDescription(
              name: 'storeId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'merchantId': _i1.ParameterDescription(
              name: 'merchantId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
            'password': _i1.ParameterDescription(
              name: 'password',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['terminal'] as _i12.TerminalEndpoint)
                  .createTerminal(
                    session,
                    name: params['name'],
                    email: params['email'],
                    storeId: params['storeId'],
                    merchantId: params['merchantId'],
                    password: params['password'],
                  ),
        ),
        'updateTerminal': _i1.MethodConnector(
          name: 'updateTerminal',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['terminal'] as _i12.TerminalEndpoint)
                  .updateTerminal(
                    session,
                    id: params['id'],
                    name: params['name'],
                  ),
        ),
        'getTerminal': _i1.MethodConnector(
          name: 'getTerminal',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['terminal'] as _i12.TerminalEndpoint).getTerminal(
                    session,
                    id: params['id'],
                  ),
        ),
        'getAllTerminalsDev': _i1.MethodConnector(
          name: 'getAllTerminalsDev',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['terminal'] as _i12.TerminalEndpoint)
                  .getAllTerminalsDev(session),
        ),
        'getAllTerminals': _i1.MethodConnector(
          name: 'getAllTerminals',
          params: {
            'storeId': _i1.ParameterDescription(
              name: 'storeId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['terminal'] as _i12.TerminalEndpoint)
                  .getAllTerminals(
                    session,
                    storeId: params['storeId'],
                  ),
        ),
        'deleteTerminal': _i1.MethodConnector(
          name: 'deleteTerminal',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['terminal'] as _i12.TerminalEndpoint)
                  .deleteTerminal(
                    session,
                    id: params['id'],
                  ),
        ),
      },
    );
    modules['serverpod_auth_idp'] = _i16.Endpoints()
      ..initializeEndpoints(server);
    modules['serverpod_auth_core'] = _i17.Endpoints()
      ..initializeEndpoints(server);
  }
}
