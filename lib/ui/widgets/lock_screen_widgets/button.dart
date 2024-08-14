import 'package:admin_app_real_estate/core/font_style/colors.dart';
import 'package:admin_app_real_estate/core/font_style/font_styles.dart';
import 'package:admin_app_real_estate/ui/utils/pin_controller.dart';
import 'package:flutter/material.dart';

class GetInButton extends StatelessWidget {
  const GetInButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: themeColor),
      onPressed: () {
        if (PinController.password == PinController.pinCtrl.text) {
          ScaffoldMessenger.of(context)
              .showSnackBar(PinController.snackBar(isSuccess: true));
          Navigator.of(context).pushNamed('/bottomNavBar');
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(PinController.snackBar(isSuccess: false));
        }
        PinController.pinCtrl.clear();
      },
      child: Text(
        "Get In",
        style: poppins(
            fontSize: 20, fontWeight: FontWeight.w300, color: backgroundColor),
      ),
    );
  }
}
