import 'package:audit_task/models/AuditModel.dart';
import 'package:get/get.dart';

import '../presentation/screens/audit_screen.dart';
import 'AuditController.dart';

class FilterController extends GetxController {
  final auditList = RxList<AuditModel>([]);
  List<AuditModel> noFilterList = [];
  RxList<String> allAuditNumbers = <String>[].obs;
  RxList<String> plantNames = <String>[].obs;
  List<String> tempSearchable = [];
  List<String> searchableAuditNumbers = [];

  @override
  void onInit() async {
    AuditController auditController = Get.find<AuditController>();
    auditList.value = auditController.dataList;
    _getAuditNumbers(auditController);
    _getPlantNames(auditController);
    super.onInit();
  }

  void _getAuditNumbers(AuditController controller) {
    for (var numbers in controller.auditList) {
      if (numbers.auditNumber != null) {
        allAuditNumbers.add(numbers.auditNumber!);
      }
    }
  }

  void _getPlantNames(AuditController controller) {
    for (var numbers in controller.auditList) {
      if (numbers.plantName != null) {
        plantNames.add(numbers.plantName!);
      }
    }
  }

  void onTapApply()
  {
   searchableAuditNumbers.clear();
   searchableAuditNumbers.addAll(tempSearchable);
    AuditController.to.filterItems(auditList, searchableAuditNumbers);
    Get.to(() => const AuditScreen());
  }

  void onClear()
  {
    searchableAuditNumbers.clear();
    tempSearchable.clear();
  }

}
