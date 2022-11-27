import 'package:car_management_tools/constants/colors.dart';
import 'package:flutter/material.dart';

import 'pages/pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Car Management Tools',
      theme: ThemeData(primaryColor: primaryColor),
      home: const BottomNavigation(),
    );
  }
}
