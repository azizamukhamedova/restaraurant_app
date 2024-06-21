import 'package:get/get.dart';

/// utils
import '/core/error/failure.dart';
import '/core/usecase/usecase.dart';

/// models
import '/src/data/models/meal_model.dart';
import '/src/data/models/order_model.dart';
import '/src/data/models/table_model.dart';

/// usecases
import '/src/domain/usecases/.usecases.dart';

import '/src/presentation/controllers/.controllers.dart';

final HomePageControllerImpl _homeController = Get.find();

abstract class TableDetailPageController {
  Future<void> getMeals();
  Future<void> getOrdersForTable(TableModel table);
  Future<void> saveOrdersForTable();
  Future<void> createBillForTable();
  void addMeal(MealModel meal);
  void decreaseMeal(OrderModel order);
}

class TableDetailPageControllerImpl extends GetxController
    implements TableDetailPageController {
  // usecases
  final GetMeals getMealsUsecase;
  final CreateBill createBillUsecase;
  final GetOrdersForTable getOrdersForTableUsecase;
  final SaveOrdersForTable saveOrdersForTableUsecase;
  final ChangeStatusOfTable changeStatusOfTableUsecase;

  TableDetailPageControllerImpl({
    required this.getMealsUsecase,
    required this.createBillUsecase,
    required this.getOrdersForTableUsecase,
    required this.saveOrdersForTableUsecase,
    required this.changeStatusOfTableUsecase,
  });

  // results
  List<OrderModel> orders = [];
  TableModel? tableModel;
  List<MealModel> meals = [];

  // get builder's id
  final String orderListId = "order_list_id";
  final String mealListId = "meal_list_id";

  // error messages
  String orderListError = "";

  @override
  Future<void> getMeals() async {
    final res = await getMealsUsecase.call(NoParams());
    res.fold((failure) {
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
      update([mealListId]);
    }, (response) async {
      meals = response;
      update([mealListId]);
    });
  }

  @override
  void addMeal(MealModel meal) async {
    OrderModel? order =
        orders.firstWhereOrNull((element) => element.meal?.id == meal.id);
    if (order != null) {
      order.setQuantity = (order.quantity ?? 0) + 1;
    } else {
      orders.add(
        OrderModel(meal: meal, quantity: 1, tableId: tableModel?.id),
      );
    }
    update([orderListId]);
  }

  @override
  void decreaseMeal(OrderModel order) {
    if (order.quantity == 1) {
      orders.remove(order);
    } else {
      order.setQuantity = (order.quantity ?? 0) - 1;
    }
    update([orderListId]);
  }

  @override
  Future<void> getOrdersForTable(TableModel table) async {
    orders = [];
    update([orderListId]);
    tableModel = table;
    final res = await getOrdersForTableUsecase.call(
      GetOrdersForTableParams(tableId: tableModel?.id ?? 0),
    );
    res.fold((failure) {
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
      update([orderListId]);
    }, (response) async {
      orders = response;
      update([orderListId]);
    });
  }

  @override
  Future<void> saveOrdersForTable() async {
    await saveOrdersForTableUsecase.call(
      SaveOrdersForTableParams(
        tableId: tableModel?.id ?? 0,
        orders: orders,
      ),
    );
    if (tableModel?.hasStarted != true && orders.isNotEmpty) {
      await changeStatusOfTableUsecase.call(
        ChangeStatusOfTableParams(
          id: tableModel?.id ?? 0,
          hasStarted: true,
          hasGivenBill: null,
        ),
      );
      _homeController.getTables();
    }
  }

  @override
  Future<void> createBillForTable() async {
    saveOrdersForTable();
    if (orders.isNotEmpty && tableModel?.hasGivenBill != true) {
      await createBillUsecase.call(
        CreateBillParams(table: tableModel!),
      );
      await changeStatusOfTableUsecase.call(
        ChangeStatusOfTableParams(
          id: tableModel?.id ?? 0,
          hasStarted: true,
          hasGivenBill: true,
        ),
      );
      _homeController.getTables();
      _homeController.getBills();
    }
  }
}
