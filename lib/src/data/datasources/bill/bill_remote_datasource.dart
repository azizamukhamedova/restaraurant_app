import 'package:dio/dio.dart';

/// models
import '/src/data/models/bill_model.dart';
import '/src/data/models/table_model.dart';

abstract class BillRemoteDatasource {
  Future<List<BillModel>> fetchBills();
  Future<void> createBill({
    required TableModel table,
  });
  Future<void> deleteBill({
    required int id,
  });
}

class BillRemoteDatasourceImpl extends BillRemoteDatasource {
  final Dio client;

  BillRemoteDatasourceImpl({required this.client});

  @override
  Future<List<BillModel>> fetchBills() {
    throw UnimplementedError();
  }

  @override
  Future<void> createBill({
    required TableModel table,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteBill({
    required int id,
  }) {
    throw UnimplementedError();
  }
}
