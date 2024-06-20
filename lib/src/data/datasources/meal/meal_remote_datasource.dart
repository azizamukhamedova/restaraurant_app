import 'package:dio/dio.dart';

/// models
import '/src/data/models/meal_model.dart';

abstract class MealRemoteDatasource {
  Future<List<MealModel>> fetchMeals();
}

class MealRemoteDatasourceImpl extends MealRemoteDatasource {
  final Dio client;

  MealRemoteDatasourceImpl({required this.client});

  @override
  Future<List<MealModel>> fetchMeals() {
    throw UnimplementedError();
  }
}
