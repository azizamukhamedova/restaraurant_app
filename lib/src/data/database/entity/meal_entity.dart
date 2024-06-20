import 'package:drift/drift.dart';

class Meal extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().named('title').nullable()();
  IntColumn get price => integer().named('price').nullable()();
}
