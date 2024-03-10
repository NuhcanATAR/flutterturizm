import 'package:flutter/widgets.dart';

class PasswordModelService {
  // final form key
  final formPasswordKey = GlobalKey<FormState>();

  // controller
  late TextEditingController emailController = TextEditingController();

  // regxp
  final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  String? emailValidator(String? emailVal) {
    if (emailVal == null || emailVal.isEmpty) {
      return "E-posta adresi zorunludur!";
    } else {
      if (!emailRegex.hasMatch(emailVal)) {
        return "Geçersiz e-posta adresi!";
      }
      return null;
    }
  }
}
