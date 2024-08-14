import 'package:admin_app_real_estate/core/font_style/colors.dart';
import 'package:admin_app_real_estate/provider/properties_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class DeleteProp extends StatelessWidget {
  DeleteProp({super.key, required this.id});

  dynamic id;

  @override
  Widget build(BuildContext context) {
    final ctrl = Provider.of<PropertiesProvider>(context);
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 30),
        height: 40,
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
          onPressed: () async {
            showDeleteConfirmationDialog(context, ctrl);
          },
          child: Text(
            'remove property',
            style: GoogleFonts.poppins(fontSize: 20, color: backgroundColor),
          ),
        ));
  }

  showDeleteConfirmationDialog(BuildContext context, ctrl) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: backgroundColor,
          title: Text(
            'Confirm Deletion',
            style: GoogleFonts.poppins(color: themeColor),
          ),
          content: Text(
            'Are you sure you want to delete this item?',
            style: GoogleFonts.poppins(fontSize: 20, color: themeColor),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Cancel',
                style: GoogleFonts.poppins(color: Colors.grey),
              ),
            ),
            TextButton(
              onPressed: () async {
                Navigator.pop(context);
                await ctrl.deleteProperty(context, id);
              },
              child: Text(
                'Delete',
                style: GoogleFonts.poppins(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }
}
