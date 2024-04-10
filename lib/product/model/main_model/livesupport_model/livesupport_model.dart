import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutterturizm/product/utility/service/firebase/firebase_service.dart';

class LiveSupportModelService {
  // date
  late DateTime dateTime = DateTime.now();

  // controller
  final TextEditingController messageController = TextEditingController();

  // messages ref
  final DatabaseReference messagesRef =
      FirebaseService().databaseReference.child(FirebaseService().userID);
}
