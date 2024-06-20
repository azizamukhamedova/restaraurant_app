import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// utils
import '/config/dimensions/width.dart';
import '/config/dimensions/height.dart';
import '/config/routes/app_routes.dart';
import '/config/dimensions/padding.dart';

/// models
import '/src/data/models/table_model.dart';

import '/src/presentation/controllers/.controllers.dart';

final HomePageControllerImpl _controller = Get.find();

class TablesPage extends StatelessWidget {
  const TablesPage({super.key});

  @override
  Widget build(BuildContext context) {
    _controller.getTables();

    return GetBuilder(
      init: _controller,
      id: _controller.tableListId,
      builder: (getContext) {
        return ListView(
          children:
              _controller.tables.map((el) => TableItem(table: el)).toList(),
        );
      },
    );
  }
}

class TableItem extends StatelessWidget {
  final TableModel table;
  const TableItem({
    required this.table,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(AppRoutes.tableDetail, arguments: table),
      child: Container(
        margin: paddingTop16,
        padding: paddingAll20,
        decoration: BoxDecoration(color: Colors.blue[50]),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.table_restaurant,
              color: Colors.blueAccent,
            ),
            horizontalSpace20,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(table.title ?? 'Table'),
                table.status?.isNotEmpty == true
                    ? Text(table.status ?? '')
                    : empty,
              ],
            ),
          ],
        ),
      ),
    );
  }
}
