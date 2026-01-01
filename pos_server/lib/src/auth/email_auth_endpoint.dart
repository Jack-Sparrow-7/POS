import 'package:pos_server/src/endpoints/customer_endpoint.dart';
import 'package:pos_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_idp_server/core.dart';
import 'package:serverpod_auth_idp_server/providers/email.dart';

class EmailAuthEndpoint extends Endpoint {
  Future<Customer> registerCustomer(
    Session session, {
    required String email,
    required String password,
  }) async {
    if (email.isEmpty) {
      throw ValidationException(message: 'Email is required.');
    }

    if (password.isEmpty) {
      throw ValidationException(message: 'Password is required.');
    }

    if (password.length < 6) {
      throw ValidationException(
        message: 'Password must be at least 6 characters.',
      );
    }

    final emailIdp = AuthServices.instance.emailIdp;
    final admin = emailIdp.admin;

    final existingAuth = await admin.findAccount(
      session,
      email: email,
    );
    if (existingAuth != null) {
      throw ValidationException(message: 'Email already registered.');
    }

    final authUser = await AuthServices.instance.authUsers.create(session);

    await admin.createEmailAuthentication(
      session,
      authUserId: authUser.id,
      email: email,
      password: password,
    );

    final createdCustomer = await CustomerEndpoint().createCustomer(
      session,
      id: authUser.id,
      email: email,
    );

    return createdCustomer;
  }

  Future<Customer> registerMerchant(
    Session session, {
    required String email,
    required String password,
    required String name,
    required String businessName,
    required String whatsappNumber,
  }) async {
    if (email.isEmpty) {
      throw ValidationException(message: 'Email is required.');
    }

    if (password.isEmpty) {
      throw ValidationException(message: 'Password is required.');
    }

    if (name.isEmpty) {
      throw ValidationException(message: 'Name is required.');
    }

    if (businessName.isEmpty) {
      throw ValidationException(message: 'Business Name is required.');
    }

    if (whatsappNumber.isEmpty) {
      throw ValidationException(message: 'Whatsapp Number is required.');
    }

    if (password.length < 6) {
      throw ValidationException(
        message: 'Password must be at least 6 characters.',
      );
    }

    final emailIdp = AuthServices.instance.emailIdp;
    final admin = emailIdp.admin;

    final existingAuth = await admin.findAccount(
      session,
      email: email,
    );
    if (existingAuth != null) {
      throw ValidationException(message: 'Email already registered.');
    }

    final authUser = await AuthServices.instance.authUsers.create(session);

    await admin.createEmailAuthentication(
      session,
      authUserId: authUser.id,
      email: email,
      password: password,
    );

    final createdCustomer = await CustomerEndpoint().createCustomer(
      session,
      id: authUser.id,
      email: email,
    );

    return createdCustomer;
  }

  Future<List<AuthUserModel>> getAllUsers(Session session) async {
    final accounts = await AuthServices.instance.authUsers.list(session);
    return accounts;
  }

  // Only for dev
  Future<ApiResponse> deleteCustomerById(
    Session session, {
    required UuidValue id,
  }) async {
    try {
      await CustomerEndpoint().deleteCustomerByUserId(session, userId: id);

      final admin = AuthServices.instance.emailIdp.admin;

      await admin.deleteEmailAccountByAuthUserId(session, authUserId: id);

      await AuthServices.instance.authUsers.delete(session, authUserId: id);

      return ApiResponse(success: true, message: 'User deleted successfully.');
    } catch (e) {
      throw NotFoundException(message: 'User not found.');
    }
  }
}
