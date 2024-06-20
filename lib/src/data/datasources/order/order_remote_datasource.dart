import 'package:dio/dio.dart';

/// models
import '/src/data/models/order_model.dart';

abstract class OrderRemoteDatasource {
  Future<List<OrderModel>> getOrdersForTable({
    required int tableId,
  });
  Future<void> saveOrdersForTable({
    required int tableId,
    required List<OrderModel> orders,
  });
}

class OrderRemoteDatasourceImpl extends OrderRemoteDatasource {
  final Dio client;

  OrderRemoteDatasourceImpl({required this.client});

  @override
  Future<List<OrderModel>> getOrdersForTable({
    required int tableId,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<void> saveOrdersForTable({
    required int tableId,
    required List<OrderModel> orders,
  }) {
    throw UnimplementedError();
  }
}
