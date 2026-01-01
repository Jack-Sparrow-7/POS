import 'package:pos_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class MerchantEndpoint extends Endpoint {
  Future<Merchant> createMerchant(
    Session session, {
    required UuidValue userId,
    required String name,
    required String businessName,
    required String email,
    required String whatsappNumber,
  }) async {
    if (userId.uuid.isEmpty) {
      throw ValidationException(message: 'User Id is required.');
    }

    if (name.isEmpty) {
      throw ValidationException(message: 'Name is required.');
    }

    if (businessName.isEmpty) {
      throw ValidationException(message: 'Business Name is required.');
    }

    if (email.isEmpty) {
      throw ValidationException(message: "Email is required");
    }

    if (whatsappNumber.isEmpty) {
      throw ValidationException(message: "Whatsapp Number is required");
    }

    final now = DateTime.now();
    final merchant = Merchant(
      name: name,
      businessName: businessName,
      whatsappNumber: whatsappNumber,
      email: email,
      authUserId: userId,
      createdAt: now,
      updatedAt: now,
    );

    try {
      final createdMerchant = await Merchant.db.insertRow(session, merchant);
      return createdMerchant;
    } on DatabaseException catch (e) {
      if (e.message.contains('merchant_auth_user_idx')) {
        throw ValidationException(
          message: 'Merchant with this user id already exists.',
        );
      }
      if (e.message.contains('merchant_email_idx')) {
        throw ValidationException(
          message: 'Merchant with this email already exists.',
        );
      }

      rethrow;
    }
  }

  Future<List<Merchant>> getAllMerchants(Session session) async {
    final merchants = await Merchant.db.find(session);

    return merchants;
  }

  Future<Merchant> getMerchantByUserId(
    Session session, {
    required UuidValue userId,
  }) async {
    if (userId.uuid.isEmpty) {
      throw ValidationException(message: "User Id is required.");
    }

    final merchant = await Merchant.db.findFirstRow(
      session,
      where: (c) => c.authUserId.equals(userId),
    );

    if (merchant == null) {
      throw NotFoundException(
        message: "Merchant with this user id does not exist.",
      );
    }

    return merchant;
  }

  Future<Merchant> getMerchantById(
    Session session, {
    required int id,
  }) async {
    final merchant = await Merchant.db.findById(session, id);

    if (merchant == null) {
      throw NotFoundException(
        message: "Merchant with this id does not exist.",
      );
    }

    return merchant;
  }

  Future<ApiResponse> deleteMerchantByUuid(
    Session session, {
    required UuidValue uuid,
  }) async {
    final existingMerchant = await Merchant.db.findFirstRow(
      session,
      where: (c) => c.authUserId.equals(uuid),
    );

    if (existingMerchant == null) {
      throw NotFoundException(
        message: "Merchant does not exist.",
      );
    }

    await Merchant.db.deleteRow(session, existingMerchant);

    return ApiResponse(
      success: true,
      message: "Merchant was deleted successfully.",
    );
  }

  Future<ApiResponse> deleteMerchantById(
    Session session, {
    required int id,
  }) async {
    final existingMerchant = await Merchant.db.findById(session, id);

    if (existingMerchant == null) {
      throw NotFoundException(message: "Merchant with this id does not exist.");
    }

    await Merchant.db.deleteRow(session, existingMerchant);

    return ApiResponse(
      success: true,
      message: "Merchant was deleted successfully.",
    );
  }
}
