import 'package:admin_app_real_estate/core/font_style/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class RecentPropCat extends StatelessWidget {
  RecentPropCat({super.key, required this.category, required this.type});
  String category = "";
  String type = "";
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("$category - $type",
            style: GoogleFonts.poppins(
                fontSize: 20, color: themeColor, fontWeight: FontWeight.w400)),
      ],
    );
  }
}
