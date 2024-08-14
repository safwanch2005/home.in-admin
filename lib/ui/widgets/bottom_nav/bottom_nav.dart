import 'package:admin_app_real_estate/core/font_style/colors.dart';
import 'package:admin_app_real_estate/provider/index_provider.dart';
import 'package:admin_app_real_estate/ui/screens/all_properties_screen.dart';
import 'package:admin_app_real_estate/ui/screens/all_users_screen.dart';
import 'package:admin_app_real_estate/ui/screens/home_screen.dart';
import 'package:admin_app_real_estate/ui/widgets/bottom_nav/home_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class BottomNavBar extends StatelessWidget {
  BottomNavBar({super.key});
  final ScrollController scrollController = ScrollController();
  List<Widget> pages = [
    const HomeScreen(),
    const AllPropertiesScreen(),
    const AllUsersScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<IndexProvider>(
        builder: (context, indexProvider, child) {
          return Scaffold(
            appBar: homeAppBar(),
            backgroundColor: backgroundColor,
            body: pages[indexProvider.index],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: indexProvider.index,
              selectedItemColor: themeColor,
              backgroundColor: backgroundColor,
              items: [
                BottomNavigationBarItem(
                  backgroundColor: themeColor,
                  icon: Icon(
                    Icons.home,
                    size: 20,
                    color: themeColor,
                  ),
                  label: "home",
                ),
                BottomNavigationBarItem(
                  icon: FaIcon(
                    FontAwesomeIcons.building,
                    size: 20,
                    color: themeColor,
                  ),
                  label: 'Properties',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person,
                    size: 20,
                    color: themeColor,
                  ),
                  label: "Users",
                ),
              ],
              onTap: (values) {
                indexProvider.changeIndex(values);
              },
            ),
          );
        },
      ),
    );
  }
}
