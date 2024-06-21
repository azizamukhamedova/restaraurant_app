import 'package:get/get.dart';

/// utils
import '/core/error/failure.dart';
import '/core/usecase/usecase.dart';

/// models
import '/src/data/models/bill_model.dart';
import '/src/data/models/table_model.dart';

/// usecases
import '/src/domain/usecases/.usecases.dart';

abstract class HomePageController {
  Future<void> getBills();
  Future<void> getTables();
}

class HomePageControllerImpl extends GetxController
    implements HomePageController {
  // usecases
  final GetBills getBillsUsecase;
  final GetTables getTablesUsecase;

  HomePageControllerImpl({
    required this.getBillsUsecase,
    required this.getTablesUsecase,
  });

  // results
  List<TableModel> tables = [];
  List<BillModel> bills = [];

  // get builder's id
  final String tableListId = "table_list_id";
  final String billListId = "bill_list_id";

  // error messages
  String tableListError = "";
  String billListError = "";

  @override
  Future<void> getTables({int? skip}) async {
    final res = await getTablesUsecase.call(NoParams());
    res.fold((failure) {
      if (failure is NetworkFailure) {
        tableListError = "network is not connected!";
        Get.log("network is not connected!");
      } else if (failure is ServerTimeOutFailure) {
        tableListError = "network connection is bad!";
        Get.log("network connection is bad!");
      } else if (failure is ServerUnAuthorizeFailure) {
        ///
      } else {
        tableListError = "Something went wrong!";
        Get.log("Something went wrong!");
      }
      update([tableListId]);
    }, (response) async {
      tables = response;
      update([tableListId]);
    });
  }

  @override
  Future<void> getBills({int? skip}) async {
    final res = await getBillsUsecase.call(NoParams());
    res.fold((failure) {
      if (failure is NetworkFailure) {
        billListError = "network is not connected!";
        Get.log("network is not connected!");
      } else if (failure is ServerTimeOutFailure) {
        billListError = "network connection is bad!";
        Get.log("network connection is bad!");
      } else if (failure is ServerUnAuthorizeFailure) {
        ///
      } else {
        billListError = "Something went wrong!";
        Get.log("Something went wrong!");
      }
      update([billListId]);
    }, (response) async {
      bills = response;
      update([billListId]);
    });
  }
}
