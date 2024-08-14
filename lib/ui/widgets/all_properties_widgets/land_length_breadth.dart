import 'package:admin_app_real_estate/core/font_style/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class LandLengthBreadth extends StatelessWidget {
  LandLengthBreadth({super.key, required this.type, required this.value});
  String type = "";
  String value = "";

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          type,
          style: GoogleFonts.poppins(fontSize: 15, color: themeColorShade),
        ),
        const SizedBox(
          width: 5,
        ),
        Text(value,
            style: GoogleFonts.poppins(fontSize: 30, color: themeColor)),
      ],
    );
  }
}
