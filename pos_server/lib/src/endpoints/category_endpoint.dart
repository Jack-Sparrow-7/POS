import 'package:pos_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class CategoryEndpoint extends Endpoint {
  Future<Category> createCategory(
    Session session, {
    required String name,
    required int storeId,
    required UuidValue merchantId,
  }) async {
    if (name.trim().isEmpty) {
      throw ValidationException(message: 'Name is required.');
    }

    if (storeId <= 0) {
      throw ValidationException(message: 'Invalid storeId.');
    }

    if (merchantId.isNil) {
      throw ValidationException(message: 'Merchant ID is required.');
    }

    final store = await Store.db.findById(session, storeId);
    if (store == null || store.merchantId != merchantId) {
      throw ValidationException(message: 'Invalid Store ID.');
    }

    final updatedName = name.trim().toUpperCase();
    final category = Category(
      name: updatedName,
      storeId: storeId,
      merchantId: merchantId,
    );

    try {
      final createdCategory = await Category.db.insertRow(session, category);
      return createdCategory;
    } on DatabaseException catch (e) {
      if (e.message.contains('category_name_store_idx')) {
        throw ValidationException(message: 'Category already exists.');
      }

      if (e.message.toLowerCase().contains('foreign key')) {
        throw ValidationException(message: 'Invalid Store ID');
      }

      rethrow;
    }
  }

  Future<Category> updateCategory(
    Session session, {
    required Category category,
  }) async {
    if (category.name.trim().isEmpty) {
      throw ValidationException(message: 'Name should not be empty.');
    }

    if (category.merchantId.isNil) {
      throw ValidationException(message: 'Merchant ID is required.');
    }

    if (category.storeId <= 0) {
      throw ValidationException(message: 'Invalid storeId.');
    }

    final store = await Store.db.findById(session, category.storeId);
    if (store == null || store.merchantId != category.merchantId) {
      throw ValidationException(message: 'Invalid Store ID.');
    }

    final normalizedCategory = category.copyWith(
      name: category.name.trim().toUpperCase(),
    );

    try {
      final updatedCategory = await Category.db.updateRow(
        session,
        normalizedCategory,
      );
      return updatedCategory;
    } on DatabaseException catch (e) {
      if (e.message.contains('category_name_store_idx')) {
        throw ValidationException(message: 'Category already exists.');
      }

      rethrow;
    }
  }

  Future<Category> getCategory(
    Session session, {
    required int id,
    required UuidValue merchantId,
  }) async {
    if (merchantId.isNil) {
      throw ValidationException(
        message: 'Merchant ID is required.',
      );
    }

    final category = await Category.db.findById(session, id);
    if (category == null || category.merchantId != merchantId) {
      throw NotFoundException(message: 'Category does not exist.');
    }
    return category;
  }

  Future<List<Category>> getAllCategories(
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

    final categories = await Category.db.find(
      session,
      where: (c) => c.storeId.equals(storeId),
      orderBy: (c) => c.name,
    );

    return categories;
  }

  // TODO: Restrict or remove in production (exposes all categories).
  Future<List<Category>> getAllCategoriesDev(Session session) async {
    final isDev = pod.runMode == ServerpodRunMode.development;
    if (!isDev) {
      throw NotAuthorizedException(
        reason: .insufficientAccess,
        message: 'This method is only available in development mode.',
      );
    }

    final categories = await Category.db.find(
      session,
    );

    return categories;
  }

  Future<bool> deleteCategory(
    Session session, {
    required Category category,
  }) async {
    try {
      await Category.db.deleteRow(session, category);
      return true;
    } on DatabaseException catch (e) {
      if (e.message.toLowerCase().contains('foreign key')) {
        throw ValidationException(
          message: 'Category cannot be deleted while in use.',
        );
      }
      rethrow;
    }
  }
}
