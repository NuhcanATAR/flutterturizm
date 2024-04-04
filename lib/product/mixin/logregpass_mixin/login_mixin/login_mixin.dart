import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterturizm/product/bloc/logregpass_bloc/login_bloc/cubit/cubit.dart';
import 'package:flutterturizm/product/model/auth_model/login_model/login_model.dart';

mixin LoginMixin {
  // email & password login
  void loginEmailAndPasswordAuth(
    BuildContext context,
    LoginModelService loginModelService,
  ) {
    if (loginModelService.formLoginKey.currentState!.validate()) {
      BlocProvider.of<AuthSignInCubit>(context).emailPasswordSingIn(
        loginModelService.emailController.text,
        loginModelService.passwordController.text,
      );
    }
  }

  // google login
  Future<void> googleLoginButton(BuildContext context) async {
    await BlocProvider.of<AuthSignInCubit>(context).signInWithGoogle();
  }
}
