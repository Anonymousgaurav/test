import 'package:flutter/material.dart';


Widget customContainer({required Widget child, required double height, required double width, required Color color, required double radius, required Function()? onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Card(
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(radius),
        ),
        child: Center(child: child),
      ),
    ),
  );
}