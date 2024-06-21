import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

/// core
import '/core/error/failure.dart';
import '/core/usecase/usecase.dart';

import '/src/domain/repositories/.repositories.dart';

class ChangeStatusOfTable extends Usecase<void, ChangeStatusOfTableParams> {
  final TableRepo repo;

  ChangeStatusOfTable({required this.repo});

  @override
  Future<Either<Failure, void>> call(ChangeStatusOfTableParams params) {
    return repo.changeStatus(
      id: params.id,
      hasStarted: params.hasStarted,
      hasGivenBill: params.hasGivenBill,
    );
  }
}

class ChangeStatusOfTableParams extends Equatable {
  final int id;
  final bool? hasStarted;
  final bool? hasGivenBill;

  const ChangeStatusOfTableParams({
    required this.id,
    required this.hasStarted,
    required this.hasGivenBill,
  });

  @override
  List<Object?> get props => [
        id,
        hasStarted,
        hasGivenBill,
      ];
}
