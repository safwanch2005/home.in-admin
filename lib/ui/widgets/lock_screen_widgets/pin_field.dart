import 'package:admin_app_real_estate/core/font_style/colors.dart';
import 'package:admin_app_real_estate/core/font_style/font_styles.dart';
import 'package:admin_app_real_estate/ui/utils/pin_controller.dart';
import 'package:flutter/material.dart';

class PinField extends StatelessWidget {
  const PinField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.1),
      child: TextField(
        controller: PinController.pinCtrl,
        obscureText: true,
        enableSuggestions: false,
        autocorrect: false,
        textAlign: TextAlign.center,
        style: poppins(
            fontSize: 20, fontWeight: FontWeight.w300, color: themeColor),
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          focusColor: themeColor,
          hintText: '4 digit Pin',
          hintStyle: poppins(
              fontSize: 20, fontWeight: FontWeight.w300, color: themeColor),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.7),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: themeColor),
            borderRadius: BorderRadius.circular(25.7),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: themeColor),
            borderRadius: BorderRadius.circular(25.7),
          ),
        ),
      ),
    );
  }
}
