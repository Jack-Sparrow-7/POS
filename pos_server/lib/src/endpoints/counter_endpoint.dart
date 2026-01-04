import 'package:pos_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class CounterEndpoint extends Endpoint {
  Future<Counter> createCounter(
    Session session, {
    required String name,
    required UuidValue merchantId,
    required int storeId,
  }) async {
    final trimmedName = name.trim();
    if (trimmedName.isEmpty) {
      throw ValidationException(message: "Name is required.");
    }

    if (merchantId.isNil) {
      throw ValidationException(message: "Merchant ID is required.");
    }

    if (storeId <= 0) {
      throw ValidationException(message: "Invalid storeId.");
    }

    final store = await Store.db.findById(session, storeId);
    if (store == null || store.merchantId != merchantId) {
      throw ValidationException(message: 'Invalid Store ID.');
    }

    final updatedName = trimmedName.toUpperCase();

    final counter = Counter(
      name: updatedName,
      merchantId: merchantId,
      storeId: storeId,
    );

    try {
      final createdCounter = await Counter.db.insertRow(session, counter);
      return createdCounter;
    } on DatabaseException catch (e) {
      if (e.message.contains('counter_name_store_idx')) {
        throw ValidationException(
          message: 'Counter with this name already exists.',
        );
      }

      if (e.message.toLowerCase().contains('foreign key')) {
        throw ValidationException(
          message: "Invalid Store ID.",
        );
      }

      rethrow;
    }
  }

  Future<Counter> updateCounter(
    Session session, {
    required Counter counter,
  }) async {
    if (counter.name.trim().isEmpty) {
      throw ValidationException(message: 'Name should not be empty.');
    }

    if (counter.merchantId.isNil) {
      throw ValidationException(message: 'Merchant ID is required.');
    }

    if (counter.storeId <= 0) {
      throw ValidationException(message: 'Invalid storeId.');
    }

    final store = await Store.db.findById(session, counter.storeId);
    if (store == null || store.merchantId != counter.merchantId) {
      throw ValidationException(message: 'Invalid Store ID.');
    }

    final normalizedCounter = counter.copyWith(
      name: counter.name.trim().toUpperCase(),
    );

    try {
      final updatedCounter = await Counter.db.updateRow(
        session,
        normalizedCounter,
      );

      return updatedCounter;
    } on DatabaseException catch (e) {
      if (e.message.contains('counter_name_store_idx')) {
        throw ValidationException(
          message: 'Counter with this name already exists.',
        );
      }

      rethrow;
    }
  }

  Future<bool> deleteCounter(
    Session session, {
    required Counter counter,
  }) async {
    if (counter.merchantId.isNil) {
      throw ValidationException(message: 'Merchant ID is required.');
    }

    try {
      await Counter.db.deleteRow(session, counter);
      return true;
    } on DatabaseException catch (e) {
      if (e.message.toLowerCase().contains('foreign key')) {
        throw ValidationException(
          message: "Counter cannot be deleted while it has dependent records.",
        );
      }
      rethrow;
    }
  }

  // TODO: Restrict or remove in production (exposes all counters).
  Future<List<Counter>> getAllCountersDev(Session session) async {
    final isDev = pod.runMode == ServerpodRunMode.development;
    if (!isDev) {
      throw NotAuthorizedException(
        reason: .insufficientAccess,
        message: 'This method is only available in development mode.',
      );
    }

    final counters = await Counter.db.find(session);

    return counters;
  }

  Future<List<Counter>> getAllCounters(
    Session session, {
    required int storeId,
    required UuidValue merchantId,
  }) async {
    if (merchantId.isNil) {
      throw ValidationException(message: 'Merchant ID is required.');
    }

    final store = await Store.db.findById(session, storeId);
    if (store == null || store.merchantId != merchantId) {
      throw ValidationException(message: 'Invalid Store ID.');
    }

    final counters = await Counter.db.find(
      session,
      where: (c) => c.storeId.equals(storeId),
      orderBy: (c) => c.name,
    );

    return counters;
  }

  Future<Counter> getCounter(
    Session session, {
    required int id,
    required UuidValue merchantId,
  }) async {
    if (merchantId.isNil) {
      throw ValidationException(message: 'Merchant ID is required.');
    }

    final counter = await Counter.db.findById(session, id);
    if (counter == null || counter.merchantId != merchantId) {
      throw NotFoundException(message: 'Counter does not exist.');
    }
    return counter;
  }
}
