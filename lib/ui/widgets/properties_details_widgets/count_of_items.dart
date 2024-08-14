import 'package:admin_app_real_estate/core/font_style/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class CountsOfItemsAllDetailPage extends StatelessWidget {
  CountsOfItemsAllDetailPage(
      {super.key, required this.items, required this.icon});
  String items = "";
  IconData? icon = Icons.warning;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          items,
          style: GoogleFonts.poppins(fontSize: 30, color: themeColor),
        ),
        const SizedBox(
          width: 5,
        ),
        Icon(
          icon,
          size: icon == Icons.bathtub_outlined ? 28 : 35,
          color: themeColorShade,
        ),
      ],
    );
  }
}
