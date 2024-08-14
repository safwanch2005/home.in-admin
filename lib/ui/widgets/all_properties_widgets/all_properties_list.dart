import 'package:admin_app_real_estate/core/font_style/colors.dart';
import 'package:admin_app_real_estate/core/font_style/font_styles.dart';
import 'package:admin_app_real_estate/provider/properties_provider.dart';
import 'package:admin_app_real_estate/ui/widgets/all_properties_widgets/area_ft.dart';
import 'package:admin_app_real_estate/ui/widgets/all_properties_widgets/category_text.dart';
import 'package:admin_app_real_estate/ui/widgets/all_properties_widgets/count_of_items.dart';
import 'package:admin_app_real_estate/ui/widgets/all_properties_widgets/filter_properties/filter_properties.dart';
import 'package:admin_app_real_estate/ui/widgets/all_properties_widgets/image.dart';
import 'package:admin_app_real_estate/ui/widgets/all_properties_widgets/land_length_breadth.dart';
import 'package:admin_app_real_estate/ui/widgets/all_properties_widgets/request_respone_button.dart';
import 'package:admin_app_real_estate/ui/widgets/all_properties_widgets/plot_area.dart';
import 'package:admin_app_real_estate/ui/widgets/all_properties_widgets/price.dart';
import 'package:admin_app_real_estate/ui/widgets/all_properties_widgets/prop_not_found.dart';
import 'package:admin_app_real_estate/ui/widgets/all_properties_widgets/title.dart';
import 'package:admin_app_real_estate/ui/widgets/properties_details_widgets/properties_detail_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:provider/provider.dart';

class AllPropertiesList extends StatefulWidget {
  const AllPropertiesList({super.key});

  @override
  State<AllPropertiesList> createState() => _AllPropertiesListState();
}

class _AllPropertiesListState extends State<AllPropertiesList> {
  @override
  void dispose() {
    PropertiesProvider.searchData = '';
    super.dispose();
  }

  //final ctrl = Get.put(PropertyController());

  Future<void> onRefresh() async {
    setState(() {});
    return await Future.delayed(const Duration(milliseconds: 500));
  }

  @override
  Widget build(BuildContext context) {
    final ctrl = Provider.of<PropertiesProvider>(context);
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
          height: MediaQuery.of(context).size.height * 0.04,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                color: themeColor.withOpacity(0.4), // Shadow color
                spreadRadius: 5, // Spread radius
                blurRadius: 7, // Blur radius
                offset: const Offset(0, 3), // Offset
              ),
            ],
          ),
          child: TextFormField(
            style: poppins(
                fontSize: 20, fontWeight: FontWeight.w300, color: themeColor),
            textAlign: TextAlign.center,
            onChanged: (value) {
              setState(() {
                PropertiesProvider.searchData = value;
              });
            },
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.fromLTRB(0, 5, 80, 0),
              hintText: 'Search property',
              hintStyle: poppins(
                  fontSize: 19, fontWeight: FontWeight.w300, color: themeColor),
              border: InputBorder.none,
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Icon(
                  Icons.search,
                  color: themeColor,
                  size: 25,
                ),
              ),
            ),
          ),
        ),
        const FilterPropertiesPage(),
        LiquidPullToRefresh(
          onRefresh: onRefresh,
          color: themeColor,
          backgroundColor: backgroundColor,
          showChildOpacityTransition: false,
          height: 80,
          animSpeedFactor: 3,
          child: StreamBuilder<QuerySnapshot>(
              stream: ctrl.getAllProperties(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                      child: CircularProgressIndicator(color: themeColor));
                }
                if (snapshot.hasError) {
                  return Center(
                      child: Text(
                    'Error: ${snapshot.error}',
                    style: GoogleFonts.poppins(color: errorColor),
                  ));
                }

                final propertiesDocs = snapshot.data?.docs ?? [];

                final searchData = PropertiesProvider.searchData.toLowerCase();
                var filteredProperties = propertiesDocs.where((prop) {
                  final propData = prop.data() as Map<String, dynamic>;
                  final title = propData['title'].toString().toLowerCase();
                  return title.contains(searchData);
                }).toList();
                if (ctrl.startingRange != null && ctrl.endingRange != null) {
                  filteredProperties = filteredProperties.where((prop) {
                    final propData = prop.data() as Map<String, dynamic>;
                    final price = int.parse(propData['price']);
                    return price >= ctrl.startingRange! &&
                        price <= ctrl.endingRange!;
                  }).toList();
                }
                if (ctrl.lowToHighPriceFilter != null) {
                  filteredProperties.sort((a, b) {
                    final priceA =
                        int.parse((a.data() as Map<String, dynamic>)['price']);
                    final priceB =
                        int.parse((b.data() as Map<String, dynamic>)['price']);

                    return ctrl.lowToHighPriceFilter!
                        ? priceA.compareTo(priceB)
                        : priceB.compareTo(priceA);
                  });
                }
                return Expanded(
                  child: filteredProperties.isEmpty
                      ? GestureDetector(
                          onTap: () => setState(() {}),
                          child: propNotFound(),
                        )
                      : Column(
                          children: [
                            Expanded(
                              child: ListView.builder(
                                  itemCount: filteredProperties.length,
                                  itemBuilder: (context, index) {
                                    final prop = filteredProperties[index];
                                    final propData =
                                        prop.data() as Map<String, dynamic>;

                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  PropertiesDetailsPage(
                                                    propData: propData,
                                                    propId: prop.id,
                                                  )),
                                        );
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 10),
                                        decoration: BoxDecoration(
                                          color: backgroundColor,
                                          border: Border.all(
                                              color: themeColor, width: 2),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(25)),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  themeColor.withOpacity(0.5),
                                              spreadRadius: 3,
                                              blurRadius: 10,
                                              offset: const Offset(0, 3),
                                            ),
                                          ],
                                        ),
                                        child: Column(
                                          children: [
                                            ImageAllProp(
                                              isSold: propData['isSold'],
                                              imgUrl:
                                                  propData["imageUrls"].first,
                                              isAccepted:
                                                  propData['isAccepted'],
                                            ),
                                            CategoryText(
                                              category: propData['category'],
                                              type: propData['type'],
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 15),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  TitleAllProp(
                                                    title: propData["title"],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 10,
                                                      horizontal: 15),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  PriceAllProp(
                                                    price: propData["price"],
                                                  ),
                                                  propData["category"] == "Land"
                                                      ? PlotAreaAllProp(
                                                          plotArea: propData[
                                                              "plotArea"],
                                                        )
                                                      : AreaSQ2(
                                                          areaSQ2: propData[
                                                              "areaftsq"]),
                                                ],
                                              ),
                                            ),
                                            RequestResponeButton(
                                              accepted: propData['isAccepted'],
                                              propId: prop.id,
                                              isHide: propData['hide'],
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                          ],
                        ),
                );
              }),
        ),
      ],
    );
  }
}
