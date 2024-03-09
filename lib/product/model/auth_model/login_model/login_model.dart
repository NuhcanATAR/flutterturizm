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
}
