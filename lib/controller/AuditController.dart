import 'package:dio/dio.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../models/AuditModel.dart';
import '../usecase/FetchDataUseCase.dart';

class AuditController extends GetxController {
  List<AuditModel> get dataList => _dataList.value;
  final Dio dio = Dio();
  final String apiUrl =
      'https://qasensata.empowerqlm.com/api/Mobile/Supplier/Audit/All/Complete/Details/100003';
  RxBool isLoading = true.obs;
  RxList<AuditModel> auditList = <AuditModel>[].obs;
  final RxList<AuditModel> _dataList = <AuditModel>[].obs;
  List<String> tempSearchable = [];
  List<AuditModel> noFilterList = [];
  final FetchDataUseCase _fetchDataUseCase = FetchDataUseCase();

  @override
  void onInit() {
    fetchDataFromUseCase(refreshData: false);
    super.onInit();
  }

  Future<void> fetchDataFromUseCase({bool refreshData = false}) async {
    final result =
        await _fetchDataUseCase.fetchAuditData(refreshData: refreshData);
    _dataList.value = result;
    auditList.value = result;
    isLoading.value = false;
  }

  // void filterItems(List<AuditModel> itemList, List<String> targetCategories) {
  //   List<AuditModel> temp;
  //   targetCategories.isEmpty ? temp = noFilterList : temp = itemList.where((item) =>
  //       targetCategories.contains(item.auditNumber)
  //   ).toList();
  //   _dataList.value.clear();
  //   _dataList.value = temp;
  // }
  void updateView() => update([]);
}
