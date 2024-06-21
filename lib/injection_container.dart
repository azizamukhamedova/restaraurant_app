import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

/// utils
import '/core/network/client.dart';
import '/core/network/network_info.dart';

/// services
import '/src/data/database/app_db.dart';
import '/src/domain/usecases/.usecases.dart';
import '/src/data/datasources/.datasources.dart';
import '/src/domain/repositories/.repositories.dart';
import '/src/presentation/controllers/.controllers.dart';

init() async {
  /// db
  final database = AppDatabase();
  Get.put(database, permanent: true);

  // core
  Get.put(addInterceptor(Dio()));
  Get.put(Connectivity(), permanent: true);
  Get.put(InternetConnectionChecker(), permanent: true);
  Get.put<NetworkInfo>(
    NetworkInfoImpl(
      connectivity: Get.find(),
      dataChecker: Get.find(),
    ),
    permanent: true,
  );

  // datasources
  Get.lazyPut<TableLocalDatasource>(
    () => TableLocalDatasourceImpl(db: database),
    fenix: true,
  );
  Get.put<TableRemoteDatasource>(
    TableRemoteDatasourceImpl(client: Get.find()),
  );
  Get.lazyPut<MealLocalDatasource>(
    () => MealLocalDatasourceImpl(db: database),
    fenix: true,
  );
  Get.put<MealRemoteDatasource>(
    MealRemoteDatasourceImpl(client: Get.find()),
  );
  Get.lazyPut<OrderLocalDatasource>(
    () => OrderLocalDatasourceImpl(db: database),
    fenix: true,
  );
  Get.put<OrderRemoteDatasource>(
    OrderRemoteDatasourceImpl(client: Get.find()),
  );
  Get.lazyPut<BillLocalDatasource>(
    () => BillLocalDatasourceImpl(db: database),
    fenix: true,
  );
  Get.put<BillRemoteDatasource>(
    BillRemoteDatasourceImpl(client: Get.find()),
  );

  // repositories
  Get.lazyPut<TableRepo>(
    () => TableRepoImpl(
      networkInfo: Get.find(),
      remoteDatasource: Get.find(),
      localDatasource: Get.find(),
    ),
    fenix: true,
  );
  Get.lazyPut<MealRepo>(
    () => MealRepoImpl(
      networkInfo: Get.find(),
      remoteDatasource: Get.find(),
      localDatasource: Get.find(),
    ),
    fenix: true,
  );
  Get.lazyPut<OrderRepo>(
    () => OrderRepoImpl(
      networkInfo: Get.find(),
      remoteDatasource: Get.find(),
      localDatasource: Get.find(),
    ),
    fenix: true,
  );
  Get.lazyPut<BillRepo>(
    () => BillRepoImpl(
      networkInfo: Get.find(),
      remoteDatasource: Get.find(),
      localDatasource: Get.find(),
    ),
    fenix: true,
  );

  // usecases
  Get.lazyPut(() => GetTables(repo: Get.find()), fenix: true);
  Get.lazyPut(() => ChangeStatusOfTable(repo: Get.find()), fenix: true);
  Get.lazyPut(() => GetMeals(repo: Get.find()), fenix: true);
  Get.lazyPut(() => GetOrdersForTable(repo: Get.find()), fenix: true);
  Get.lazyPut(() => SaveOrdersForTable(repo: Get.find()), fenix: true);
  Get.lazyPut(() => DeleteBill(repo: Get.find()), fenix: true);
  Get.lazyPut(() => GetBills(repo: Get.find()), fenix: true);
  Get.lazyPut(() => DeleteOrdersForTable(repo: Get.find()), fenix: true);
  Get.lazyPut(() => CreateBill(repo: Get.find()), fenix: true);

  // controllers
  Get.put<HomePageControllerImpl>(
    HomePageControllerImpl(
      getTablesUsecase: Get.find(),
      getBillsUsecase: Get.find(),
    ),
  );
  Get.put<TableDetailPageControllerImpl>(
    TableDetailPageControllerImpl(
      getMealsUsecase: Get.find(),
      createBillUsecase: Get.find(),
      getOrdersForTableUsecase: Get.find(),
      saveOrdersForTableUsecase: Get.find(),
      changeStatusOfTableUsecase: Get.find(),
    ),
  );
  Get.put<BillDetailPageControllerImpl>(
    BillDetailPageControllerImpl(
      deleteBillUsecase: Get.find(),
      getOrdersForTableUsecase: Get.find(),
      changeStatusOfTableUsecase: Get.find(),
      deleteOrdersForTableUsecase: Get.find(),
    ),
  );
}
