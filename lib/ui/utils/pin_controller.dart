import 'package:admin_app_real_estate/core/font_style/colors.dart';
import 'package:admin_app_real_estate/core/font_style/font_styles.dart';
import 'package:flutter/material.dart';

class PinController {
  static String password = "5674";
  static TextEditingController pinCtrl = TextEditingController();

  static SnackBar snackBar({bool isSuccess = false}) {
    return SnackBar(
      backgroundColor: backgroundColor,
      duration: const Duration(milliseconds: 700),
      content: Text(
        isSuccess ? "Success" : '⚠️ Wrong pin ⚠️',
        style: poppins(
            fontSize: 25,
            fontWeight: FontWeight.w300,
            color: isSuccess ? successColor : errorColor),
        textAlign: TextAlign.center,
      ),
    );
  }

  void dispose() {
    pinCtrl.dispose();
  }
}
