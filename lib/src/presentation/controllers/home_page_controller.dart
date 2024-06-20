import 'package:get/get.dart';

/// utils
import '/core/error/failure.dart';
import '/core/usecase/usecase.dart';

/// models
import '/src/data/models/table_model.dart';

/// usecases
import '/src/domain/usecases/.usecases.dart';

abstract class HomePageController {
  Future<void> getTables();
}

class HomePageControllerImpl extends GetxController
    implements HomePageController {
  // usecases
  final GetTables getTablesUsecase;
  final ChangeStatusOfTable changeStatusOfTableUsecase;

  HomePageControllerImpl({
    required this.getTablesUsecase,
    required this.changeStatusOfTableUsecase,
  });

  // results
  List<TableModel> tables = [];

  // get builder's id
  final String tableListId = "table_list_id";

  // error messages
  String tableListError = "";

  @override
  Future<void> getTables({int? skip}) async {
    final alertsResponse = await getTablesUsecase.call(NoParams());
    alertsResponse.fold((failure) {
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
}
