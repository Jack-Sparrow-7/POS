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

    if (merchantId.uuid.isEmpty) {
      throw ValidationException(message: "Merchant ID is required.");
    }

    if (storeId <= 0) {
      throw ValidationException(message: "Invalid storeId.");
    }

    final now = DateTime.now().toUtc();
    final updatedName = trimmedName.toUpperCase();

    final counter = Counter(
      name: updatedName,
      merchantId: merchantId,
      storeId: storeId,
      createdAt: now,
      updatedAt: now,
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
    required String name,
    required int id,
  }) async {
    final trimmedName = name.trim();
    if (trimmedName.isEmpty) {
      throw ValidationException(message: "Name is required.");
    }

    final existingCounter = await Counter.db.findById(session, id);
    if (existingCounter == null) {
      throw NotFoundException(message: "Counter does not exist.");
    }

    final updatedName = trimmedName.toUpperCase();
    existingCounter.name = updatedName;
    existingCounter.updatedAt = DateTime.now().toUtc();

    try {
      final updatedCounter = await Counter.db.updateRow(
        session,
        existingCounter,
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

  Future<ApiResponse> deleteCounter(Session session, {required int id}) async {
    final existing = await Counter.db.findById(session, id);

    if (existing == null) {
      throw NotFoundException(message: "Counter does not exist.");
    }

    try {
      await Counter.db.deleteRow(session, existing);
    } on DatabaseException catch (e) {
      if (e.message.toLowerCase().contains('foreign key')) {
        throw ValidationException(
          message: "Counter cannot be deleted while it has dependent records.",
        );
      }
      rethrow;
    }

    return ApiResponse(success: true, message: "Counter deleted successfully.");
  }

  // TODO: Restrict or remove in production (exposes all counters).
  Future<List<Counter>> getAllCountersDev(Session session) async {
    final counters = await Counter.db.find(session);

    return counters;
  }

  Future<List<Counter>> getAllCounters(
    Session session, {
    required int storeId,
  }) async {
    final counters = await Counter.db.find(
      session,
      where: (c) => c.storeId.equals(storeId),
      orderBy: (c) => c.name,
    );

    return counters;
  }
}
