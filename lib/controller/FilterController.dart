import 'package:audit_task/models/AuditModel.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import 'AuditController.dart';

class FilterController extends GetxController {
  final auditList = RxList<AuditModel>([]);
  List<AuditModel> noFilterList = [];
  final RxList<AuditModel> _dataList = <AuditModel>[].obs;
  RxList<String> allAuditNumbers = <String>[].obs;
  List<String> tempSearchable =[];
  List<String> searchableAuditNumbers = [];


  @override
  void onInit() async {
    AuditController auditController = Get.find<AuditController>();
    auditList.value = auditController.dataList;
    _getAuditNumbers(auditController);
    super.onInit();

  }

  void _getAuditNumbers(AuditController controller)
  {
    for (var numbers in controller.auditList) {
      if (numbers.auditNumber != null) {
        allAuditNumbers.add(numbers.auditNumber!);
      }
    }
  }

  void filterItems(List<AuditModel> itemList, List<String> targetCategories) {
    List<AuditModel> temp;
    targetCategories.isEmpty ? temp = noFilterList : temp = itemList.where((item) =>
        targetCategories.contains(item.auditNumber)
    ).toList();
    _dataList.value.clear();
    _dataList.value = temp;
  }
}

