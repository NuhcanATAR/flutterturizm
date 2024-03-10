// ignore_for_file: constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterturizm/product/utility/service/firebase/firebase_service.dart';

enum RegisterDB {
  USERS;

  DocumentReference<Map<String, dynamic>> get userRef =>
      FirebaseFirestore.instance.collection(name).doc(FirebaseService().userID);
}
