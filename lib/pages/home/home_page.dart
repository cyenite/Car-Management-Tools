import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentTabIndex = 1;

  final List<Widget> _tabs = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10.0,
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            tabIcon(icon: Icons.calculate, label: 'Calculate', isActive: false, index: 0),
            tabIcon(icon: Icons.keyboard_double_arrow_up_sharp, label: 'Inspect Car', isActive: true, index: 1),
            tabIcon(icon: Icons.car_crash_sharp, label: 'Accept Terms', isActive: false, index: 2),
          ],
        )
      ],
    );
  }

  Widget tabIcon({required IconData icon, required String label, required bool isActive, required int index}) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.3,
      height: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: isActive ? brown : white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              icon,
              size: 20,
              color: isActive ? white : blue,
            ),
            Text(
              label,
              maxLines: 2,
              style: GoogleFonts.rubik(color: isActive ? white : blackText, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
