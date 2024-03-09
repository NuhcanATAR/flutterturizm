// ignore_for_file: body_might_complete_normally_nullable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterturizm/product/bloc/logregpass_bloc/login_bloc/state/state.dart';
import 'package:flutterturizm/product/enums/logregpass_enums/login_enum/login_enum.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthSignInCubit extends Cubit<AuthSignInMainState> {
  AuthSignInCubit() : super(AuthSignInInitialState());

  // email login
  Future<void> emailPasswordSingIn(String email, String password) async {
    emit(AuthSignInLoadingState());

    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      User user = userCredential.user!;

      if (user.emailVerified) {
        emit(AuthSignInSuccessState());
      } else {
        emit(AuthSignInErrorState(
          LoginViewStrings.loginEmailVerifiedErrorSnackBarText.value,
        ));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(AuthSignInErrorState(
          LoginViewStrings.loginUserNotFount.value,
        ));
      } else if (e.code == 'wrong-password') {
        emit(AuthSignInErrorState(
          LoginViewStrings.loginWrongPassword.value,
        ));
      } else if (e.code == 'too-many-requests') {
        emit(AuthSignInErrorState(
          LoginViewStrings.loginTooManyRequest.value,
        ));
      } else if (e.code == "invalid-email") {
        emit(AuthSignInErrorState(
          LoginViewStrings.loginInvalidEmail.value,
        ));
      } else {
        emit(AuthSignInErrorState(
          LoginViewStrings.loginAuthError.value,
        ));
      }
    } catch (e) {
      emit(AuthSignInErrorState(
        LoginViewStrings.loginAuthError.value,
      ));
    }
  }

  // google login
  Future<UserCredential?> signInWithGoogle() async {
    emit(AuthSignInGoogleAuthLoading());
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      return await FirebaseAuth.instance
          .signInWithCredential(credential)
          .then((value) {
        emit(AuthSingInGoogleAuthSuccess());
      });
    } catch (error) {
      if (kDebugMode) {
        print("${LoginViewStrings.loginGoogleAuthError.value} $error");
      }

      emit(AuthSignInGoogleAuthError(
        LoginViewStrings.loginGoogleAuthError.value,
      ));
      return null;
    }
  }
}
