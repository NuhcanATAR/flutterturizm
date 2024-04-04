import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterturizm/feature/auth/login/view/loginloading/loginloading_view.dart';
import 'package:flutterturizm/feature/auth/logreg/logreg_view.dart';
import 'package:flutterturizm/product/mixin/logregpass_mixin/login_mixin/loginbloc_mixin.dart';
import 'package:flutterturizm/product/utility/dynamicextension/dynamicextension.dart';

abstract class MainLoginBase<T extends StatefulWidget> extends State<T>
    with AuthSingInBlocMixin {
  // view size
  DynamicViewExtensions dynamicViewExtensions = DynamicViewExtensions();

  // control auth splash view
  Future<void> controlSplashGoogleAuthUser() async {
    final userCredential = FirebaseAuth.instance.currentUser?.uid;

    unawaited(
      userCredential != null
          ? Future.delayed(
              const Duration(
                seconds: 4,
              ),
              () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginLoadingView(),
                  ),
                  (Route<dynamic> route) => false,
                );
              },
            )
          : Future.delayed(
              const Duration(
                seconds: 4,
              ),
              () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginRegisterView(),
                  ),
                  (Route<dynamic> route) => false,
                );
              },
            ),
    );
  }
}
