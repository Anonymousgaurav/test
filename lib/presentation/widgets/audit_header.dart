import 'package:audit_task/presentation/screens/filter_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/AuditController.dart';
import '../../controller/FilterController.dart';

class AuditHeader extends StatelessWidget {
  const AuditHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.find<AuditController>().tempSearchable.clear();
        Get.find<AuditController>().tempSearchable.addAll(
            Get.find<FilterController>().searchableAuditNumbers);
        Get.to(FilterScreen());
      },
      child: const Icon(
        Icons.filter,
        color: Colors.black,
      ),
    );
  }
}
