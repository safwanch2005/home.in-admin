import 'package:firebase_core/firebase_core.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

final Future<FirebaseApp> firebaseInitialization = Firebase.initializeApp();
