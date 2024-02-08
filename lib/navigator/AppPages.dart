
import 'package:audit_task/navigator/AppRoutes.dart';
import 'package:audit_task/presentation/screens/filter_screen.dart';
import 'package:get/get.dart';

import '../models/binding/controller_binding.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.filter,
      page: () => FilterScreen(),
      binding: AppBinding(),
    ),
  ];
}