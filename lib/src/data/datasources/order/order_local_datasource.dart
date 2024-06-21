import 'package:drift/drift.dart';
import 'package:get/get.dart' hide Value;

import '/src/data/database/app_db.dart';

/// models
import '/src/data/models/meal_model.dart';
import '/src/data/models/order_model.dart';

abstract class OrderLocalDatasource {
  Future<List<OrderModel>> getOrdersForTable({
    required int tableId,
  });
  Future<void> saveOrdersForTable({
    required int tableId,
    required List<OrderModel> orders,
  });
}

class OrderLocalDatasourceImpl extends OrderLocalDatasource {
  final AppDatabase db;

  OrderLocalDatasourceImpl({required this.db});

  @override
  Future<List<OrderModel>> getOrdersForTable({
    required int tableId,
  }) async {
    List<OrderData> list = await db.select(db.order).get();
    list.removeWhere((element) => element.tableId != tableId);
    if (list.isEmpty == true) return [];

    Map<int, int> orders = {};
    for (int i = 0; i < list.length; i++) {
      if (orders.keys.contains(list[i].mealId)) {
        orders[list[i].mealId!] = orders[list[i].mealId!]! + 1;
      } else {
        orders[list[i].mealId!] = 1;
      }
    }

    List<OrderModel> orderModels = [];
    List<MealData> mealslist = await db.select(db.meal).get();
    orders.forEach((key, value) {
      MealData? meal = mealslist.firstWhereOrNull(
        (element) => element.id == key,
      );
      if (meal != null) {
        orderModels.add(
          OrderModel(
            quantity: value,
            tableId: tableId,
            meal: MealModel(
              id: meal.id,
              title: meal.title,
              price: meal.price,
            ),
          ),
        );
      }
    });

    return orderModels;
  }

  @override
  Future<void> saveOrdersForTable({
    required int tableId,
    required List<OrderModel> orders,
  }) async {
    await (db.delete(db.order)..where((tbl) => tbl.tableId.equals(tableId)))
        .go();

    for (OrderModel order in orders) {
      for (var i = 0; i < (order.quantity ?? 0); i++) {
        await db.into(db.order).insert(
              OrderCompanion.insert(
                tableId: Value(tableId),
                mealId: Value(
                  order.meal?.id,
                ),
              ),
            );
      }
    }
  }
}
