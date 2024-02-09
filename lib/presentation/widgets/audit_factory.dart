import 'package:flutter/cupertino.dart';

class AuditFactory {

  static Widget rowWidget(String? value,{String title = ""}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
         Text(title),
        Text(value == "" ? "$title name not available" : value!)
      ],
    );
  }
}
