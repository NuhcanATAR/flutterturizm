// ignore_for_file: use_build_context_synchronously, overridden_fields, annotate_overrides

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterturizm/feature/auth/login/view/loginloading_view.dart';
import 'package:flutterturizm/feature/auth/logreg/logreg_view.dart';
import 'package:flutterturizm/product/bloc/logregpass_bloc/login_bloc/cubit/cubit.dart';
import 'package:flutterturizm/product/extension/view_extension.dart';
import 'package:flutterturizm/product/mixin/logregpass_mixin/login_mixin/login_mixin.dart';
import 'package:flutterturizm/product/model/auth_model/login_model/login_model.dart';
import 'package:flutterturizm/product/router/auth_router/login_router/login_router.dart';

abstract class MainLoginBase<T extends StatefulWidget> extends State<T>
    with AuthSingInBlocMixin {
  // router service

  LoginRouterService loginRouterService = LoginRouterService();

  // model service
  LoginModelService loginModelService = LoginModelService();

  // view size
  double dynamicWidth(double value) => maxWidth * value;
  double dynamicHeight(double value) => maxHeight * value;

  late final maxWidth = ViewSizeModelExtension(context).mediaSize.width;
  late final maxHeight = ViewSizeModelExtension(context).mediaSize.height;

  // email & password login
  void loginEmailAndPasswordAuth() {
    if (loginModelService.formLoginKey.currentState!.validate()) {
      BlocProvider.of<AuthSignInCubit>(context).emailPasswordSingIn(
        loginModelService.emailController.text,
        loginModelService.passwordController.text,
      );
    }
  }

  // google login
  Future<void> googleLoginButton() async {
    await BlocProvider.of<AuthSignInCubit>(context).signInWithGoogle();
  }

  // control auth splash view
  void controlSplashGoogleAuthUser() async {
    final userCredential = FirebaseAuth.instance.currentUser?.uid;

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
                  (Route<dynamic> route) => false);
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
                  (Route<dynamic> route) => false);
            },
          );
  }
}
