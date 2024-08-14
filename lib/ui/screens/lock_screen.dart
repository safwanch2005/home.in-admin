import 'package:admin_app_real_estate/core/font_style/colors.dart';
import 'package:admin_app_real_estate/core/font_style/font_styles.dart';
import 'package:admin_app_real_estate/ui/widgets/custom_widgets/sizedbox.dart';
import 'package:admin_app_real_estate/ui/widgets/lock_screen_widgets/button.dart';
import 'package:admin_app_real_estate/ui/widgets/lock_screen_widgets/pin_field.dart';
import 'package:flutter/material.dart';

class LockScreen extends StatelessWidget {
  const LockScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
          child: Column(
        children: [
          customSizedBox(context: context, height: 0.2),
          Text(
            "Enter PIN",
            style: poppins(
                fontSize: 30, fontWeight: FontWeight.w300, color: themeColor),
          ),
          customSizedBox(context: context, height: 0.02),
          const PinField(),
          customSizedBox(context: context, height: 0.02),
          const GetInButton(),
        ],
      )),
    );
  }
}
