import 'package:dio/dio.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../database/dao/AuditDAO.dart';
import '../models/AuditModel.dart';
import '../usecase/FetchDataUseCase.dart';

class AuditController extends GetxController {
  List<AuditModel> get dataList => _dataList.value;
  List<AuditModel> originalList = [];

  final Dio dio = Dio();
  final String apiUrl =
      'https://qasensata.empowerqlm.com/api/Mobile/Supplier/Audit/All/Complete/Details/100003';
  RxBool isLoading = true.obs;
  RxList<AuditModel> auditList = <AuditModel>[].obs;
  final RxList<AuditModel> _dataList = <AuditModel>[].obs;
  RxList<String> auditNumbers = <String>[].obs;
  List<String> searchableAuditNumbers = [];
  List<String> tempSearchable = [];
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
    isLoading.value = false;
    print('Value lenght>??>>>>> ${_dataList.value.length}');
  }

  void filterItems(List<AuditModel> itemList, List<String> targetCategories) {
    var temp;
    if (targetCategories.isEmpty) {
      temp = originalList;
    } else {
      temp = itemList
          .where((item) => targetCategories.contains(item.auditNumber))
          .toList();
    }
    _dataList.value.clear();
    _dataList.value = temp;
  }

  void updateView() => update([]);

  @override
  void onClose() {
    super.onClose();
  }
}
