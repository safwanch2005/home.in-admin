import 'package:admin_app_real_estate/core/font_style/colors.dart';
import 'package:flutter/material.dart';

class BackIcon extends StatelessWidget {
  const BackIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: CircleAvatar(
              backgroundColor: Colors.black26,
              radius: 23,
              child: Icon(
                Icons.arrow_back_ios_new_outlined,
                size: 25,
                color: themeColor,
              ),
            ),
          ),
          // CircleAvatar(
          //   backgroundColor: Colors.black26,
          //   radius: 23,
          //   child: Icon(
          //     Icons.share,
          //     size: 25,
          //     color: AppThemeData.themeColor,
          //   ),
          // ),
          const SizedBox()
        ],
      ),
    );
  }
}
