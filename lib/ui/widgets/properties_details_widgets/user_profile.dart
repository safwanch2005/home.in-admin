import 'package:admin_app_real_estate/core/font_style/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class UserProfileDetailsPage extends StatelessWidget {
  UserProfileDetailsPage({super.key, required this.propData});
  dynamic propData;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 25, bottom: 5),
          child: Text(
            "Posted by",
            style: GoogleFonts.poppins(fontSize: 25, color: themeColor),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(15),
          margin: const EdgeInsets.only(top: 5),
          decoration: BoxDecoration(
            color: backgroundColor,
            boxShadow: [
              BoxShadow(
                color: themeColor.withOpacity(0.5), // Shadow color
                spreadRadius: 5, // Spread radius
                blurRadius: 7, // Blur radius
                offset: const Offset(0, 3), // Offset
              ),
            ],
            borderRadius: const BorderRadius.all(
              Radius.circular(30),
            ),
          ),
          width: double.infinity,
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: themeColor.withOpacity(0.4), // Shadow color
                      spreadRadius: 1, // Spread radius
                      blurRadius: 10, // Blur radius
                      offset: const Offset(0, 3), // Offset
                    ),
                  ],
                ),
                child: const CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.black12,
                  // backgroundImage: AssetImage(
                  //   "assets/profile.jpeg",
                  // ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                propData["postedBy"],
                style: GoogleFonts.poppins(fontSize: 30, color: themeColor),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
