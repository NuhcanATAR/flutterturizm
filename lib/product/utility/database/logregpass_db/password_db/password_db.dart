// ignore_for_file: constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterturizm/product/utility/service/firebase/firebase_service.dart';

enum PasswordDB {
  USERS;

  Future<QuerySnapshot<Map<String, dynamic>>> userEmailRef(String email) =>
      FirebaseService()
          .cloudFireStore
          .collection(name)
          .where("EMAIL", isEqualTo: email)
          .get();
}
