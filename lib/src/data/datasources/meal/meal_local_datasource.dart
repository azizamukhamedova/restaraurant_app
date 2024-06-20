import 'package:drift/drift.dart';

import '/src/data/database/app_db.dart';

/// models
import '/src/data/models/meal_model.dart';

abstract class MealLocalDatasource {
  Future<List<MealModel>> fetchMeals();
}

class MealLocalDatasourceImpl extends MealLocalDatasource {
  final AppDatabase db;

  MealLocalDatasourceImpl({required this.db});

  @override
  Future<List<MealModel>> fetchMeals() async {
    List<MealData> list = await db.select(db.meal).get();
    if (list.isEmpty) {
      for (int i = 0; i < 10; i++) {
        await db.into(db.meal).insert(
              MealCompanion.insert(
                title: Value('Meal ${i + 1}'),
                price: Value((i + 1) * 5),
              ),
            );
      }
      list = await db.select(db.meal).get();
    }
    return list.map(
      (el) {
        return MealModel(id: el.id, title: el.title, price: el.price);
      },
    ).toList();
  }
}
