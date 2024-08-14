import 'package:admin_app_real_estate/core/font_style/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class LocationTextDetailPage extends StatelessWidget {
  LocationTextDetailPage({super.key, required this.location});
  dynamic location;
  @override
  Widget build(BuildContext context) {
    String value =
        " ${location["city"]}, ${location["state"]}, ${location["country"]}";
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: 10,
          ),
          Icon(
            Icons.location_on_sharp,
            color: themeColor,
            size: 25,
          ),
          Flexible(
            child: Text(
              value,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.poppins(
                  color: themeColor, fontSize: 25, fontWeight: FontWeight.w300),
            ),
          ),
        ],
      ),
    );
  }
}
