import 'package:car_management_tools/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final Function onTap;
  final double width;
  final Color color;
  const RoundedButton({Key? key, required this.text, required this.onTap, required this.icon, required this.width, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap(),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.all(8.0),
        width: width,
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(25)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              text,
              style: GoogleFonts.rubik(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 16),
            ),
            Icon(
              icon,
              size: 20,
              color: blackText,
            ),
          ],
        ),
      ),
    );
  }
}
