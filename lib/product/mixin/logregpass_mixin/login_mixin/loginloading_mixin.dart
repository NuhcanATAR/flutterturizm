// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutterturizm/feature/auth/login/view/registercomplete/registercomplete_view.dart';
import 'package:flutterturizm/feature/main/bottommenu/bottommenu_view.dart';
import 'package:flutterturizm/product/utility/database/logregpass_db/register_db/register_db.dart';
import 'package:flutterturizm/product/utility/service/firebase/firebase_service.dart';

mixin LoginLoadingRouterViewMixin {
  void loginLoadingControl(BuildContext context) async {
    final userTable = await RegisterDB.USERS.userRef.get();

    if (FirebaseService().userID.isNotEmpty) {
      if (userTable.exists) {
        Navigator.pushAndRemoveUntil(
            context,
            PageRouteBuilder(
              transitionDuration: const Duration(milliseconds: 500),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                var begin = const Offset(1.0, 0.0);
                var end = Offset.zero;
                var curve = Curves.ease;

                var tween = Tween(begin: begin, end: end)
                    .chain(CurveTween(curve: curve));

                return SlideTransition(
                  position: animation.drive(tween),
                  child: child,
                );
              },
              pageBuilder: (context, animation, secondaryAnimation) =>
                  const BottomMenuView(),
            ),
            (Route<dynamic> route) => false);
      } else {
        Navigator.pushAndRemoveUntil(
            context,
            PageRouteBuilder(
              transitionDuration: const Duration(milliseconds: 500),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                var begin = const Offset(1.0, 0.0);
                var end = Offset.zero;
                var curve = Curves.ease;

                var tween = Tween(begin: begin, end: end)
                    .chain(CurveTween(curve: curve));

                return SlideTransition(
                  position: animation.drive(tween),
                  child: child,
                );
              },
              pageBuilder: (context, animation, secondaryAnimation) =>
                  const RegisterCompleteView(),
            ),
            (Route<dynamic> route) => false);
      }
    } else {
      Navigator.pushAndRemoveUntil(
          context,
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 500),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              var begin = const Offset(1.0, 0.0);
              var end = Offset.zero;
              var curve = Curves.ease;

              var tween =
                  Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            },
            pageBuilder: (context, animation, secondaryAnimation) =>
                const BottomMenuView(),
          ),
          (Route<dynamic> route) => false);
    }
  }
}
