import 'package:admin_app_real_estate/core/font_style/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class CategoryText extends StatelessWidget {
  CategoryText({super.key, required this.category, required this.type});
  String category = "";
  String type = "";
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30),
      child: Row(
        children: [
          Text("- $category - $type",
              style: GoogleFonts.poppins(
                  fontSize: 20,
                  color: themeColorShade,
                  fontWeight: FontWeight.w400)),
        ],
      ),
    );
  }
}
