import 'package:flutter/material.dart';
import 'package:flutterturizm/product/bloc/logregpass_bloc/login_bloc/state/state.dart';
import 'package:flutterturizm/product/constant/color_constant.dart';
import 'package:flutterturizm/product/model/auth_model/login_model/login_model.dart';

import 'package:flutterturizm/product/router/auth_router/login_router/login_router.dart';
import 'package:flutterturizm/product/widget/text_widget/label_medium_text.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

mixin AuthSingInBlocMixin {
  LoginRouterService loginRouterService = LoginRouterService();
  LoginModelService loginModelService = LoginModelService();

  void signInEmailPasswordListenerBloc(context, state) {
    if (state is AuthSignInSuccessState) {
      Navigator.pop(context);
      loginRouterService.loginLoadingRouterViewNavigatorRouter(context);
      loginModelService.emailController.clear();
      loginModelService.passwordController.clear();
    } else if (state is AuthSignInErrorState) {
      Navigator.pop(context);
      final snackBar = SnackBar(
        backgroundColor: MainAppColorConstants.blueMainColor,
        content: LabelMediumWhiteText(
          text: state.errorMessage,
          textAlign: TextAlign.left,
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else if (state is AuthSingInEmailVerified) {
      Navigator.pop(context);
      final snackBar = SnackBar(
        backgroundColor: MainAppColorConstants.blueMainColor,
        content: LabelMediumWhiteText(
          text: state.errorMessage,
          textAlign: TextAlign.left,
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else if (state is AuthSignInLoadingState) {
      final dynamic alertDialog = AlertDialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: LoadingAnimationWidget.hexagonDots(
          color: Colors.white,
          size: 45,
        ),
        content: const LabelMediumWhiteText(
          text: 'Lütfen Bekleyiniz...',
          textAlign: TextAlign.center,
        ),
      );
      showDialog(context: context, builder: (context) => alertDialog);
    }
  }

  void signInGoogleAuthListenerBloc(context, state) {
    if (state is AuthSignInGoogleAuthError) {
      Navigator.pop(context);
      final snackBar = SnackBar(
        backgroundColor: MainAppColorConstants.blueMainColor,
        content: LabelMediumWhiteText(
          text: state.errorMessage,
          textAlign: TextAlign.left,
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else if (state is AuthSingInGoogleAuthSuccess) {
      Navigator.pop(context);
      loginRouterService.loginLoadingRouterViewNavigatorRouter(context);
    } else if (state is AuthSignInGoogleAuthLoading) {
      final dynamic alertDialog = AlertDialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: LoadingAnimationWidget.hexagonDots(
          color: Colors.white,
          size: 45,
        ),
        content: const LabelMediumWhiteText(
          text: 'Lütfen Bekleyiniz...',
          textAlign: TextAlign.center,
        ),
      );
      showDialog(context: context, builder: (context) => alertDialog);
    }
  }
}
