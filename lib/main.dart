import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'config/routes/app_pages.dart';
import 'config/routes/app_routes.dart';
import '/injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaraurant app',
      debugShowCheckedModeBanner: false,
      home: GetMaterialApp(
        title: 'Restaraurant app',
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.home,
        getPages: AppPages.getPages,
      ),
    );
  }
}
