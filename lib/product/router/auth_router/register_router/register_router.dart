import 'package:flutter/material.dart';
import 'package:flutterturizm/feature/auth/login/login_view.dart';

class RegisterRouterService {
  //  login view router
  void loginViewNavigatorRouter(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 500),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0); // Sağdan başlıyor
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
            const LoginView(),
      ),
    );
  }
}
