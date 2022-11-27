import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/constants.dart';

class InspectCar extends StatefulWidget {
  const InspectCar({Key? key}) : super(key: key);

  @override
  State<InspectCar> createState() => _InspectCarState();
}

class _InspectCarState extends State<InspectCar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: white,
      child: Center(
        child: Text(
          '',
          style: GoogleFonts.rubik(fontWeight: FontWeight.w600, color: blackText),
        ),
      ),
    );
  }
}
