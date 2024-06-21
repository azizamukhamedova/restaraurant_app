import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// utils
import '/config/dimensions/width.dart';
import '/config/dimensions/padding.dart';

/// models
import '/src/data/models/bill_model.dart';
import '/src/data/models/order_model.dart';

import '/src/presentation/controllers/.controllers.dart';

final BillDetailPageControllerImpl _controller = Get.find();

class BillDetailPage extends StatelessWidget {
  const BillDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments = Get.arguments as BillModel;
    _controller.getOrdersForTable(arguments);

    return Scaffold(
        appBar: AppBar(
          title: Text(arguments.tableTitle ?? 'Bill detail page'),
          actions: [
            GestureDetector(
              onTap: () {
                _controller.deleteBillForTable();
              },
              child: const Padding(
                padding: paddingHorizontal16,
                child: Icon(Icons.done, color: Colors.white),
              ),
            ),
          ],
        ),
        body: GetBuilder(
          init: _controller,
          id: _controller.orderListId,
          builder: (getContext) {
            return ListView(
              children: _controller.orders
                  .map(
                    (el) => OrderItemForBill(order: el),
                  )
                  .toList(),
            );
          },
        ));
  }
}

class OrderItemForBill extends StatelessWidget {
  final OrderModel order;
  const OrderItemForBill({
    Key? key,
    required this.order,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: paddingTop16,
      padding: paddingAll20,
      decoration: BoxDecoration(color: Colors.blue[50]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.wine_bar,
                color: Color.fromARGB(255, 68, 134, 255),
              ),
              horizontalSpace20,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(order.meal?.title ?? 'Meal'),
                  Text('price: ${order.meal?.price?.toString() ?? ''} ')
                ],
              ),
            ],
          ),
          Text(
            (order.quantity ?? 0).toString(),
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
