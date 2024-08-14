import 'package:admin_app_real_estate/core/font_style/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AcceptAndReject extends StatelessWidget {
  const AcceptAndReject({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            margin: const EdgeInsets.symmetric(horizontal: 30),
            height: 40,
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () async {
                //showDeleteConfirmationDialog(context, ctrl);
              },
              child: Text(
                'remove property',
                style:
                    GoogleFonts.poppins(fontSize: 20, color: backgroundColor),
              ),
            ))
      ],
    );
  }
}
