import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

/// core
import '/core/error/failure.dart';
import '/core/usecase/usecase.dart';

import '/src/domain/repositories/.repositories.dart';

class DeleteOrdersForTable extends Usecase<void, DeleteOrdersForTableParams> {
  final OrderRepo repo;

  DeleteOrdersForTable({required this.repo});

  @override
  Future<Either<Failure, void>> call(DeleteOrdersForTableParams params) {
    return repo.deleteOrdersForTable(tableId: params.tableId);
  }
}

class DeleteOrdersForTableParams extends Equatable {
  final int tableId;

  const DeleteOrdersForTableParams({
    required this.tableId,
  });

  @override
  List<Object?> get props => [tableId];
}
