import 'dart:math';

import 'package:pos_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class TerminalEndpoint extends Endpoint {
  String _generateTerminalNumber() {
    const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final random = Random.secure();
    return List.generate(11, (_) => chars[random.nextInt(chars.length)]).join();
  }

  Future<Terminal> createTerminal(
    Session session, {
    required String name,
    required String email,
    required int storeId,
    required UuidValue merchantId,
    required String password,
  }) async {
    final trimmedName = name.trim();
    if (trimmedName.isEmpty) {
      throw ValidationException(message: 'Name is required.');
    }

    final trimmedEmail = email.trim().toLowerCase();
    if (trimmedEmail.isEmpty) {
      throw ValidationException(message: 'Email is required.');
    }

    if (merchantId.uuid.isEmpty) {
      throw ValidationException(message: 'Merchant ID is required.');
    }

    if (password.isEmpty) {
      throw ValidationException(message: 'Password is required.');
    }

    if (password.length < 6) {
      throw ValidationException(
        message: 'Password must be at least 6 characters.',
      );
    }

    final updatedName = trimmedName.toUpperCase();
    final now = DateTime.now().toUtc();
    final terminalNumber = _generateTerminalNumber();

    final terminal = Terminal(
      name: updatedName,
      email: trimmedEmail,
      storeId: storeId,
      merchantId: merchantId,
      password: password,
      terminalNumber: terminalNumber,
      createdAt: now,
      updatedAt: now,
    );

    try {
      final createdTerminal = await Terminal.db.insertRow(session, terminal);

      return createdTerminal;
    } on DatabaseException catch (e) {
      if (e.message.contains('terminal_name_store_idx')) {
        throw ValidationException(
          message: 'A terminal with this name already exists.',
        );
      }

      if (e.message.contains('terminal_number_idx')) {
        return createTerminal(
          session,
          name: name,
          email: email,
          storeId: storeId,
          merchantId: merchantId,
          password: password,
        );
      }

      if (e.message.toLowerCase().contains('foreign key')) {
        throw ValidationException(message: "Invalid Store ID.");
      }

      rethrow;
    }
  }

  Future<Terminal> updateTerminal(
    Session session, {
    required int id,
    required String name,
  }) async {
    final trimmedName = name.trim();
    if (trimmedName.isEmpty) {
      throw ValidationException(message: 'Name is required.');
    }

    final existingTerminal = await Terminal.db.findById(session, id);

    if (existingTerminal == null) {
      throw NotFoundException(
        message: 'Terminal does not exist.',
      );
    }

    final updatedName = trimmedName.toUpperCase();

    final terminal = existingTerminal.copyWith(
      name: updatedName,
      updatedAt: DateTime.now().toUtc(),
    );

    try {
      final updatedTerminal = await Terminal.db.updateRow(session, terminal);

      return updatedTerminal;
    } on DatabaseException catch (e) {
      if (e.message.contains('terminal_name_store_idx')) {
        throw ValidationException(
          message: 'A terminal with this name already exists.',
        );
      }
      rethrow;
    }
  }

  Future<Terminal> getTerminal(
    Session session, {
    required int id,
  }) async {
    final existingTerminal = await Terminal.db.findById(session, id);

    if (existingTerminal == null) {
      throw NotFoundException(
        message: 'Terminal does not exist.',
      );
    }

    return existingTerminal;
  }

  Future<List<Terminal>> getAllTerminalsDev(Session session) async {
    final terminalsList = await Terminal.db.find(
      session,
    );

    return terminalsList;
  }

  Future<List<Terminal>> getAllTerminals(
    Session session, {
    required int storeId,
  }) async {
    final terminalsList = await Terminal.db.find(
      session,
      where: (t) => t.storeId.equals(storeId),
    );

    return terminalsList;
  }

  Future<ApiResponse> deleteTerminal(
    Session session, {
    required int id,
  }) async {
    final existingTerminal = await Terminal.db.findById(session, id);

    if (existingTerminal == null) {
      throw NotFoundException(
        message: "Terminal does not exist.",
      );
    }

    try {
      await Terminal.db.deleteRow(session, existingTerminal);
      return ApiResponse(
        success: true,
        message: 'Terminal deleted successfully.',
      );
    } on DatabaseException catch (e) {
      if (e.message.toLowerCase().contains('foreign key')) {
        throw ValidationException(
          message: 'Terminal cannot be deleted while it has dependent records.',
        );
      }
      rethrow;
    }
  }
}
