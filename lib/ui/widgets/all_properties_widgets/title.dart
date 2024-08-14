import 'package:admin_app_real_estate/core/font_style/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class TitleAllProp extends StatelessWidget {
  TitleAllProp({super.key, required this.title});
  String title = "";
  @override
  Widget build(BuildContext context) {
    return Text(title.length <= 20 ? title : '${title.substring(0, 20)}...',
        style: GoogleFonts.poppins(
            fontSize: 30, color: themeColor, fontWeight: FontWeight.w400));
  }
}
