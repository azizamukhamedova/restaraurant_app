import 'package:dartz/dartz.dart';

/// core
import '/core/error/failure.dart';
import '/core/usecase/usecase.dart';

/// models
import '/src/data/models/table_model.dart';

import '/src/domain/repositories/.repositories.dart';

class GetTables extends Usecase<List<TableModel>, NoParams> {
  final TableRepo repo;

  GetTables({required this.repo});

  @override
  Future<Either<Failure, List<TableModel>>> call(NoParams params) {
    return repo.getTables();
  }
}
