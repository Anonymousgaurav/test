import 'package:audit_task/models/AuditModel.dart';
import 'package:flutter/material.dart';

import '../../utils/WidgetFactory.dart';
import '../../utils/date_time_helper.dart';

class AuditHeaderStatus extends StatelessWidget {
  AuditHeaderStatus(this.dataList) : super();
  AuditModel dataList;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.calendar_today),
            WidgetFactory.emptyBox(width: 10.0),
            Text(
              DateTimeHelper.getFormattedDate(
                DateTime.parse(dataList.reqDate!),
              ),
            )
          ],
        ),
        Text(
          dataList.auditStatus!,
        )
      ],
    );
  }
}
