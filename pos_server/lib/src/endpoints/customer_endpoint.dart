import 'package:pos_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class CustomerEndpoint extends Endpoint {
  Future<Customer> createCustomer(
    Session session, {
    required UuidValue id,
    required String email,
  }) async {
    if (email.isEmpty) {
      throw ValidationException(message: "Email is required.");
    }

    try {
      final now = DateTime.now();
      final customer = Customer(
        authUserId: id,
        email: email,
        createdAt: now,
        updatedAt: now,
      );

      final createdCustomer = await Customer.db.insertRow(session, customer);

      return createdCustomer;
    } on DatabaseException catch (e) {
      if (e.message.contains("customer_auth_user_idx")) {
        throw ValidationException(message: 'User with this id already exists.');
      }
      if (e.message.contains('customer_email_idx')) {
        throw ValidationException(
          message: 'User with this email already exists.',
        );
      }

      rethrow;
    }
  }

  Future<List<Customer>> getAllCustomers(Session session) async {
    final customers = await Customer.db.find(session);

    return customers;
  }

  Future<Customer> getCustomerByUserId(
    Session session, {
    required UuidValue userId,
  }) async {
    if (userId.uuid.isEmpty) {
      throw ValidationException(message: "User Id is required.");
    }

    final customer = await Customer.db.findFirstRow(
      session,
      where: (c) => c.authUserId.equals(userId),
    );

    if (customer == null) {
      throw NotFoundException(
        message: "User with this user id does not exist.",
      );
    }

    return customer;
  }

  Future<Customer> getCustomerById(
    Session session, {
    required int id,
  }) async {
    final customer = await Customer.db.findById(session, id);

    if (customer == null) {
      throw NotFoundException(
        message: "User with this id does not exist.",
      );
    }

    return customer;
  }

  Future<ApiResponse> deleteCustomerByUserId(
    Session session, {
    required UuidValue userId,
  }) async {
    final existingCustomer = await Customer.db.findFirstRow(
      session,
      where: (c) => c.authUserId.equals(userId),
    );

    if (existingCustomer == null) {
      throw NotFoundException(message: "User does not exist.");
    }

    await Customer.db.deleteRow(session, existingCustomer);

    return ApiResponse(
      success: true,
      message: "User was deleted successfully.",
    );
  }

  Future<ApiResponse> deleteCustomerById(
    Session session, {
    required int id,
  }) async {
    final existingCustomer = await Customer.db.findById(session, id);

    if (existingCustomer == null) {
      throw NotFoundException(message: "User with this id does not exist.");
    }

    await Customer.db.deleteRow(session, existingCustomer);

    return ApiResponse(
      success: true,
      message: "User was deleted successfully.",
    );
  }
}
