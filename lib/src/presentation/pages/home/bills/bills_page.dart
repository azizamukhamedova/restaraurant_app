import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// utils
import '/config/dimensions/width.dart';
import '/config/routes/app_routes.dart';
import '/config/dimensions/padding.dart';

/// models
import '/src/data/models/bill_model.dart';

import '/src/presentation/controllers/.controllers.dart';

final HomePageControllerImpl _controller = Get.find();

class BillsPage extends StatelessWidget {
  const BillsPage({super.key});

  @override
  Widget build(BuildContext context) {
    _controller.getBills();
    return GetBuilder(
      init: _controller,
      id: _controller.billListId,
      builder: (getContext) {
        if (_controller.bills.isEmpty == true) {
          return const NoBillsText();
        }

        return ListView(
          children: _controller.bills.map((el) => BillItem(bill: el)).toList(),
        );
      },
    );
  }
}

class BillItem extends StatelessWidget {
  final BillModel bill;
  const BillItem({
    required this.bill,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoutes.tableDetail, arguments: bill);
      },
      child: Container(
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
                  Icons.money,
                  color: Colors.blueAccent,
                ),
                horizontalSpace20,
                Text(bill.tableTitle ?? 'Table'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class NoBillsText extends StatelessWidget {
  const NoBillsText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: paddingBottom60,
        child: Text(
          'There are no bills',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
