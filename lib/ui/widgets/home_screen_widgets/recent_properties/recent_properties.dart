import 'package:admin_app_real_estate/ui/widgets/home_screen_widgets/recent_properties/recent_container.dart';
import 'package:admin_app_real_estate/ui/widgets/home_screen_widgets/recent_properties/recent_text.dart';
import 'package:flutter/material.dart';

class RecentProperties extends StatelessWidget {
  const RecentProperties({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.height * 0.02,
        horizontal: MediaQuery.of(context).size.width * 0.03,
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RecentText(),
          RecentContainer(),
          //CardBuilder()
        ],
      ),
    );
  }
}
