import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
  // cloud firesotore
  final cloudFireStore = FirebaseFirestore.instance;
  // auth service
  final authService = FirebaseAuth.instance;
  // auth id
  final userID = FirebaseAuth.instance.currentUser!.uid;
}
