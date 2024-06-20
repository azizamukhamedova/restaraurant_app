import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

/// core
import '/core/error/failure.dart';
import '/core/usecase/usecase.dart';

/// models
import '/src/data/models/order_model.dart';

import '/src/domain/repositories/.repositories.dart';

class GetOrdersForTable
    extends Usecase<List<OrderModel>, GetOrdersForTableParams> {
  final OrderRepo repo;

  GetOrdersForTable({required this.repo});

  @override
  Future<Either<Failure, List<OrderModel>>> call(
      GetOrdersForTableParams params) {
    return repo.getOrdersForTable(tableId: params.tableId);
  }
}

class GetOrdersForTableParams extends Equatable {
  final int tableId;

  const GetOrdersForTableParams({
    required this.tableId,
  });

  @override
  List<Object?> get props => [tableId];
}
