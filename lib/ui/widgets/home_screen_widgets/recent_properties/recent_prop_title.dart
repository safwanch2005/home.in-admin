import 'package:admin_app_real_estate/core/font_style/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class RecentPropTitle extends StatelessWidget {
  RecentPropTitle({super.key, required this.title});
  String title = "";
  @override
  Widget build(BuildContext context) {
    return Text(title.length <= 13 ? title : '${title.substring(0, 13)}...',
        style: GoogleFonts.poppins(
            fontSize: 40, color: themeColor, fontWeight: FontWeight.w500));
  }
}
