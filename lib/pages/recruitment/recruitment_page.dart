import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/constants.dart';

class RecruitmentPage extends StatefulWidget {
  const RecruitmentPage({Key? key}) : super(key: key);

  @override
  State<RecruitmentPage> createState() => _RecruitmentPageState();
}

class _RecruitmentPageState extends State<RecruitmentPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: white,
      child: Center(
        child: Text(
          'Recruitment Page',
          style: GoogleFonts.rubik(fontWeight: FontWeight.w600, color: blackText),
        ),
      ),
    );
  }
}
