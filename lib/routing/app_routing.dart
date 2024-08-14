import 'package:admin_app_real_estate/ui/screens/all_properties_screen.dart';
import 'package:admin_app_real_estate/ui/screens/all_users_screen.dart';
import 'package:admin_app_real_estate/ui/screens/home_screen.dart';
import 'package:admin_app_real_estate/ui/screens/lock_screen.dart';

import 'package:admin_app_real_estate/ui/widgets/bottom_nav/bottom_nav.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> routes = {
  '/bottomNavBar': (BuildContext context) => BottomNavBar(),
  '/homePage': (BuildContext context) => const HomeScreen(),
  '/lockScreen': (BuildContext context) => const LockScreen(),
  '/allPropertiesScreen': (BuildContext context) => const AllPropertiesScreen(),
  '/allUsersScreen': (BuildContext context) => const AllUsersScreen(),
};
