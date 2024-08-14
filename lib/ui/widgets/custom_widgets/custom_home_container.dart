import 'package:admin_app_real_estate/core/font_style/colors.dart';
import 'package:admin_app_real_estate/core/mediaquery/mediaquery_height.dart';
import 'package:admin_app_real_estate/core/mediaquery/mediaquery_width.dart';
import 'package:admin_app_real_estate/ui/widgets/home_screen_widgets/properties_count.dart';
import 'package:admin_app_real_estate/ui/widgets/home_screen_widgets/users_count.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class CustomHomeContainer extends StatelessWidget {
  CustomHomeContainer({super.key, required this.isUser, required this.icon});
  dynamic icon;
  bool isUser;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: mediaQueryHeight(context, 0.08),
      margin: EdgeInsets.symmetric(horizontal: mediaQueryWidth(context, 0.015)),
      // width: 200,
      padding: EdgeInsets.only(left: mediaQueryWidth(context, 0.04)),
      decoration: BoxDecoration(
        border: Border.all(color: themeColor),
        color: backgroundColor,
        boxShadow: [
          BoxShadow(
            color: themeColor.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 35,
            color: themeColor,
          ),
          const SizedBox(
            width: 15,
          ),
          // Consumer<UserProvider>(builder: (context, userProvider, child) {
          //   return Text(
          //     userProvider.usersLength.toString(),
          //     style: TextStyle(
          //       color: themeColor,
          //       fontSize: 30,
          //       fontWeight: FontWeight.w400,
          //     ),
          //   );
          // }),
          isUser ? const UsersCount() : const PropertiesCount(),
        ],
      ),
    );
  }
}
