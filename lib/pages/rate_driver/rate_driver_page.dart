import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/constants.dart';

class RateDriverPage extends StatefulWidget {
  const RateDriverPage({Key? key}) : super(key: key);

  @override
  State<RateDriverPage> createState() => _RateDriverPageState();
}

class _RateDriverPageState extends State<RateDriverPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: white,
      child: Center(
        child: Text(
          'Rate Driver Page',
          style: GoogleFonts.rubik(fontWeight: FontWeight.w600, color: blackText),
        ),
      ),
    );
  }
}
