import 'package:flutter/material.dart';

import 'bills/bills_page.dart';
import 'tables/tables_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.table_restaurant)),
                Tab(icon: Icon(Icons.money)),
              ],
            ),
            title: const Text('Tabs Demo'),
          ),
          body: const TabBarView(
            children: [
              TablesPage(),
              BillsPage(),
            ],
          ),
        ),
      ),
    );
  }
}
