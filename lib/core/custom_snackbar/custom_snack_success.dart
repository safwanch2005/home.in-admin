import 'package:admin_app_real_estate/core/font_style/colors.dart';
import 'package:admin_app_real_estate/core/font_style/font_styles.dart';
import 'package:flutter/material.dart';

successSnack(context, String title) {
  return SnackBar(
    backgroundColor: backgroundColor,
    duration: const Duration(seconds: 1),
    content: Text(
      title,
      style: poppins(
          fontSize: 25, fontWeight: FontWeight.w300, color: successColor),
      textAlign: TextAlign.center,
    ),
  );
}
