import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseService {
  // cloud firesotore
  final cloudFireStore = FirebaseFirestore.instance;
  // auth service
  final authService = FirebaseAuth.instance;
  // google auth
  final GoogleSignIn googleSignIn = GoogleSignIn();
  // auth id
  final userID = FirebaseAuth.instance.currentUser!.uid;
}
