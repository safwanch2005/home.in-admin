import 'package:admin_app_real_estate/core/font_style/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

Center propNotFound() {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FaIcon(FontAwesomeIcons.faceFrown, size: 35, color: themeColor),
        const SizedBox(
          height: 5,
        ),
        Text(
          "No properties found\n",
          style: GoogleFonts.poppins(fontSize: 25, color: themeColor),
        ),
      ],
    ),
  );
}
