import 'package:audit_task/presentation/screens/filter_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/AuditController.dart';
import '../../controller/FilterController.dart';

const FILTER_IMAGE = "assets/images/filter.png";

class AuditHeader extends StatelessWidget {
  const AuditHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.find<AuditController>().tempSearchable.clear();
        Get.find<AuditController>()
            .tempSearchable
            .addAll(Get.find<FilterController>().searchableAuditNumbers);
        Get.to(FilterScreen());
      },
      child: Image.asset(FILTER_IMAGE),
    );
  }
}
