import 'package:audit_task/presentation/screens/filter_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuditHeader extends StatelessWidget {
  const AuditHeader({Key? key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.lightGreen,
              borderRadius: BorderRadius.circular(9.0),
            ),
            child: Center(child: const Icon(Icons.arrow_back_ios_new))),
        Row(
          children: [
            InkWell(
              onTap: () {
              },
              child: Icon(
                Icons.refresh,
                color: Colors.black,
              ),
            ),
            SizedBox(width: 20.0,),
            InkWell(
              onTap: () {
                Get.to(FilterScreen());
              },
              child: Icon(
                Icons.double_arrow,
                color: Colors.black,
              ),
            )
          ],
        )
      ],
    );
  }
}
