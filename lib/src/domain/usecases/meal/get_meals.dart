import 'package:dartz/dartz.dart';

/// core
import '/core/error/failure.dart';
import '/core/usecase/usecase.dart';

/// models
import '/src/data/models/meal_model.dart';

import '/src/domain/repositories/.repositories.dart';

class GetMeals extends Usecase<List<MealModel>, NoParams> {
  final MealRepo repo;

  GetMeals({required this.repo});

  @override
  Future<Either<Failure, List<MealModel>>> call(NoParams params) {
    return repo.getMeals();
  }
}
