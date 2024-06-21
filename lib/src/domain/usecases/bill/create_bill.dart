import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

/// core
import '/core/error/failure.dart';
import '/core/usecase/usecase.dart';

/// models
import '/src/data/models/table_model.dart';

import '/src/domain/repositories/.repositories.dart';

class CreateBill extends Usecase<void, CreateBillParams> {
  final BillRepo repo;

  CreateBill({required this.repo});

  @override
  Future<Either<Failure, void>> call(CreateBillParams params) {
    return repo.createBill(table: params.table);
  }
}

class CreateBillParams extends Equatable {
  final TableModel table;

  const CreateBillParams({
    required this.table,
  });

  @override
  List<Object?> get props => [
        table,
      ];
}
