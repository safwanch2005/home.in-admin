import 'package:admin_app_real_estate/core/font_style/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class PriceDetailPage extends StatelessWidget {
  PriceDetailPage({super.key, required this.price});
  String price;
  @override
  Widget build(BuildContext context) {
    return Text(
      " ₹ $price ",
      style: GoogleFonts.poppins(
          fontSize: 35, color: themeColor, fontWeight: FontWeight.w300),
    );
  }
}
