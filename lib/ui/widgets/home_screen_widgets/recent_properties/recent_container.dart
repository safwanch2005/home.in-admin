import 'package:admin_app_real_estate/core/font_style/colors.dart';
import 'package:admin_app_real_estate/ui/widgets/home_screen_widgets/recent_properties/card_builder.dart';
import 'package:flutter/material.dart';

class RecentContainer extends StatelessWidget {
  const RecentContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 318,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: backgroundColor,
      ),
      child: const CardBuilder(),
    );
  }
}
