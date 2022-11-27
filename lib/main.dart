import 'package:car_management_tools/constants/colors.dart';
import 'package:car_management_tools/controllers/controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'helpers/routes.dart';

void main() {
  Get.put(InspectionController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Car Management Tools',
      theme: ThemeData(primaryColor: primaryColor),
      initialRoute: '/root',
      getPages: appRoutes(),
    );
  }
}
