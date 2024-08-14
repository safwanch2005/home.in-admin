import 'package:admin_app_real_estate/provider/properties_provider.dart';
import 'package:admin_app_real_estate/ui/widgets/all_properties_widgets/filter_properties/custom_button.dart';
import 'package:admin_app_real_estate/ui/widgets/all_properties_widgets/filter_properties/price_range_filter.dart';
import 'package:admin_app_real_estate/ui/widgets/all_properties_widgets/filter_properties/request_filter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FilterPropertiesPage extends StatelessWidget {
  const FilterPropertiesPage({super.key});
  //final propCtrl = Get.put(PropertyController());

  @override
  Widget build(BuildContext context) {
    final propCtrl = Provider.of<PropertiesProvider>(context);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25),
      height: 35,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          RequestFilter(selectedOne: propCtrl.isAccepted),
          CustomFilterButton(
            text: "category",
            textsList: const ['All', 'House', 'Apartment', 'Land'],
            selectedOne: propCtrl.categoryFilter,
          ),
          CustomFilterButton(
            text: "type",
            textsList: const ['All', 'For sale', 'For rent'],
            selectedOne: propCtrl.typeFilter,
          ),
          CustomFilterButton(
            text: "Listed by",
            textsList: const [
              'All',
              "Dealer",
              "Owner",
            ],
            selectedOne: propCtrl.listedByFilter,
          ),
          PriceRangeFilter(),
          CustomFilterButton(
            text: "Sort by",
            textsList: const [
              'All',
              "Low to high",
              "High to low",
            ],
            selectedOne: propCtrl.lowToHighPriceFilter == null
                ? null
                : propCtrl.lowToHighPriceFilter!
                    ? "Low to high"
                    : "High to low",
          ),
          CustomFilterButton(
            text: "Construction status",
            textsList: const [
              'All',
              "New Launch",
              "Ready to Move",
              "Under Construction"
            ],
            selectedOne: propCtrl.constructionStatusFilter,
          ),
          CustomFilterButton(
            text: "Furnishing",
            textsList: const [
              'All',
              'Fully Furnished',
              'Semi-Furnished',
              'Unfurnished',
              'Partially Furnished',
            ],
            selectedOne: propCtrl.furnishingFilter,
          ),
          CustomFilterButton(
            text: "Floors",
            textsList: const ["All", "0", "1", "2", "3+"],
            selectedOne: propCtrl.floorsFilter,
          ),
          CustomFilterButton(
            text: "Bed",
            textsList: const ["All", "0", "1", "2", "3+"],
            selectedOne: propCtrl.bedFilter,
          ),
          CustomFilterButton(
            text: "Bath",
            textsList: const ["All", "0", "1", "2", "3+"],
            selectedOne: propCtrl.bathFilter,
          ),
        ],
      ),
    );
  }
}
