import 'package:dartz/dartz.dart';
import 'package:get/instance_manager.dart';

/// utils
import '/core/error/failure.dart';
import '/core/network/network_info.dart';
import '/core/error/exception_handler.dart';

/// models
import '/src/data/models/bill_model.dart';
import '/src/data/models/table_model.dart';

import '/src/data/datasources/.datasources.dart';

abstract class BillRepo {
  Future<Either<Failure, List<BillModel>>> getBills();
  Future<Either<Failure, void>> createBill({
    required TableModel table,
  });
  Future<Either<Failure, void>> deleteBill({
    required int id,
  });
}

class BillRepoImpl extends BillRepo {
  final NetworkInfo networkInfo;
  final BillLocalDatasource localDatasource;
  final BillRemoteDatasource remoteDatasource;

  BillRepoImpl({
    required this.networkInfo,
    required this.localDatasource,
    required this.remoteDatasource,
  });

  @override
  Future<Either<Failure, List<BillModel>>> getBills() async {
    bool isConnectedToNetwork = await networkInfo.isConnected;
    try {
      if (isConnectedToNetwork) {
        final res = await remoteDatasource.fetchBills();
        return Right(res);
      } else {
        final res = await localDatasource.fetchBills();
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
  Future<Either<Failure, void>> createBill({
    required TableModel table,
  }) async {
    bool isConnectedToNetwork = await networkInfo.isConnected;
    try {
      if (isConnectedToNetwork) {
        final res = await remoteDatasource.createBill(table: table);
        return Right(res);
      } else {
        final res = await localDatasource.createBill(table: table);
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
  Future<Either<Failure, void>> deleteBill({
    required int id,
  }) async {
    bool isConnectedToNetwork = await networkInfo.isConnected;
    try {
      if (isConnectedToNetwork) {
        final res = await remoteDatasource.deleteBill(id: id);
        return Right(res);
      } else {
        final res = await localDatasource.deleteBill(id: id);
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
