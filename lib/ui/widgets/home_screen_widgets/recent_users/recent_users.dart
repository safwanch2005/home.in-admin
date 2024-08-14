import 'package:admin_app_real_estate/core/constants/texts.dart';
import 'package:admin_app_real_estate/core/font_style/colors.dart';
import 'package:admin_app_real_estate/core/font_style/font_styles.dart';
import 'package:admin_app_real_estate/core/mediaquery/mediaquery_height.dart';
import 'package:admin_app_real_estate/core/mediaquery/mediaquery_width.dart';
import 'package:admin_app_real_estate/ui/widgets/home_screen_widgets/recent_users/recent_users_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RecentUsers extends StatelessWidget {
  const RecentUsers({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: mediaQueryWidth(context, 0.015)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            recentUsersText,
            style: poppins(
                fontSize: 35, fontWeight: FontWeight.w300, color: themeColor),
          ),
          Container(
            height: mediaQueryHeight(context, 0.24),
            decoration: BoxDecoration(
              border: Border.all(color: themeColor),
              color: backgroundColor,
              boxShadow: [
                BoxShadow(
                  color: themeColor.withOpacity(0.5), // Shadow color
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],
              borderRadius: BorderRadius.circular(20),
            ),
            child: const RecentUsersList(),
          ),
        ],
      ),
    );
  }
}
