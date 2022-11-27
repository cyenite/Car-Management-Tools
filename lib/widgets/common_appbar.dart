import 'package:car_management_tools/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

AppBar commonAppBar({required Function onBackPressed, required String title}) {
  return AppBar(
    backgroundColor: appBarBg,
    title: Text(
      title,
      style: GoogleFonts.roboto(fontSize: 17, color: blackText),
    ),
    leading: InkWell(
      onTap: onBackPressed(),
      child: const Icon(
        Icons.arrow_back,
        color: blackText,
      ),
    ),
  );
}
