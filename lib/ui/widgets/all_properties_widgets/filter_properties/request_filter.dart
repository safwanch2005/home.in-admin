import 'package:admin_app_real_estate/core/font_style/colors.dart';
import 'package:admin_app_real_estate/provider/properties_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class RequestFilter extends StatefulWidget {
  RequestFilter({super.key, required this.selectedOne});

  List<String> textsList = [
    'New requests',
    'Accepted requests',
  ];
  int? selectedOne;
  @override
  State<RequestFilter> createState() => _RequestFilterState();
}

class _RequestFilterState extends State<RequestFilter> {
  @override
  Widget build(BuildContext context) {
    final propCtrl = Provider.of<PropertiesProvider>(context);
    return GestureDetector(
      onTap: () {
        showFilterDialog(context, widget.textsList, propCtrl);
      },
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        height: 20,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: backgroundColor,
        ),
        child: Text(
          widget.selectedOne == null
              ? "Requests : New requests"
              : widget.selectedOne == 0
                  ? "Requests : New requests"
                  : "Requests : Accepted requests",
          style: GoogleFonts.poppins(color: themeColor, fontSize: 15),
        ),
      ),
    );
  }

  showFilterDialog(BuildContext context, textsList, propCtrl) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: themeColor,
          title: Text(
            'Select one',
            style: GoogleFonts.poppins(color: backgroundColor, fontSize: 30),
          ),
          content: Wrap(
            children: textsList.map<Widget>((texti) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: backgroundColor,
                ),
                child: GestureDetector(
                  onTap: () {
                    propCtrl.getAllProperties();
                    setValue(texti, propCtrl);
                    Navigator.of(context).pop();
                    setState(() {});
                  },
                  child: Text(
                    texti,
                    style: GoogleFonts.poppins(color: themeColor),
                  ),
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }

  setValue(String selectedValue, propCtrl) {
    if (selectedValue == 'New requests') {
      propCtrl.isAccepted = 0;
      widget.selectedOne = 0;
    } else if (selectedValue == 'Accepted requests') {
      widget.selectedOne = 2;
      propCtrl.isAccepted = 2;
    } else if (selectedValue == 'Rejected requests') {
      widget.selectedOne = 1;
      propCtrl.isAccepted = 1;
    }
  }
}
