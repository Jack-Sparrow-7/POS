import 'package:pos_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class StoreEndpoint extends Endpoint {
  Future<Store> createStore(
    Session session, {
    required String name,
    required UuidValue merchantId,
    required String email,
    String? type,
  }) async {
    final trimmedName = name.trim();
    if (trimmedName.isEmpty) {
      throw ValidationException(
        message: 'Name is required.',
      );
    }

    if (merchantId.uuid.isEmpty) {
      throw ValidationException(
        message: 'Merchant ID is required.',
      );
    }

    final trimmedEmail = email.trim().toLowerCase();
    if (trimmedEmail.isEmpty) {
      throw ValidationException(
        message: 'Email is required.',
      );
    }

    final updatedName = trimmedName.toUpperCase();
    String? updatedTypeName;
    if (type != null && type.trim().isNotEmpty) updatedTypeName = type.trim().toUpperCase();
    final updatedEmail = trimmedEmail;

    final now = DateTime.now().toUtc();

    final store = Store(
      name: updatedName,
      merchantId: merchantId,
      type: updatedTypeName,
      email: updatedEmail,
      createdAt: now,
      updatedAt: now,
    );

    try {
      final createdStore = await Store.db.insertRow(session, store);

      return createdStore;
    } on DatabaseException catch (e) {
      if (e.message.contains('store_name_merchant_idx')) {
        throw ValidationException(
          message: 'A store with this name already exists.',
        );
      }

      rethrow;
    }
  }

  Future<List<Store>> getAllStores(
    Session session, {
    required UuidValue merchantId,
  }) async {
    if (merchantId.uuid.isEmpty) {
      throw ValidationException(
        message: 'Merchant ID is required.',
      );
    }

    final storesList = await Store.db.find(
      session,
      where: (s) => s.merchantId.equals(merchantId),
    );

    return storesList;
  }

  // TODO: Restrict or remove in production (exposes all stores).
  Future<List<Store>> getAllStoresDev(
    Session session,
  ) async {
    final storesList = await Store.db.find(
      session,
    );

    return storesList;
  }

  Future<Store> getStore(
    Session session, {
    required int id,
  }) async {
    final existingStore = await Store.db.findById(session, id);

    if (existingStore == null) {
      throw NotFoundException(message: 'Store does not exist.');
    }

    return existingStore;
  }

  Future<Store> updateStore(
    Session session, {
    required int id,
    String? name,
    String? type,
    String? email,
  }) async {
    final existingStore = await Store.db.findById(session, id);

    if (existingStore == null) {
      throw NotFoundException(message: 'Store does not exist.');
    }

    String? updatedName;
    if (name != null) {
      final trimmed = name.trim();
      if (trimmed.isEmpty) {
        throw ValidationException(message: 'Name cannot be empty.');
      }
      updatedName = trimmed.toUpperCase();
    }

    String? updatedType;
    if (type != null && type.trim().isNotEmpty) updatedType = type.trim().toUpperCase();

    String? updatedEmail;
    if (email != null) {
      final trimmed = email.trim().toLowerCase();
      if (trimmed.isEmpty) {
        throw ValidationException(message: 'Email cannot be empty.');
      }
      updatedEmail = trimmed;
    }

    final store = existingStore.copyWith(
      name: updatedName ?? existingStore.name,
      type: updatedType ?? existingStore.type,
      email: updatedEmail ?? existingStore.email,
      updatedAt: DateTime.now().toUtc(),
    );

    try {
      final updatedStore = await Store.db.updateRow(session, store);
      return updatedStore;
    } on DatabaseException catch (e) {
      if (e.message.contains('store_name_merchant_idx')) {
        throw ValidationException(
          message: 'A store with this name already exists.',
        );
      }
      rethrow;
    }
  }

  Future<ApiResponse> deleteStore(
    Session session, {
    required int id,
  }) async {
    final existingStore = await Store.db.findById(session, id);

    if (existingStore == null) {
      throw NotFoundException(message: 'Store does not exist.');
    }

    try {
      await Store.db.deleteRow(session, existingStore);
      return ApiResponse(
        success: true,
        message: 'Store deleted successfully.',
      );
    } on DatabaseException catch (e) {
      if (e.message.toLowerCase().contains('foreign key')) {
        throw ValidationException(
          message: 'Store cannot be deleted while it has dependent records.',
        );
      }
      rethrow;
    }
  }
}
