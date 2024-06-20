import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaraurant_app/src/data/models/table_model.dart';

class TableDetailPage extends StatelessWidget {
  const TableDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments = Get.arguments as TableModel;

    return Scaffold(
      appBar: AppBar(
        title: Text(arguments.title ?? 'Table detail page'),
      ),
      body: Text('Table detail page'),
    );
  }
}
