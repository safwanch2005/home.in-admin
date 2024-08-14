import 'package:admin_app_real_estate/core/custom_snackbar/custom_snack_success.dart';
import 'package:admin_app_real_estate/core/font_style/colors.dart';
import 'package:admin_app_real_estate/provider/properties_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class RequestResponeButton extends StatelessWidget {
  RequestResponeButton(
      {super.key,
      required this.propId,
      required this.accepted,
      required this.isHide});
  String propId;
  int accepted;
  bool isHide;
  @override
  Widget build(BuildContext context) {
    final ctrl = Provider.of<PropertiesProvider>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: accepted == 2
          ? SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: themeColor),
                  onPressed: () async {
                    await ctrl.hideProperty(propId, !isHide);
                  },
                  child: Text(
                    isHide ? "Show property" : "Hide property",
                    style: GoogleFonts.poppins(
                        fontSize: 20, color: backgroundColor),
                  )))
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: errorColor),
                        onPressed: () async {
                          await ctrl.propertyRequestResponse(propId, 1);
                          successSnack("Success", "Property rejected");
                        },
                        child: Row(
                          children: [
                            Icon(Icons.check, color: backgroundColor),
                            Text(
                              "Reject",
                              style:
                                  GoogleFonts.poppins(color: backgroundColor),
                            ),
                          ],
                        ))),
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: successColor),
                        onPressed: () async {
                          await ctrl.propertyRequestResponse(propId, 2);
                          successSnack("Success", "Property accepted");
                        },
                        child: Text("Accept",
                            style:
                                GoogleFonts.poppins(color: backgroundColor)))),
              ],
            ),
    );
  }
}
