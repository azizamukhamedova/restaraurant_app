import 'package:drift/drift.dart';

class RestaurantTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().named('title').nullable()();
  TextColumn get status => text().named('status').nullable()();
}
