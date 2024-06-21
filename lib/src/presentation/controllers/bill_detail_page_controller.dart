import 'package:get/get.dart';

/// utils
import '/core/error/failure.dart';

/// models
import '/src/data/models/bill_model.dart';
import '/src/data/models/order_model.dart';
import '/src/data/models/table_model.dart';

/// usecases
import '/src/domain/usecases/.usecases.dart';

import '/src/presentation/controllers/.controllers.dart';

final HomePageControllerImpl _homeController = Get.find();

abstract class BillDetailPageController {
  Future<void> getOrdersForTable(BillModel bill);
  Future<void> deleteBillForTable();
}

class BillDetailPageControllerImpl extends GetxController
    implements BillDetailPageController {
  // usecases
  final DeleteBill deleteBillUsecase;
  final GetTableTitle getTableTitleUsecase;
  final GetOrdersForTable getOrdersForTableUsecase;
  final ChangeStatusOfTable changeStatusOfTableUsecase;
  final DeleteOrdersForTable deleteOrdersForTableUsecase;

  BillDetailPageControllerImpl({
    required this.deleteBillUsecase,
    required this.getTableTitleUsecase,
    required this.getOrdersForTableUsecase,
    required this.changeStatusOfTableUsecase,
    required this.deleteOrdersForTableUsecase,
  });

  // results
  List<OrderModel> orders = [];
  TableModel? tableModel;
  BillModel? billModel;

  // get builder's id
  final String orderListId = "order_list_id";

  // error messages
  String orderListError = "";

  @override
  Future<void> getOrdersForTable(BillModel bill) async {
    orders = [];
    update([orderListId]);
    tableModel = null;
    billModel = bill;

    final res = await getTableTitleUsecase.call(
      GetTableTitleParams(id: billModel?.tableId ?? 0),
    );
    res.fold((failure) {}, (table) async {
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
    });
  }

  @override
  Future<void> deleteBillForTable() async {
    await deleteBillUsecase.call(
      DeleteBillParams(id: billModel?.id ?? 0),
    );
    await deleteOrdersForTableUsecase.call(
      DeleteOrdersForTableParams(tableId: billModel?.tableId ?? 0),
    );
    await changeStatusOfTableUsecase.call(
      ChangeStatusOfTableParams(
        id: tableModel?.id ?? 0,
        hasStarted: false,
        hasGivenBill: false,
      ),
    );
    _homeController.getTables();
  }
}
