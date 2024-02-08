import 'package:audit_task/models/AuditModel.dart';
import 'package:get/get.dart';

import 'AuditController.dart';

class FilterController extends GetxController {
  final filteredAuditList = RxList<AuditModel>([]);
  List<AuditModel> originalList = [];
  final RxList<AuditModel> _dataList = <AuditModel>[].obs;
  RxList<String> allAuditNumbers = <String>[].obs;
  List<String> tempSearchable =[];

  @override
  void onInit() async {
    AuditController auditController = Get.find<AuditController>();
    super.onInit();
    filteredAuditList.value = auditController.dataList;
    allAuditNumbers..value.addAll(auditController.auditNumbers);
  }

  void filterItems(List<AuditModel> itemList, List<String> targetCategories) {
    var temp;
    if(targetCategories.isEmpty)
    {
      temp = originalList;
    }
    else{
      temp = itemList.where((item) =>
          targetCategories.contains(item.auditNumber)
      ).toList();
    }
    _dataList.value.clear();
    _dataList.value = temp;
  }
}

