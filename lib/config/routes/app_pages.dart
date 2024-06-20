import 'package:get/route_manager.dart';

/// app utils
import 'app_routes.dart';

/// screens
import 'pages.dart';

class AppPages {
  static final getPages = [
    GetPage(name: AppRoutes.home, page: () => HomePage()),
    GetPage(name: AppRoutes.tableDetail, page: () => TableDetailPage()),
  ];
}
