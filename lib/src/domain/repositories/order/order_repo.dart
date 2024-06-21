import 'package:dartz/dartz.dart';
import 'package:get/instance_manager.dart';

/// utils
import '/core/error/failure.dart';
import '/core/network/network_info.dart';
import '/core/error/exception_handler.dart';

/// models
import '/src/data/models/order_model.dart';

import '/src/data/datasources/.datasources.dart';

abstract class OrderRepo {
  Future<Either<Failure, List<OrderModel>>> getOrdersForTable({
    required int tableId,
  });
  Future<Either<Failure, void>> saveOrdersForTable({
    required int tableId,
    required List<OrderModel> orders,
  });
  Future<Either<Failure, void>> deleteOrdersForTable({
    required int tableId,
  });
}

class OrderRepoImpl extends OrderRepo {
  final NetworkInfo networkInfo;
  final OrderLocalDatasource localDatasource;
  final OrderRemoteDatasource remoteDatasource;

  OrderRepoImpl({
    required this.networkInfo,
    required this.localDatasource,
    required this.remoteDatasource,
  });

  @override
  Future<Either<Failure, List<OrderModel>>> getOrdersForTable({
    required int tableId,
  }) async {
    bool isConnectedToNetwork = await networkInfo.isConnected;
    try {
      if (isConnectedToNetwork) {
        final res = await remoteDatasource.getOrdersForTable(
          tableId: tableId,
        );
        return Right(res);
      } else {
        final res = await localDatasource.getOrdersForTable(
          tableId: tableId,
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

  @override
  Future<Either<Failure, void>> saveOrdersForTable({
    required int tableId,
    required List<OrderModel> orders,
  }) async {
    bool isConnectedToNetwork = await networkInfo.isConnected;
    try {
      if (isConnectedToNetwork) {
        final res = await remoteDatasource.saveOrdersForTable(
          tableId: tableId,
          orders: orders,
        );
        return Right(res);
      } else {
        final res = await localDatasource.saveOrdersForTable(
          tableId: tableId,
          orders: orders,
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

  @override
  Future<Either<Failure, void>> deleteOrdersForTable({
    required int tableId,
  }) async {
    bool isConnectedToNetwork = await networkInfo.isConnected;
    try {
      if (isConnectedToNetwork) {
        final res = await remoteDatasource.deleteOrdersForTable(
          tableId: tableId,
        );
        return Right(res);
      } else {
        final res = await localDatasource.deleteOrdersForTable(
          tableId: tableId,
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
