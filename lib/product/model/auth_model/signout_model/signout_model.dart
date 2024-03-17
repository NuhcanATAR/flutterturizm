// ignore_for_file: constant_identifier_names

import 'package:flutterturizm/product/model/auth_model/currentuser_model/currentuser_model.dart';

enum AuthMethodType { GoogleAuth, EmailAndPasswordAuth, NoneAuth }

AuthMethodType getAuthMethod(CurrentUserModel user) {
  if (user.email.isNotEmpty && user.password.isNotEmpty) {
    return AuthMethodType.EmailAndPasswordAuth;
  } else if (user.uid.isNotEmpty) {
    return AuthMethodType.GoogleAuth;
  } else {
    return AuthMethodType.NoneAuth;
  }
}
