import 'package:car_management_tools/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RoundedButton extends StatefulWidget {
  final String text;
  final IconData icon;
  final double width;
  final Color color;
  bool? pretext = false;

  RoundedButton({Key? key, required this.text, required this.icon, required this.width, required this.color, this.pretext}) : super(key: key);

  @override
  State<RoundedButton> createState() => _RoundedButtonState();
}

class _RoundedButtonState extends State<RoundedButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.all(8.0),
      width: widget.width,
      height: 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: blackText, width: 0.5),
        boxShadow: const [
          BoxShadow(
            color: lightBoxStroke,
            blurRadius: 5.0,
            spreadRadius: 0.0,
            offset: Offset(2.0, 2.0),
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          widget.pretext != null && widget.pretext == true
              ? Icon(
                  widget.icon,
                  size: 20,
                  color: blackText,
                )
              : const SizedBox(),
          Text(
            widget.text,
            style: GoogleFonts.rubik(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 16),
          ),
          widget.pretext != null && widget.pretext == false
              ? Icon(
                  widget.icon,
                  size: 20,
                  color: blackText,
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
