import 'package:dartz/dartz.dart';

/// core
import '/core/error/failure.dart';
import '/core/usecase/usecase.dart';

/// models
import '/src/data/models/bill_model.dart';

import '/src/domain/repositories/.repositories.dart';

class GetBills extends Usecase<List<BillModel>, NoParams> {
  final BillRepo repo;

  GetBills({required this.repo});

  @override
  Future<Either<Failure, List<BillModel>>> call(NoParams params) {
    return repo.getBills();
  }
}
