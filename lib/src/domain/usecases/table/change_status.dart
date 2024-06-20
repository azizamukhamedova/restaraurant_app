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
      status: params.status,
    );
  }
}

class ChangeStatusOfTableParams extends Equatable {
  final int id;
  final String status;

  const ChangeStatusOfTableParams({
    required this.id,
    required this.status,
  });

  @override
  List<Object?> get props => [id, status];
}
