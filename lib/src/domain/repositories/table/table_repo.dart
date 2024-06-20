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
    required String status,
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
    required String status,
  }) async {
    bool isConnectedToNetwork = await networkInfo.isConnected;
    try {
      if (isConnectedToNetwork) {
        final res = await remoteDatasource.changeStatus(
          id: id,
          status: status,
        );
        return Right(res);
      } else {
        final res = await localDatasource.changeStatus(
          id: id,
          status: status,
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
