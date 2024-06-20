import 'package:drift/drift.dart';

class Order extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get tableId => integer().named('table_id').nullable()();
  IntColumn get mealId => integer().named('meal_id').nullable()();
}
