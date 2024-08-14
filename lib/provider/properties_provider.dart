import 'package:admin_app_real_estate/core/custom_snackbar/custom_snack_error.dart';
import 'package:admin_app_real_estate/core/custom_snackbar/custom_snack_success.dart';
import 'package:admin_app_real_estate/firebase/firebase_constants.dart';
import 'package:flutter/material.dart';

class PropertiesProvider extends ChangeNotifier {
  static String searchData = "";
  ///// data for filter
  String? categoryFilter;
  String? typeFilter;
  String? constructionStatusFilter;
  String? listedByFilter;
  String? floorsFilter;
  String? bedFilter;
  String? bathFilter;
  String? furnishingFilter;
  bool? lowToHighPriceFilter;
  int? startingRange;
  int? endingRange;
  int isAccepted = 0;

  getAllProperties() {
    return db
        .collection("properties")
        .where("category", isEqualTo: categoryFilter)
        .where("type", isEqualTo: typeFilter)
        .where('constructionStatus', isEqualTo: constructionStatusFilter)
        .where('listedBy', isEqualTo: listedByFilter)
        .where('floors', isEqualTo: floorsFilter)
        .where('bedrooms', isEqualTo: bedFilter)
        .where('bathrooms', isEqualTo: bathFilter)
        .where('furnishing', isEqualTo: furnishingFilter)
        .where('isAccepted', isEqualTo: isAccepted)
        .snapshots();
  }

  getRecentProperties() {
    return db
        .collection("properties")
        .orderBy('timestamp', descending: true)
        .where('isAccepted', isEqualTo: 2)
        .snapshots();
  }

  deleteProperty(context, String propertyId) async {
    try {
      ScaffoldMessenger.of(context)
          .showSnackBar(successSnack(context, 'Property deleted successfully'));
      Navigator.of(context).pop();
      await db.collection('properties').doc(propertyId).delete();
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(errorSnack(context, 'error :$e'));
    }
  }

  propertyRequestResponse(String propId, int value) async {
    //0 request sent
    //1 request rejected
    //2 request accepted
    await db.collection('properties').doc(propId).update({
      'isAccepted': value,
    });
  }

  hideProperty(String propId, bool value) async {
    await db.collection('properties').doc(propId).update({
      'hide': value,
    });
  }
}
