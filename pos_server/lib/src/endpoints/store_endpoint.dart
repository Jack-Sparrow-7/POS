import 'package:pos_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class StoreEndpoint extends Endpoint {
  bool _isValidEmail(String email) {
    return RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    ).hasMatch(email);
  }

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

    if (merchantId.isNil) {
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

    if (!_isValidEmail(trimmedEmail)) {
      throw ValidationException(
        message: 'Email is not valid.',
      );
    }

    final updatedName = trimmedName.toUpperCase();
    String? updatedTypeName;
    if (type != null && type.trim().isNotEmpty) {
      updatedTypeName = type.trim().toUpperCase();
    }
    final updatedEmail = trimmedEmail;

    final store = Store(
      name: updatedName,
      merchantId: merchantId,
      type: updatedTypeName,
      email: updatedEmail,
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
    if (merchantId.isNil) {
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
    final isDev = pod.runMode == ServerpodRunMode.development;
    if (!isDev) {
      throw NotAuthorizedException(
        reason: .insufficientAccess,
        message: 'This method is only available in development mode.',
      );
    }

    final storesList = await Store.db.find(
      session,
    );

    return storesList;
  }

  Future<Store> getStore(
    Session session, {
    required int id,
    required UuidValue merchantId,
  }) async {
    if (merchantId.isNil) {
      throw ValidationException(
        message: 'Merchant ID is required.',
      );
    }
    
    final existingStore = await Store.db.findById(session, id);
    if (existingStore == null || existingStore.merchantId != merchantId) {
      throw NotFoundException(message: 'Store does not exist.');
    }
    return existingStore;
  }

  Future<Store> updateStore(
    Session session, {
    required Store store,
  }) async {
    if (store.name.trim().isEmpty) {
      throw ValidationException(message: 'Name should not be empty.');
    }

    if (store.email.trim().isEmpty) {
      throw ValidationException(message: "Email should not be empty.");
    }

    if (!_isValidEmail(store.email.trim().toLowerCase())) {
      throw ValidationException(message: 'Email is not valid.');
    }

    if (store.merchantId.isNil) {
      throw ValidationException(message: 'Merchant ID is required.');
    }

    if (store.type != null && store.type!.trim().isEmpty) {
      throw ValidationException(message: "Type should not be empty.");
    }

    final normalizedStore = store.copyWith(
      name: store.name.trim().toUpperCase(),
      email: store.email.trim().toLowerCase(),
      type: store.type?.trim().toUpperCase(),
    );

    try {
      final updatedStore = await Store.db.updateRow(session, normalizedStore);
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

  Future<bool> deleteStore(Session session, Store store) async {
    try {
      await Store.db.deleteRow(session, store);
      return true;
    } on DatabaseException catch (e) {
      if (e.message.toLowerCase().contains('foreign key')) {
        throw ValidationException(
          message: 'Cannot delete store with active records.',
        );
      }

      rethrow;
    }
  }
}
