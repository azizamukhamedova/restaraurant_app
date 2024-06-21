import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

/// core
import '/core/error/failure.dart';
import '/core/usecase/usecase.dart';

import '/src/domain/repositories/.repositories.dart';

class DeleteBill extends Usecase<void, DeleteBillParams> {
  final BillRepo repo;

  DeleteBill({required this.repo});

  @override
  Future<Either<Failure, void>> call(DeleteBillParams params) {
    return repo.deleteBill(id: params.id);
  }
}

class DeleteBillParams extends Equatable {
  final int id;

  const DeleteBillParams({
    required this.id,
  });

  @override
  List<Object?> get props => [
        id,
      ];
}
