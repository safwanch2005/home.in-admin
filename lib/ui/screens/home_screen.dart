import 'package:admin_app_real_estate/ui/widgets/custom_widgets/custom_home_container.dart';
import 'package:admin_app_real_estate/ui/widgets/custom_widgets/sizedbox.dart';
import 'package:admin_app_real_estate/ui/widgets/home_screen_widgets/recent_properties/recent_properties.dart';
import 'package:admin_app_real_estate/ui/widgets/home_screen_widgets/recent_users/recent_users.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        customSizedBox(height: 0.02, context: context),
        CustomHomeContainer(isUser: true, icon: Icons.person),
        customSizedBox(height: 0.02, context: context),
        CustomHomeContainer(isUser: false, icon: FontAwesomeIcons.building),
        customSizedBox(height: 0.02, context: context),
        const RecentUsers(),
        customSizedBox(height: 0.02, context: context),
        const RecentProperties(),
        customSizedBox(height: 0.05, context: context),
      ],
    );
  }
}
