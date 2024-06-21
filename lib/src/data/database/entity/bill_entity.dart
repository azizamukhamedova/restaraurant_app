import 'package:drift/drift.dart';

class Bill extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get tableId => integer().named('table_id').nullable()();
  TextColumn get tableTitle => text().named('table_title').nullable()();
}
