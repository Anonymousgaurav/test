import 'package:flutter/material.dart';


class DateTimeHelper {
  DateTimeHelper._();

    DateTime? startDate;
  DateTime? endDate;

  static String getFormattedDate(DateTime dateTime) {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }

  static String getFormattedTime(DateTime dateTime) {
    return '${dateTime.hour}:${dateTime.minute}';
  }


  static Future<DateTime?> selectDate(BuildContext context, DateTime? initialDate) async {
    return await showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
  }

}