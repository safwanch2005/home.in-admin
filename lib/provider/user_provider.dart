import 'package:admin_app_real_estate/firebase/firebase_constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  int usersLength = 0;
  int propertiesLength = 0;
  static String searchData = "";

  Future<int> getUsersCount() async {
    QuerySnapshot querySnapshot = await db.collection('users').get();
    usersLength = querySnapshot.size;
    notifyListeners();
    return usersLength;
  }

  Future<int> getPropertiesCount() async {
    QuerySnapshot querySnapshot = await db.collection('properties').get();
    propertiesLength = querySnapshot.size;
    notifyListeners();
    return propertiesLength;
  }

  Stream<QuerySnapshot> getAllUsers() {
    return db
        .collection('users')
        .orderBy('timestamp', descending: true)
        .snapshots();
  }
}
