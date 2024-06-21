import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

/// core
import '/core/error/failure.dart';
import '/core/usecase/usecase.dart';

import '/src/domain/repositories/.repositories.dart';

class GetTableTitle extends Usecase<String, GetTableTitleParams> {
  final TableRepo repo;

  GetTableTitle({required this.repo});

  @override
  Future<Either<Failure, String>> call(GetTableTitleParams params) {
    return repo.getTableTitle(id: params.id);
  }
}

class GetTableTitleParams extends Equatable {
  final int id;

  const GetTableTitleParams({
    required this.id,
  });

  @override
  List<Object?> get props => [
        id,
      ];
}
