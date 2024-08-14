import 'package:admin_app_real_estate/core/font_style/colors.dart';
import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PropertyImage extends StatelessWidget {
  PropertyImage({super.key, required this.imageUrls});
  dynamic imageUrls;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 330,
      // width: double.infinity,
      child: AnotherCarousel(
        dotColor: themeColor,
        dotBgColor: Colors.black12.withOpacity(0),
        autoplay: false,
        boxFit: BoxFit.fill,
        dotVerticalPadding: 10,
        images: imageUrls.map((imageUrl) => NetworkImage(imageUrl)).toList(),
      ),
    );
  }
}
