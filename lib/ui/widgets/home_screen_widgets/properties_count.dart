import 'package:admin_app_real_estate/core/font_style/colors.dart';
import 'package:admin_app_real_estate/core/font_style/font_styles.dart';
import 'package:admin_app_real_estate/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PropertiesCount extends StatelessWidget {
  const PropertiesCount({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<int>(
        future: Provider.of<UserProvider>(context, listen: true)
            .getPropertiesCount(),
        builder: (context, snapshot) {
          return Consumer<UserProvider>(
            builder: (context, userProvider, child) {
              return Text(userProvider.propertiesLength.toString(),
                  style: poppins(
                      fontSize: 30,
                      fontWeight: FontWeight.w400,
                      color: themeColor));
            },
          );
        });
  }
}
