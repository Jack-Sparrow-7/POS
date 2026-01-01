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
import 'package:serverpod/protocol.dart' as _i2;
import 'package:serverpod_auth_idp_server/serverpod_auth_idp_server.dart'
    as _i3;
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart'
    as _i4;
import 'auth/customer.dart' as _i5;
import 'auth/merchant.dart' as _i6;
import 'enums/day.dart' as _i7;
import 'enums/product_status.dart' as _i8;
import 'enums/stock_movement_type.dart' as _i9;
import 'enums/stock_reference_type.dart' as _i10;
import 'exceptions/not_found_exception.dart' as _i11;
import 'exceptions/validation_exception.dart' as _i12;
import 'responses/api_response.dart' as _i13;
import 'session_info.dart' as _i14;
import 'stock_summary.dart' as _i15;
import 'tables/category.dart' as _i16;
import 'tables/counter.dart' as _i17;
import 'tables/product.dart' as _i18;
import 'tables/stock_log.dart' as _i19;
import 'tables/store.dart' as _i20;
import 'tables/terminal.dart' as _i21;
import 'time_slot.dart' as _i22;
import 'package:pos_server/src/generated/tables/category.dart' as _i23;
import 'package:pos_server/src/generated/tables/counter.dart' as _i24;
import 'package:pos_server/src/generated/auth/customer.dart' as _i25;
import 'package:pos_server/src/generated/auth/merchant.dart' as _i26;
import 'package:pos_server/src/generated/tables/product.dart' as _i27;
import 'package:pos_server/src/generated/tables/stock_log.dart' as _i28;
import 'package:pos_server/src/generated/tables/store.dart' as _i29;
import 'package:pos_server/src/generated/tables/terminal.dart' as _i30;
export 'auth/customer.dart';
export 'auth/merchant.dart';
export 'enums/day.dart';
export 'enums/product_status.dart';
export 'enums/stock_movement_type.dart';
export 'enums/stock_reference_type.dart';
export 'exceptions/not_found_exception.dart';
export 'exceptions/validation_exception.dart';
export 'responses/api_response.dart';
export 'session_info.dart';
export 'stock_summary.dart';
export 'tables/category.dart';
export 'tables/counter.dart';
export 'tables/product.dart';
export 'tables/stock_log.dart';
export 'tables/store.dart';
export 'tables/terminal.dart';
export 'time_slot.dart';

class Protocol extends _i1.SerializationManagerServer {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  static final List<_i2.TableDefinition> targetTableDefinitions = [
    _i2.TableDefinition(
      name: 'category',
      dartName: 'Category',
      schema: 'public',
      module: 'pos',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'category_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'storeId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'merchantId',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'updatedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'category_fk_0',
          columns: ['storeId'],
          referenceTable: 'store',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'category_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'category_name_store_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'name',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'storeId',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'counter',
      dartName: 'Counter',
      schema: 'public',
      module: 'pos',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'counter_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'merchantId',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _i2.ColumnDefinition(
          name: 'storeId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'updatedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'counter_fk_0',
          columns: ['storeId'],
          referenceTable: 'store',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'counter_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'counter_name_store_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'name',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'storeId',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'customer',
      dartName: 'Customer',
      schema: 'public',
      module: 'pos',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'customer_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'authUserId',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _i2.ColumnDefinition(
          name: 'email',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'updatedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'customer_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'customer_auth_user_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'authUserId',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'customer_email_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'email',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'merchant',
      dartName: 'Merchant',
      schema: 'public',
      module: 'pos',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'merchant_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'businessName',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'whatsappNumber',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'email',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'authUserId',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'updatedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'merchant_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'merchant_auth_user_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'authUserId',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'merchant_email_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'email',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'product',
      dartName: 'Product',
      schema: 'public',
      module: 'pos',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'product_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'basePrice',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'sellingPrice',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'imageUrl',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'categoryId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'counterId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'storeId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'merchantId',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _i2.ColumnDefinition(
          name: 'stockMonitor',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'stockQuantity',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'lowStockQuantity',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'status',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:ProductStatus',
        ),
        _i2.ColumnDefinition(
          name: 'sessionInfo',
          columnType: _i2.ColumnType.json,
          isNullable: true,
          dartType: 'protocol:SessionInfo?',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'updatedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'product_fk_0',
          columns: ['categoryId'],
          referenceTable: 'category',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'product_fk_1',
          columns: ['counterId'],
          referenceTable: 'counter',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'product_fk_2',
          columns: ['storeId'],
          referenceTable: 'store',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'product_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'product_name_store_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'name',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'storeId',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'product_store_status_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'storeId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'status',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'product_category_store_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'categoryId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'storeId',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'stock_log',
      dartName: 'StockLog',
      schema: 'public',
      module: 'pos',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'stock_log_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'storeId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'productId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'movementType',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:StockMovementType',
        ),
        _i2.ColumnDefinition(
          name: 'quantity',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'referenceType',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:StockReferenceType',
        ),
        _i2.ColumnDefinition(
          name: 'orderId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'remarks',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'stockBefore',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'stockAfter',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'movementAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'stock_log_fk_0',
          columns: ['storeId'],
          referenceTable: 'store',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'stock_log_fk_1',
          columns: ['productId'],
          referenceTable: 'product',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'stock_log_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'stocklog_store_product_date_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'storeId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'productId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'movementAt',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'stocklog_product_date_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'productId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'movementAt',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'stocklog_reference_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'referenceType',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'orderId',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'store',
      dartName: 'Store',
      schema: 'public',
      module: 'pos',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'store_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'email',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'merchantId',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _i2.ColumnDefinition(
          name: 'type',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'updatedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'store_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'store_name_merchant_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'name',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'merchantId',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'terminal',
      dartName: 'Terminal',
      schema: 'public',
      module: 'pos',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'terminal_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'email',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'storeId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'merchantId',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _i2.ColumnDefinition(
          name: 'password',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'terminalNumber',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'updatedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'terminal_fk_0',
          columns: ['storeId'],
          referenceTable: 'store',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'terminal_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'terminal_number_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'terminalNumber',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'terminal_name_store_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'name',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'storeId',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    ..._i3.Protocol.targetTableDefinitions,
    ..._i4.Protocol.targetTableDefinitions,
    ..._i2.Protocol.targetTableDefinitions,
  ];

  static String? getClassNameFromObjectJson(dynamic data) {
    if (data is! Map) return null;
    final className = data['__className__'] as String?;
    return className;
  }

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;

    final dataClassName = getClassNameFromObjectJson(data);
    if (dataClassName != null && dataClassName != getClassNameForType(t)) {
      try {
        return deserializeByClassName({
          'className': dataClassName,
          'data': data,
        });
      } on FormatException catch (_) {
        // If the className is not recognized (e.g., older client receiving
        // data with a new subtype), fall back to deserializing without the
        // className, using the expected type T.
      }
    }

    if (t == _i5.Customer) {
      return _i5.Customer.fromJson(data) as T;
    }
    if (t == _i6.Merchant) {
      return _i6.Merchant.fromJson(data) as T;
    }
    if (t == _i7.Day) {
      return _i7.Day.fromJson(data) as T;
    }
    if (t == _i8.ProductStatus) {
      return _i8.ProductStatus.fromJson(data) as T;
    }
    if (t == _i9.StockMovementType) {
      return _i9.StockMovementType.fromJson(data) as T;
    }
    if (t == _i10.StockReferenceType) {
      return _i10.StockReferenceType.fromJson(data) as T;
    }
    if (t == _i11.NotFoundException) {
      return _i11.NotFoundException.fromJson(data) as T;
    }
    if (t == _i12.ValidationException) {
      return _i12.ValidationException.fromJson(data) as T;
    }
    if (t == _i13.ApiResponse) {
      return _i13.ApiResponse.fromJson(data) as T;
    }
    if (t == _i14.SessionInfo) {
      return _i14.SessionInfo.fromJson(data) as T;
    }
    if (t == _i15.StockSummary) {
      return _i15.StockSummary.fromJson(data) as T;
    }
    if (t == _i16.Category) {
      return _i16.Category.fromJson(data) as T;
    }
    if (t == _i17.Counter) {
      return _i17.Counter.fromJson(data) as T;
    }
    if (t == _i18.Product) {
      return _i18.Product.fromJson(data) as T;
    }
    if (t == _i19.StockLog) {
      return _i19.StockLog.fromJson(data) as T;
    }
    if (t == _i20.Store) {
      return _i20.Store.fromJson(data) as T;
    }
    if (t == _i21.Terminal) {
      return _i21.Terminal.fromJson(data) as T;
    }
    if (t == _i22.TimeSlot) {
      return _i22.TimeSlot.fromJson(data) as T;
    }
    if (t == _i1.getType<_i5.Customer?>()) {
      return (data != null ? _i5.Customer.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.Merchant?>()) {
      return (data != null ? _i6.Merchant.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.Day?>()) {
      return (data != null ? _i7.Day.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.ProductStatus?>()) {
      return (data != null ? _i8.ProductStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.StockMovementType?>()) {
      return (data != null ? _i9.StockMovementType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.StockReferenceType?>()) {
      return (data != null ? _i10.StockReferenceType.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i11.NotFoundException?>()) {
      return (data != null ? _i11.NotFoundException.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.ValidationException?>()) {
      return (data != null ? _i12.ValidationException.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i13.ApiResponse?>()) {
      return (data != null ? _i13.ApiResponse.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i14.SessionInfo?>()) {
      return (data != null ? _i14.SessionInfo.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i15.StockSummary?>()) {
      return (data != null ? _i15.StockSummary.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i16.Category?>()) {
      return (data != null ? _i16.Category.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i17.Counter?>()) {
      return (data != null ? _i17.Counter.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i18.Product?>()) {
      return (data != null ? _i18.Product.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i19.StockLog?>()) {
      return (data != null ? _i19.StockLog.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i20.Store?>()) {
      return (data != null ? _i20.Store.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i21.Terminal?>()) {
      return (data != null ? _i21.Terminal.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i22.TimeSlot?>()) {
      return (data != null ? _i22.TimeSlot.fromJson(data) : null) as T;
    }
    if (t == List<_i22.TimeSlot>) {
      return (data as List).map((e) => deserialize<_i22.TimeSlot>(e)).toList()
          as T;
    }
    if (t == List<_i4.AuthUserModel>) {
      return (data as List)
              .map((e) => deserialize<_i4.AuthUserModel>(e))
              .toList()
          as T;
    }
    if (t == List<_i23.Category>) {
      return (data as List).map((e) => deserialize<_i23.Category>(e)).toList()
          as T;
    }
    if (t == List<_i24.Counter>) {
      return (data as List).map((e) => deserialize<_i24.Counter>(e)).toList()
          as T;
    }
    if (t == List<_i25.Customer>) {
      return (data as List).map((e) => deserialize<_i25.Customer>(e)).toList()
          as T;
    }
    if (t == List<_i26.Merchant>) {
      return (data as List).map((e) => deserialize<_i26.Merchant>(e)).toList()
          as T;
    }
    if (t == List<_i27.Product>) {
      return (data as List).map((e) => deserialize<_i27.Product>(e)).toList()
          as T;
    }
    if (t == List<_i28.StockLog>) {
      return (data as List).map((e) => deserialize<_i28.StockLog>(e)).toList()
          as T;
    }
    if (t == List<dynamic>) {
      return (data as List).map((e) => deserialize<dynamic>(e)).toList() as T;
    }
    if (t == List<_i29.Store>) {
      return (data as List).map((e) => deserialize<_i29.Store>(e)).toList()
          as T;
    }
    if (t == List<_i30.Terminal>) {
      return (data as List).map((e) => deserialize<_i30.Terminal>(e)).toList()
          as T;
    }
    try {
      return _i3.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _i4.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _i2.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  static String? getClassNameForType(Type type) {
    return switch (type) {
      _i5.Customer => 'Customer',
      _i6.Merchant => 'Merchant',
      _i7.Day => 'Day',
      _i8.ProductStatus => 'ProductStatus',
      _i9.StockMovementType => 'StockMovementType',
      _i10.StockReferenceType => 'StockReferenceType',
      _i11.NotFoundException => 'NotFoundException',
      _i12.ValidationException => 'ValidationException',
      _i13.ApiResponse => 'ApiResponse',
      _i14.SessionInfo => 'SessionInfo',
      _i15.StockSummary => 'StockSummary',
      _i16.Category => 'Category',
      _i17.Counter => 'Counter',
      _i18.Product => 'Product',
      _i19.StockLog => 'StockLog',
      _i20.Store => 'Store',
      _i21.Terminal => 'Terminal',
      _i22.TimeSlot => 'TimeSlot',
      _ => null,
    };
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;

    if (data is Map<String, dynamic> && data['__className__'] is String) {
      return (data['__className__'] as String).replaceFirst('pos.', '');
    }

    switch (data) {
      case _i5.Customer():
        return 'Customer';
      case _i6.Merchant():
        return 'Merchant';
      case _i7.Day():
        return 'Day';
      case _i8.ProductStatus():
        return 'ProductStatus';
      case _i9.StockMovementType():
        return 'StockMovementType';
      case _i10.StockReferenceType():
        return 'StockReferenceType';
      case _i11.NotFoundException():
        return 'NotFoundException';
      case _i12.ValidationException():
        return 'ValidationException';
      case _i13.ApiResponse():
        return 'ApiResponse';
      case _i14.SessionInfo():
        return 'SessionInfo';
      case _i15.StockSummary():
        return 'StockSummary';
      case _i16.Category():
        return 'Category';
      case _i17.Counter():
        return 'Counter';
      case _i18.Product():
        return 'Product';
      case _i19.StockLog():
        return 'StockLog';
      case _i20.Store():
        return 'Store';
      case _i21.Terminal():
        return 'Terminal';
      case _i22.TimeSlot():
        return 'TimeSlot';
    }
    className = _i2.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod.$className';
    }
    className = _i3.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth_idp.$className';
    }
    className = _i4.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth_core.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'Customer') {
      return deserialize<_i5.Customer>(data['data']);
    }
    if (dataClassName == 'Merchant') {
      return deserialize<_i6.Merchant>(data['data']);
    }
    if (dataClassName == 'Day') {
      return deserialize<_i7.Day>(data['data']);
    }
    if (dataClassName == 'ProductStatus') {
      return deserialize<_i8.ProductStatus>(data['data']);
    }
    if (dataClassName == 'StockMovementType') {
      return deserialize<_i9.StockMovementType>(data['data']);
    }
    if (dataClassName == 'StockReferenceType') {
      return deserialize<_i10.StockReferenceType>(data['data']);
    }
    if (dataClassName == 'NotFoundException') {
      return deserialize<_i11.NotFoundException>(data['data']);
    }
    if (dataClassName == 'ValidationException') {
      return deserialize<_i12.ValidationException>(data['data']);
    }
    if (dataClassName == 'ApiResponse') {
      return deserialize<_i13.ApiResponse>(data['data']);
    }
    if (dataClassName == 'SessionInfo') {
      return deserialize<_i14.SessionInfo>(data['data']);
    }
    if (dataClassName == 'StockSummary') {
      return deserialize<_i15.StockSummary>(data['data']);
    }
    if (dataClassName == 'Category') {
      return deserialize<_i16.Category>(data['data']);
    }
    if (dataClassName == 'Counter') {
      return deserialize<_i17.Counter>(data['data']);
    }
    if (dataClassName == 'Product') {
      return deserialize<_i18.Product>(data['data']);
    }
    if (dataClassName == 'StockLog') {
      return deserialize<_i19.StockLog>(data['data']);
    }
    if (dataClassName == 'Store') {
      return deserialize<_i20.Store>(data['data']);
    }
    if (dataClassName == 'Terminal') {
      return deserialize<_i21.Terminal>(data['data']);
    }
    if (dataClassName == 'TimeSlot') {
      return deserialize<_i22.TimeSlot>(data['data']);
    }
    if (dataClassName.startsWith('serverpod.')) {
      data['className'] = dataClassName.substring(10);
      return _i2.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth_idp.')) {
      data['className'] = dataClassName.substring(19);
      return _i3.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth_core.')) {
      data['className'] = dataClassName.substring(20);
      return _i4.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }

  @override
  _i1.Table? getTableForType(Type t) {
    {
      var table = _i3.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    {
      var table = _i4.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    {
      var table = _i2.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    switch (t) {
      case _i5.Customer:
        return _i5.Customer.t;
      case _i6.Merchant:
        return _i6.Merchant.t;
      case _i16.Category:
        return _i16.Category.t;
      case _i17.Counter:
        return _i17.Counter.t;
      case _i18.Product:
        return _i18.Product.t;
      case _i19.StockLog:
        return _i19.StockLog.t;
      case _i20.Store:
        return _i20.Store.t;
      case _i21.Terminal:
        return _i21.Terminal.t;
    }
    return null;
  }

  @override
  List<_i2.TableDefinition> getTargetTableDefinitions() =>
      targetTableDefinitions;

  @override
  String getModuleName() => 'pos';
}
