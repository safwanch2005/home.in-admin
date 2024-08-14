import 'package:admin_app_real_estate/core/font_style/colors.dart';
import 'package:admin_app_real_estate/provider/properties_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class CustomFilterButton extends StatefulWidget {
  CustomFilterButton(
      {super.key,
      required this.text,
      required this.textsList,
      required this.selectedOne});
  String text;
  List<String> textsList;
  dynamic selectedOne;
  @override
  State<CustomFilterButton> createState() => _CustomFilterButtonState();
}

class _CustomFilterButtonState extends State<CustomFilterButton> {
  @override
  Widget build(BuildContext context) {
    final propCtrl = Provider.of<PropertiesProvider>(context);

    return GestureDetector(
      onTap: () {
        showFilterDialog(context, widget.text, widget.textsList, propCtrl);
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
          "${widget.text} : ${widget.selectedOne ?? "All"}",
          style: GoogleFonts.poppins(color: themeColor, fontSize: 15),
        ),
      ),
    );
  }

  showFilterDialog(BuildContext context, text, textsList, propCtrl) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: themeColor,
          title: Text(
            'Select $text',
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
                    setValue(text, texti, propCtrl);
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

  setValue(String text, String selectedValue, propCtrl) {
    if (text == 'category') {
      // category
      if (selectedValue == "All") {
        propCtrl.categoryFilter = null;
        widget.selectedOne = null;
        return;
      }
      widget.selectedOne = selectedValue;
      propCtrl.categoryFilter = selectedValue;
      return;
    } else if (text == 'type') {
      // type
      if (selectedValue == "All") {
        propCtrl.typeFilter = null;
        widget.selectedOne = null;
        return;
      }
      widget.selectedOne = selectedValue;
      propCtrl.typeFilter = selectedValue;
    } else if (text == "Construction status") {
      // construction status
      if (selectedValue == "All") {
        propCtrl.constructionStatusFilter = null;
        widget.selectedOne = null;
        return;
      }
      widget.selectedOne = selectedValue;
      propCtrl.constructionStatusFilter = selectedValue;
    } else if (text == "Listed by") {
      // listed by
      if (selectedValue == "All") {
        propCtrl.listedByFilter = null;
        widget.selectedOne = null;
        return;
      }
      widget.selectedOne = selectedValue;
      propCtrl.listedByFilter = selectedValue;
    } else if (text == "Floors") {
      // floors
      if (selectedValue == "All") {
        propCtrl.floorsFilter = null;
        widget.selectedOne = null;
        return;
      }
      widget.selectedOne = selectedValue;
      propCtrl.floorsFilter = selectedValue;
    } else if (text == "Bed") {
      // bedrooms
      if (selectedValue == "All") {
        propCtrl.bedFilter = null;
        widget.selectedOne = null;
        return;
      }
      widget.selectedOne = selectedValue;
      propCtrl.bedFilter = selectedValue;
    } else if (text == "Bath") {
      // bathrooms
      if (selectedValue == "All") {
        propCtrl.bathFilter = null;
        widget.selectedOne = null;
        return;
      }
      widget.selectedOne = selectedValue;
      propCtrl.bathFilter = selectedValue;
    } else if (text == "Furnishing") {
      // Furnishing
      if (selectedValue == "All") {
        propCtrl.furnishingFilter = null;
        widget.selectedOne = null;
        return;
      }
      widget.selectedOne = selectedValue;
      propCtrl.furnishingFilter = selectedValue;
    } else if (text == 'Sort by') {
      //sort by
      if (selectedValue == 'All') {
        propCtrl.lowToHighPriceFilter = null;
        widget.selectedOne = null;
        return;
      } else if (selectedValue == 'Low to high') {
        propCtrl.lowToHighPriceFilter = true;
        widget.selectedOne = 'Low to high';
        return;
      } else if (selectedValue == 'High to low') {
        propCtrl.lowToHighPriceFilter = false;
        widget.selectedOne = 'High to low';
        return;
      }
    }
  }
}
