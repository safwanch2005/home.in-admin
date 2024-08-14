import 'package:admin_app_real_estate/core/font_style/colors.dart';
import 'package:admin_app_real_estate/ui/widgets/properties_details_widgets/back_icon.dart';
import 'package:admin_app_real_estate/ui/widgets/properties_details_widgets/count_of_items.dart';
import 'package:admin_app_real_estate/ui/widgets/properties_details_widgets/delete_prop.dart';
import 'package:admin_app_real_estate/ui/widgets/properties_details_widgets/description.dart';
import 'package:admin_app_real_estate/ui/widgets/properties_details_widgets/details_container.dart';
import 'package:admin_app_real_estate/ui/widgets/properties_details_widgets/land_details_container.dart';
import 'package:admin_app_real_estate/ui/widgets/properties_details_widgets/land_length_breadth.dart';
import 'package:admin_app_real_estate/ui/widgets/properties_details_widgets/location_text.dart';
import 'package:admin_app_real_estate/ui/widgets/properties_details_widgets/price.dart';
import 'package:admin_app_real_estate/ui/widgets/properties_details_widgets/property_image.dart';
import 'package:admin_app_real_estate/ui/widgets/properties_details_widgets/title.dart';
import 'package:admin_app_real_estate/ui/widgets/properties_details_widgets/user_profile.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PropertiesDetailsPage extends StatelessWidget {
  PropertiesDetailsPage(
      {super.key, required this.propData, required this.propId});
  Map<String, dynamic> propData;
  dynamic propId;
  double initialX = 0.0;
  double finalX = 0.0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onHorizontalDragStart: (details) {
          initialX = details.localPosition.dx;
        },
        onHorizontalDragUpdate: (details) {
          finalX = details.localPosition.dx;
        },
        onHorizontalDragEnd: (details) async {
          if (finalX - initialX > 0) {
            Navigator.pop(context);
          } else {}
        },
        child: Scaffold(
          backgroundColor: Colors.black12,
          body: SingleChildScrollView(
            child: Stack(
              children: [
                Stack(
                  children: [
                    PropertyImage(
                      imageUrls: propData["imageUrls"],
                    ),
                    const BackIcon(),
                  ],
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 305,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 20),
                      alignment: Alignment.topCenter,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: backgroundColor,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              PriceDetailPage(price: propData['price']),
                              // const PostedTime(),
                            ],
                          ),
                          TitleDetailPage(title: propData['title']),
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            margin: const EdgeInsets.only(top: 10),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: backgroundColor,
                              boxShadow: [
                                BoxShadow(
                                  color: themeColor
                                      .withOpacity(0.5), // Shadow color
                                  spreadRadius: 5, // Spread radius
                                  blurRadius: 7, // Blur radius
                                  offset: const Offset(0, 3), // Offset
                                ),
                              ],
                              borderRadius: const BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            child: Column(
                              children: [
                                propData["category"] == "Land"
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          LandLengthBreadthAllDetailPage(
                                            type: "Length :",
                                            value: propData["length"],
                                          ),
                                          LandLengthBreadthAllDetailPage(
                                            type: "Breadth :",
                                            value: propData["breadth"],
                                          ),
                                        ],
                                      )
                                    : Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          CountsOfItemsAllDetailPage(
                                            items: propData["bedrooms"],
                                            icon: Icons.bed_outlined,
                                          ),
                                          CountsOfItemsAllDetailPage(
                                            items: propData["bathrooms"],
                                            icon: Icons.bathtub_outlined,
                                          ),
                                          CountsOfItemsAllDetailPage(
                                            items: propData["floors"],
                                            icon: Icons.layers,
                                          ),
                                        ],
                                      ),
                                LocationTextDetailPage(
                                    location: propData["location"]),
                              ],
                            ),
                          ),
                          propData["category"] == "Land"
                              ? LandDetailsContainer(propData: propData)
                              : DetailsContainerHouseApart(propData: propData),
                          DescriptionPageDetailPage(
                              description: propData['description']),
                          UserProfileDetailsPage(propData: propData),
                          const SizedBox(height: 30),
                          DeleteProp(id: propId),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
