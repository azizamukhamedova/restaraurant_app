import 'package:dartz/dartz.dart';
import 'package:get/instance_manager.dart';

/// utils
import '/core/error/failure.dart';
import '/core/network/network_info.dart';
import '/core/error/exception_handler.dart';

/// models
import '/src/data/models/table_model.dart';

import '/src/data/datasources/.datasources.dart';

abstract class TableRepo {
  Future<Either<Failure, List<TableModel>>> getTables();
  Future<Either<Failure, void>> changeStatus({
    required int id,
    required bool? hasStarted,
    required bool? hasGivenBill,
  });
}

class TableRepoImpl extends TableRepo {
  final NetworkInfo networkInfo;
  final TableLocalDatasource localDatasource;
  final TableRemoteDatasource remoteDatasource;

  TableRepoImpl({
    required this.networkInfo,
    required this.localDatasource,
    required this.remoteDatasource,
  });

  @override
  Future<Either<Failure, List<TableModel>>> getTables() async {
    bool isConnectedToNetwork = await networkInfo.isConnected;
    try {
      if (isConnectedToNetwork) {
        final res = await remoteDatasource.fetchTables();
        return Right(res);
      } else {
        final res = await localDatasource.fetchTables();
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

  @override
  Future<Either<Failure, void>> changeStatus({
    required int id,
    required bool? hasStarted,
    required bool? hasGivenBill,
  }) async {
    bool isConnectedToNetwork = await networkInfo.isConnected;
    try {
      if (isConnectedToNetwork) {
        final res = await remoteDatasource.changeStatus(
          id: id,
          hasStarted: hasStarted,
          hasGivenBill: hasGivenBill,
        );
        return Right(res);
      } else {
        final res = await localDatasource.changeStatus(
          id: id,
          hasStarted: hasStarted,
          hasGivenBill: hasGivenBill,
        );
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
