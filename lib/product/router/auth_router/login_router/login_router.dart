// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutterturizm/feature/auth/login/view/loginloading/loginloading_view.dart';
import 'package:flutterturizm/feature/auth/login/view/registercomplete/registercomplete_view.dart';
import 'package:flutterturizm/feature/auth/password/password_view.dart';
import 'package:flutterturizm/feature/auth/register/register_view.dart';
import 'package:flutterturizm/product/utility/database/logregpass_db/register_db/register_db.dart';

class LoginRouterService {
  // forgot password view router
  void loginForgotPassowrdNavigatorRouter(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 500),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(0.0, -1.0); // Yukarıdan başlıyor
          const end = Offset.zero;
          const curve = Curves.ease;

          final tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
        pageBuilder: (context, animation, secondaryAnimation) =>
            const ForgotPasswordView(),
      ),
    );
  }

  // register view router
  void loginRegisterViewNavigatorRouter(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 500),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(-1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.ease;

          final tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
        pageBuilder: (context, animation, secondaryAnimation) =>
            const RegisterView(),
      ),
    );
  }

  // login loading router view
  Future<void> loginLoadingRouterViewNavigatorRouter(
    BuildContext context,
  ) async {
    final userTable = await RegisterDB.USERS.userRef.get();

    if (userTable.exists) {
      await Navigator.push(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 500),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(1.0, 0.0);
            const end = Offset.zero;
            const curve = Curves.ease;

            final tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
          pageBuilder: (context, animation, secondaryAnimation) =>
              const LoginLoadingView(),
        ),
      );
    } else {
      await Navigator.push(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 500),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(1.0, 0.0);
            const end = Offset.zero;
            const curve = Curves.ease;

            final tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
          pageBuilder: (context, animation, secondaryAnimation) =>
              const RegisterCompleteView(),
        ),
      );
    }
  }
}
