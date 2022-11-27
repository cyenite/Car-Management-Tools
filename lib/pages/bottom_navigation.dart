import 'package:car_management_tools/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/constants.dart';
import 'pages.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const RateDriverPage(),
    const BusinessPage(),
    const RecruitmentPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: white,
        title: Text(
          'Car management tools',
          style: GoogleFonts.rubik(color: blackText, fontWeight: FontWeight.bold, fontSize: 21.0),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: _pages[_currentIndex],
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [brown, secondaryColor],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.2, 0.8],
            tileMode: TileMode.clamp,
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          showUnselectedLabels: false,
          backgroundColor: Colors.transparent,
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          items: [
            bottomNavigationItem(icon: Icons.home_filled, label: 'Home', isActive: _currentIndex == 0),
            bottomNavigationItem(icon: Icons.stars_rounded, label: 'Rate A Driver', isActive: _currentIndex == 1),
            bottomNavigationItem(icon: Icons.storefront, label: 'Business', isActive: _currentIndex == 2),
            bottomNavigationItem(icon: Icons.work_history, label: 'Recruitment', isActive: _currentIndex == 3),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem bottomNavigationItem({required IconData icon, required String label, required bool isActive}) {
    return BottomNavigationBarItem(
      icon: Container(
        height: isActive ? 50 : null,
        width: isActive ? 50 : null,
        decoration: isActive
            ? BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(5),
              )
            : const BoxDecoration(),
        child: Column(
          children: [
            Icon(
              icon,
              size: 25,
              color: isActive ? Colors.black : Colors.white,
            ),
            Text(
              label,
              style: GoogleFonts.rubik(color: isActive ? Colors.black : Colors.white, fontSize: 12),
            ),
          ],
        ),
      ),
      label: '',
    );
  }
}
