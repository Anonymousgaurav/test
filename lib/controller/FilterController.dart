import 'package:audit_task/models/AuditModel.dart';
import 'package:get/get.dart';

import '../presentation/screens/audit_screen.dart';
import 'AuditController.dart';

class FilterController extends GetxController {
  final auditList = RxList<AuditModel>([]);
  List<AuditModel> noFilterList = [];
  RxList<String> allAuditNumbers = <String>[].obs;
  List<String> tempSearchable = [];
  List<String> searchableAuditNumbers = [];

  @override
  void onInit() async {
    AuditController auditController = Get.find<AuditController>();
    auditList.value = auditController.dataList;
    _getAuditNumbers(auditController);
    super.onInit();
  }

  void _getAuditNumbers(AuditController controller) {
    for (var numbers in controller.auditList) {
      if (numbers.auditNumber != null) {
        allAuditNumbers.add(numbers.auditNumber!);
      }
    }
  }

  void onTapApply()
  {
    searchableAuditNumbers.clear();
   searchableAuditNumbers
        .addAll(tempSearchable);
    AuditController.to.filterItems(auditList, searchableAuditNumbers);
    Get.to(() => const AuditScreen());
  }

  void onClear()
  {
    searchableAuditNumbers.clear();
    tempSearchable.clear();
  }
}
