import 'package:admin_app_real_estate/core/font_style/colors.dart';
import 'package:admin_app_real_estate/provider/properties_provider.dart';
import 'package:admin_app_real_estate/ui/widgets/all_properties_widgets/prop_not_found.dart';
import 'package:admin_app_real_estate/ui/widgets/home_screen_widgets/recent_properties/recent_image.dart';
import 'package:admin_app_real_estate/ui/widgets/home_screen_widgets/recent_properties/recent_prop_cat.dart';
import 'package:admin_app_real_estate/ui/widgets/home_screen_widgets/recent_properties/recent_prop_title.dart';
import 'package:admin_app_real_estate/ui/widgets/properties_details_widgets/properties_detail_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CardBuilder extends StatelessWidget {
  const CardBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = Provider.of<PropertiesProvider>(context, listen: false);
    return StreamBuilder<QuerySnapshot>(
        stream: ctrl.getRecentProperties(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator(color: themeColor));
          }
          if (snapshot.hasError) {
            return Center(
                child: Text(
              'Error: ${snapshot.error}',
              style: GoogleFonts.poppins(color: errorColor),
            ));
          }

          final propertiesDocs = snapshot.data?.docs ?? [];

          return Expanded(
            child: propertiesDocs.isEmpty
                ? propNotFound()
                : Column(
                    children: [
                      Expanded(
                          child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: backgroundColor,
                          boxShadow: [
                            BoxShadow(
                              color: themeColor.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: CardSwiper(
                          duration: const Duration(milliseconds: 100),
                          padding: EdgeInsets.zero,
                          cardsCount: propertiesDocs.length,
                          numberOfCardsDisplayed: 1,
                          allowedSwipeDirection:
                              const AllowedSwipeDirection.only(
                                  right: true, left: true),
                          cardBuilder: (context, index, x, y) {
                            final prop = propertiesDocs[index];
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
                                decoration: BoxDecoration(
                                  color: backgroundColor,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Stack(
                                  children: [
                                    RecentPropImage(
                                      isSold: propData['isSold'],
                                      imgUrl: propData["imageUrls"].first,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          RecentPropCat(
                                            category: propData['category'],
                                            type: propData['type'],
                                          ),
                                          RecentPropTitle(
                                            title: propData["title"],
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      )),
                    ],
                  ),
          );
        });
  }
}
