import 'package:flutter/material.dart';

class WidgetFactory {
  static Divider divider(BuildContext cntxt) {
    return const Divider(
      color: Colors.black,
    );
  }

  static SizedBox emptyBox({double height = 0.0, double width = 0.0}) {
    return SizedBox(
      height: height,
      width: width,
    );
  }

  static Widget buildLoading() =>
      const Center(child: CircularProgressIndicator());
}
