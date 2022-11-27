import 'package:car_management_tools/constants/style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/constants.dart';
import 'components/sub_components.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentTabIndex = 1;

  final List<Widget> _tabs = [
    const Calculate(),
    const InspectCar(),
    const TermsConditions(),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        smallVSpacer,
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            tabIcon(icon: Icons.calculate, label: 'Calculate', isActive: _currentTabIndex == 0, index: 0),
            tabIcon(icon: Icons.keyboard_double_arrow_up_sharp, label: 'Inspect Car', isActive: _currentTabIndex == 1, index: 1),
            tabIcon(icon: Icons.car_crash_sharp, label: 'Accept Terms', isActive: _currentTabIndex == 2, index: 2),
          ],
        ),
        smallVSpacer,
        _tabs[_currentTabIndex],
      ],
    );
  }

  Widget tabIcon({required IconData icon, required String label, required bool isActive, required int index}) {
    return InkWell(
      onTap: () {
        setState(() {
          _currentTabIndex = index;
        });
      },
      child: Expanded(
        child: Container(
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            border: Border.all(color: blackText, width: 0.5),
            color: isActive ? brown : white,
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  icon,
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
        ),
      ),
    );
  }
}
