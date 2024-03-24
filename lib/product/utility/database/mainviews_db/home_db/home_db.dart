// ignore_for_file: constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterturizm/product/utility/service/firebase/firebase_service.dart';

enum HomeDB {
  USERS,
  ADVERTS;

  Future<DocumentSnapshot<Map<String, dynamic>>> get userRef =>
      FirebaseService()
          .cloudFireStore
          .collection(name)
          .doc(FirebaseService().userID)
          .get();

  Query<Map<String, dynamic>> get homeAdvertsList => FirebaseService()
      .cloudFireStore
      .collection(name)
      .where("ACTIVE", isEqualTo: true);
}
