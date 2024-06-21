import 'package:drift/drift.dart';

import 'dart:io';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';

/// entities
import 'entity/table_entity.dart';
import 'entity/bill_entity.dart';
import 'entity/meal_entity.dart';
import 'entity/order_entity.dart';

part 'app_db.g.dart';

@DriftDatabase(
  tables: [RestaurantTable, Bill, Meal, Order],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 4;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (Migrator m) {
          return m.createAll();
        },
        onUpgrade: (migrator, from, to) async {
          if (from == 2) {
            await migrator.addColumn(
                restaurantTable, restaurantTable.hasGivenBill);
          }
          if (from == 2) {
            await migrator.addColumn(
                restaurantTable, restaurantTable.hasStarted);
          }
          if (from < 4) {
            await migrator.addColumn(bill, bill.tableTitle);
          }
        },
      );
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'restaraurant_app_db.sqlite'));

    if (Platform.isAndroid) {
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    }

    return NativeDatabase.createInBackground(file);
  });
}
