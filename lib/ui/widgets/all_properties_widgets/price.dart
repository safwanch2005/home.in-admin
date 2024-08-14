import 'package:admin_app_real_estate/core/font_style/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class PriceAllProp extends StatelessWidget {
  PriceAllProp({super.key, required this.price});
  String price = "";
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: backgroundColor,
          boxShadow: [
            BoxShadow(
              color: themeColor.withOpacity(0.5), // Shadow color
              spreadRadius: 5, // Spread radius
              blurRadius: 7, // Blur radius
              offset: const Offset(0, 3), // Offset
            ),
          ],
          borderRadius: const BorderRadius.all(Radius.circular(15))),
      child: Text(
        " ₹ $price ",
        style: GoogleFonts.poppins(
            fontSize: 35, color: themeColor, fontWeight: FontWeight.w300),
      ),
    );
  }
}
