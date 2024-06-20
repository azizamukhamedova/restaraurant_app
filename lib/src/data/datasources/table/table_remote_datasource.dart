import 'package:dio/dio.dart';

/// models
import '/src/data/models/table_model.dart';

abstract class TableRemoteDatasource {
  Future<List<TableModel>> fetchTables();
  Future<void> changeStatus({
    required int id,
    required String status,
  });
}

class TableRemoteDatasourceImpl extends TableRemoteDatasource {
  final Dio client;

  TableRemoteDatasourceImpl({required this.client});

  @override
  Future<List<TableModel>> fetchTables() {
    throw UnimplementedError();
  }

  @override
  Future<void> changeStatus({
    required int id,
    required String status,
  }) {
    throw UnimplementedError();
  }
}
