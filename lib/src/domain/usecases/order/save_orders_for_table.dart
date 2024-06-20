import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

/// core
import '/core/error/failure.dart';
import '/core/usecase/usecase.dart';

/// models
import '/src/data/models/order_model.dart';

import '/src/domain/repositories/.repositories.dart';

class SaveOrdersForTable extends Usecase<void, SaveOrdersForTableParams> {
  final OrderRepo repo;

  SaveOrdersForTable({required this.repo});

  @override
  Future<Either<Failure, void>> call(SaveOrdersForTableParams params) {
    return repo.saveOrdersForTable(
      tableId: params.tableId,
      orders: params.orders,
    );
  }
}

class SaveOrdersForTableParams extends Equatable {
  final int tableId;
  final List<OrderModel> orders;

  const SaveOrdersForTableParams({
    required this.tableId,
    required this.orders,
  });

  @override
  List<Object?> get props => [tableId, orders];
}
