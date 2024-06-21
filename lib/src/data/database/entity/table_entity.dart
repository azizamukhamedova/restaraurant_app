import 'package:drift/drift.dart';

class RestaurantTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().named('title').nullable()();
  TextColumn get status => text().named('status').nullable()();
  BoolColumn get hasStarted => boolean().named('has_started').nullable()();
  BoolColumn get hasGivenBill => boolean().named('has_given_bill').nullable()();
}
