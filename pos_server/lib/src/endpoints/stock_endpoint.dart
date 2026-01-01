import 'package:pos_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class StockEndpoint extends Endpoint {
  Future<StockLog> createStockLog(
    Session session, {
    required StockLog log,
  }) async {
    if (log.storeId <= 0 || log.productId <= 0) {
      throw ValidationException(message: 'Invalid storeId or productId');
    }
    if (log.quantity < 0) {
      throw ValidationException(message: 'Quantity must be non-negative');
    }

    log.createdAt ??= DateTime.now().toUtc();

    final created = await StockLog.db.insertRow(session, log);
    return created;
  }

  Future<List<StockLog>> getAllStockLogs(
    Session session, {
    required int storeId,
  }) async {
    final stockLogs = await StockLog.db.find(
      session,
      where: (s) => s.storeId.equals(storeId),
    );

    return stockLogs;
  }

  Future<List<StockLog>> getAllStockLogsDev(Session session) async {
    final stockLogs = await StockLog.db.find(
      session,
    );

    return stockLogs;
  }

  Future<List> getStockSummary(
    Session session, {
    required int storeId,
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    final startDateUtc = DateTime(
      startDate.year,
      startDate.month,
      startDate.day,
    ).toUtc();
    final endDateUtc =
        DateTime(
              endDate.year,
              endDate.month,
              endDate.day,
            )
            .add(const Duration(days: 1))
            .subtract(const Duration(milliseconds: 1))
            .toUtc();

    final stockLogs = await StockLog.db.find(
      session,
      where: (l) =>
          l.storeId.equals(storeId) &
          l.movementAt.between(startDateUtc, endDateUtc),
      orderBy: (l) => l.movementAt,
    );

    final Map<int, List<StockLog>> groupedLogs = {};

    for (var log in stockLogs) {
      groupedLogs.putIfAbsent(
        log.productId,
        () => [],
      );
      groupedLogs[log.productId]!.add(log);
    }

    final productIds = groupedLogs.keys.toSet();

    final products = await Product.db.find(
      session,
      where: (p) => p.id.inSet(productIds),
    );

    final productNameMap = {
      for (var product in products)
        if (product.id != null) product.id!: product.name,
    };

    final List<StockSummary> summaryResult = [];

    for (var entry in groupedLogs.entries) {
      final logs = entry.value;
      final productId = entry.key;

      int openingStock = logs.first.stockBefore;
      int closingStock = logs.last.stockAfter;

      int stockIn = 0;
      int stockOut = 0;
      int wastage = 0;
      int adjustment = 0;

      for (var log in logs) {
        switch (log.movementType) {
          case .IN:
            stockIn += log.quantity;
            break;
          case .OUT:
            stockOut += log.quantity;
            break;
          case .WASTAGE:
            wastage += log.quantity;
            break;
          case .ADJUSTMENT:
            adjustment += log.quantity;
            break;
        }
      }

      final summary = StockSummary(
        productId: productId,
        productName: productNameMap[productId] ?? 'Unknown',
        openingStock: openingStock,
        stockIn: stockIn,
        stockOut: stockOut,
        wastage: wastage,
        adjustment: adjustment,
        closingStock: closingStock,
      );

      summaryResult.add(summary);
    }

    return summaryResult;
  }
}
