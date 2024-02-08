import 'package:audit_task/controller/AuditController.dart';
import 'package:get/get.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuditController());
    /// Get.lazyPut(() => FilterController());
  }
}
