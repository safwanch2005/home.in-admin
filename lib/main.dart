import 'package:admin_app_real_estate/app.dart';
import 'package:admin_app_real_estate/firebase/firebase_constants.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await firebaseInitialization;
  runApp(const MyApp());
}
