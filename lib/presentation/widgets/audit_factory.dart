import 'package:flutter/cupertino.dart';

class AuditFactory {

  static Widget rowWidget(String? value) {
    return          Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text('Plant: '),
        Text(value ?? "Plant name not available")
      ],
    );
  }
}
