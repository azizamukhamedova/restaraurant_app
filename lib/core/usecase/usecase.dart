import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:restaraurant_app/core/error/failure.dart';

abstract class Usecase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

abstract class Params extends Equatable {}

class NoParams extends Params {
  @override
  List<Object?> get props => [];
}
