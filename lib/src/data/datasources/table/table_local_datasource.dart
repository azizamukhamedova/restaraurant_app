import 'package:drift/drift.dart';

import '/src/data/database/app_db.dart';

/// models
import '/src/data/models/table_model.dart';

abstract class TableLocalDatasource {
  Future<List<TableModel>> fetchTables();
  Future<void> changeStatus({
    required int id,
    required bool hasStarted,
    required bool hasGivenBill,
  });
}

class TableLocalDatasourceImpl extends TableLocalDatasource {
  final AppDatabase db;

  TableLocalDatasourceImpl({required this.db});

  @override
  Future<List<TableModel>> fetchTables() async {
    List<RestaurantTableData> list = await db.select(db.restaurantTable).get();
    if (list.isEmpty) {
      for (int i = 0; i < 10; i++) {
        await db.into(db.restaurantTable).insert(
              RestaurantTableCompanion.insert(title: Value('Table ${i + 1}')),
            );
      }
      list = await db.select(db.restaurantTable).get();
    }
    return list.map(
      (el) {
        return TableModel(
          id: el.id,
          title: el.title,
          status: el.status,
          hasStarted: el.hasStarted,
          hasGivenBill: el.hasGivenBill,
        );
      },
    ).toList();
  }

  @override
  Future<void> changeStatus({
    required int id,
    required bool hasStarted,
    required bool hasGivenBill,
  }) async {
    RestaurantTableData? table = await (db.select(db.restaurantTable)
          ..where((tbl) => tbl.id.equals(id)))
        .getSingleOrNull();
    if (table != null) {
      db.update(db.restaurantTable).replace(
            table.copyWith(
              hasStarted: Value(hasStarted),
              hasGivenBill: Value(hasGivenBill),
            ),
          );
    }
  }
}
