import 'package:admin_app_real_estate/core/constants/texts.dart';
import 'package:admin_app_real_estate/core/font_style/colors.dart';
import 'package:admin_app_real_estate/core/font_style/font_styles.dart';
import 'package:flutter/material.dart';

class RecentText extends StatelessWidget {
  const RecentText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.03, vertical: 10),
      child: Text(
        recentPropertiesText,
        style: poppins(
            fontSize: 35, fontWeight: FontWeight.w300, color: themeColor),
      ),
    );
  }
}
