import 'package:flutter/material.dart';

class LoginModelService {
  // form key
  final formLoginKey = GlobalKey<FormState>();

  // controller
  late TextEditingController emailController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();

  // password hide status
  late bool isPasswordHideStatus = true;

  // remember me status email & password
  late bool isRememberMeStatus = false;

  // regexp
  final emailRegExp =
      RegExp(r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$");
  final RegExp passwordUserPattern =
      RegExp(r'^(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

  // validator
  String? emailValidator(String? emailVal) {
    if (emailVal == null || emailVal.isEmpty) {
      return "E-posta alanı boş bırakılamaz";
    } else if (!emailRegExp.hasMatch(emailVal)) {
      return "Geçersiz e-posta formatı";
    } else {
      return null;
    }
  }

  String? passwordValidator(String? passwordVal) {
    if (passwordVal == null || passwordVal.isEmpty) {
      return "Şifre alanı boş bırakılamaz";
    }

    if (!passwordUserPattern.hasMatch(passwordVal)) {
      return "Şifre en az bir büyük harf, bir küçük harf, bir rakam ve bir özel karakter içermelidir!";
    }

    return null;
  }
}
