import 'package:admin_app_real_estate/core/font_style/colors.dart';
import 'package:admin_app_real_estate/provider/properties_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class PriceRangeFilter extends StatefulWidget {
  PriceRangeFilter({super.key});
  int? startingRange;
  int? endingRange;
  @override
  State<PriceRangeFilter> createState() => _PriceRangeFilterState();
}

class _PriceRangeFilterState extends State<PriceRangeFilter> {
  //final propCtrl = Get.put(PropertyController());

  final startPriceController = TextEditingController();
  final endPriceController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final propCtrl = Provider.of<PropertiesProvider>(context);
    return GestureDetector(
      onTap: () {
        showPriceFilterDialog(context, propCtrl);
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
          "Price range : ${propCtrl.startingRange ?? 'N/A'} - ${propCtrl.endingRange ?? 'N/A'}",
          style: GoogleFonts.poppins(color: themeColor),
        ),
      ),
    );
  }

  showPriceFilterDialog(BuildContext context, propCtrl) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: themeColor,
          title: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
              setState(() {});
            },
            child: Column(
              children: [
                Text(
                  'Set price range',
                  style:
                      GoogleFonts.poppins(color: backgroundColor, fontSize: 30),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: startPriceController,
                  keyboardType: TextInputType.number,
                  decoration:
                      const InputDecoration(label: Text('Set starting range')),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: endPriceController,
                  keyboardType: TextInputType.number,
                  decoration:
                      const InputDecoration(label: Text('Set ending range')),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.amber),
                        onPressed: () {
                          propCtrl.startingRange = null;
                          propCtrl.endingRange = null;
                          startPriceController.clear();
                          endPriceController.clear();
                          Navigator.pop(context);
                          setState(() {});
                        },
                        child: Text(
                          'CLEAR',
                          style: GoogleFonts.poppins(
                              color: backgroundColor, fontSize: 20),
                        )),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.amber),
                        onPressed: () {
                          propCtrl.startingRange =
                              int.parse(startPriceController.text);
                          propCtrl.endingRange =
                              int.parse(endPriceController.text);
                          Navigator.pop(context);
                          setState(() {});
                        },
                        child: Text(
                          'SET',
                          style: GoogleFonts.poppins(
                              color: backgroundColor, fontSize: 20),
                        )),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
