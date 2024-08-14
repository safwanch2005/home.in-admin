import 'package:admin_app_real_estate/core/constants/texts.dart';
import 'package:admin_app_real_estate/core/font_style/colors.dart';
import 'package:admin_app_real_estate/core/font_style/font_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

AppBar homeAppBar() {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: backgroundColor,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          appBarTitle,
          style: poppins(
              fontSize: 40, fontWeight: FontWeight.w400, color: themeColor),
        ),
        GestureDetector(
          onTap: () {
            SystemNavigator.pop();
          },
          child: Icon(
            Icons.exit_to_app,
            color: themeColor,
            size: 30,
          ),
        )
      ],
    ),
  );
}
