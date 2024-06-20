import 'package:dartz/dartz.dart';
import 'package:get/instance_manager.dart';

/// utils
import '/core/error/failure.dart';
import '/core/network/network_info.dart';
import '/core/error/exception_handler.dart';

/// models
import '/src/data/models/meal_model.dart';

import '/src/data/datasources/.datasources.dart';

abstract class MealRepo {
  Future<Either<Failure, List<MealModel>>> getMeals();
}

class MealRepoImpl extends MealRepo {
  final NetworkInfo networkInfo;
  final MealLocalDatasource localDatasource;
  final MealRemoteDatasource remoteDatasource;

  MealRepoImpl({
    required this.networkInfo,
    required this.localDatasource,
    required this.remoteDatasource,
  });

  @override
  Future<Either<Failure, List<MealModel>>> getMeals() async {
    bool isConnectedToNetwork = await networkInfo.isConnected;
    try {
      if (isConnectedToNetwork) {
        final res = await remoteDatasource.fetchMeals();
        return Right(res);
      } else {
        final res = await localDatasource.fetchMeals();
        return Right(res);
      }
    } catch (e) {
      Get.log(
        e.toString(),
        isError: true,
      );
      final failure = handleException(e as Exception);
      return Left(failure);
    }
  }
}
