import 'package:get/get.dart';
import 'package:restaraurant_app/src/data/models/order_model.dart';

/// utils
import '/core/error/failure.dart';
import '/core/usecase/usecase.dart';

/// models
import '/src/data/models/table_model.dart';

/// usecases
import '/src/domain/usecases/.usecases.dart';

abstract class TableDetailPageController {
  // Future<void> getMeals();
  Future<void> getOrdersForTable(int id);
  Future<void> saveOrdersForTable();
}

class TableDetailPageControllerImpl extends GetxController
    implements TableDetailPageController {
  // usecases
  final GetMeals getMealsUsecase;
  final GetOrdersForTable getOrdersForTableUsecase;
  final SaveOrdersForTable saveOrdersForTableUsecase;
  final ChangeStatusOfTable changeStatusOfTableUsecase;

  TableDetailPageControllerImpl({
    required this.getMealsUsecase,
    required this.getOrdersForTableUsecase,
    required this.saveOrdersForTableUsecase,
    required this.changeStatusOfTableUsecase,
  });

  // results
  List<OrderModel> orders = [];
  int tableId = 0;

  // get builder's id
  final String tableListId = "order_list_id";

  // error messages
  String orderListError = "";

  @override
  Future<void> getOrdersForTable(int id) async {
    tableId = id;
    final alertsResponse = await getOrdersForTableUsecase.call(
      GetOrdersForTableParams(tableId: tableId),
    );
    alertsResponse.fold((failure) {
      if (failure is NetworkFailure) {
        orderListError = "network is not connected!";
        Get.log("network is not connected!");
      } else if (failure is ServerTimeOutFailure) {
        orderListError = "network connection is bad!";
        Get.log("network connection is bad!");
      } else if (failure is ServerUnAuthorizeFailure) {
        ///
      } else {
        orderListError = "Something went wrong!";
        Get.log("Something went wrong!");
      }
      update([tableListId]);
    }, (response) async {
      orders = response;
      update([tableListId]);
    });
  }

  @override
  Future<void> saveOrdersForTable() async {
    final alertsResponse = await saveOrdersForTableUsecase.call(
      SaveOrdersForTableParams(
        tableId: tableId,
        orders: orders,
      ),
    );
    alertsResponse.fold((failure) {
      if (failure is NetworkFailure) {
        orderListError = "network is not connected!";
        Get.log("network is not connected!");
      } else if (failure is ServerTimeOutFailure) {
        orderListError = "network connection is bad!";
        Get.log("network connection is bad!");
      } else if (failure is ServerUnAuthorizeFailure) {
        ///
      } else {
        orderListError = "Something went wrong!";
        Get.log("Something went wrong!");
      }
      update([tableListId]);
    }, (response) async {
      // orders = response;
      update([tableListId]);
    });
  }
}
