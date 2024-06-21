import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// utils
import '/config/dimensions/width.dart';
import '/config/dimensions/padding.dart';

/// models
import '/src/data/models/order_model.dart';
import '/src/data/models/table_model.dart';

/// components
import '/src/presentation/pages/table_detail/widgets.dart';
import '/src/presentation/pages/table_detail/menu_bottom_sheet.dart';

import '/src/presentation/controllers/.controllers.dart';

final TableDetailPageControllerImpl _controller = Get.find();

class TableDetailPage extends StatelessWidget {
  const TableDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments = Get.arguments as TableModel;
    _controller.getOrdersForTable(arguments);

    return Scaffold(
      appBar: AppBar(
        title: Text(arguments.title ?? 'Table detail page'),
        actions: [
          GestureDetector(
            onTap: () {
              _controller.saveOrdersForTable();
            },
            child: const Padding(
              padding: paddingHorizontal16,
              child: Icon(Icons.done, color: Colors.white),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: const Padding(
              padding: paddingHorizontal16,
              child: Icon(Icons.money, color: Colors.white),
            ),
          ),
        ],
      ),
      body: GetBuilder(
        init: _controller,
        id: _controller.orderListId,
        builder: (getContext) {
          if (_controller.orders.isEmpty == true) {
            return const NoOrdersText();
          }

          return ListView(
            children: _controller.orders
                .map(
                  (el) => OrderItem(order: el),
                )
                .toList(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.menu_book),
        onPressed: () {
          openMenu(_controller);
        },
      ),
    );
  }
}

class OrderItem extends StatelessWidget {
  final OrderModel order;
  const OrderItem({
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
          Row(
            children: [
              DecreaseButton(
                decrease: () => _controller.decreaseMeal(order),
                color: Colors.blue,
              ),
              horizontalSpace5,
              Text(
                (order.quantity ?? 0).toString(),
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              horizontalSpace5,
              IncreaseButton(
                add: () => _controller.addMeal(order.meal!),
                color: Colors.blue,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class NoOrdersText extends StatelessWidget {
  const NoOrdersText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: paddingBottom60,
        child: Text(
          'No orders. Select meals from menu',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
