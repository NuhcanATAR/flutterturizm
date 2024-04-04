// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutterturizm/feature/auth/login/widget/emailinput_widget.dart';
import 'package:flutterturizm/feature/auth/login/widget/emailregisterbutton_widget.dart';
import 'package:flutterturizm/feature/auth/login/widget/forgotpasswordbtn_widget.dart';
import 'package:flutterturizm/feature/auth/login/widget/googleloginbutton_widget.dart';
import 'package:flutterturizm/feature/auth/login/widget/loginbutton_widget.dart';
import 'package:flutterturizm/feature/auth/login/widget/passwordinput_widget.dart';
import 'package:flutterturizm/feature/auth/login/widget/titlesubitle_widget.dart';
import 'package:flutterturizm/product/constant/color_constant.dart';
import 'package:flutterturizm/product/utility/base/auth_base/login_base/login_base.dart';
import 'package:flutterturizm/product/widget/text_widget/label_medium_text.dart';
import 'package:kartal/kartal.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends MainLoginBase<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainAppColorConstants.backgroundColor,
      body: buildBodyWidget,
    );
  }

  Widget get buildBodyWidget => Form(
        key: loginModelService.formLoginKey,
        child: Padding(
          padding: context.padding.low,
          child: Center(
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                // title & sub title
                buildTitleSubTitleWidget,
                // email
                buildEmailInputWidget,
                // password
                buildPasswordInputWidget,
                // forgot password
                buildForgotPasswordWidget,
                // login button
                buildLoginButtonWidget,
                // or
                buildOrWidget,
                // google login
                buildGoogleLogin,
                // email register
                buildEmailRegisterButtonWidget,
              ],
            ),
          ),
        ),
      );

  // title & sub title
  Widget get buildTitleSubTitleWidget => LoginTitleSubTitleWidget(
        dynamicViewExtensions: dynamicViewExtensions,
      );

  // email
  Widget get buildEmailInputWidget => LoginEmailInputWidget(
        loginModelService: loginModelService,
      );

  // password
  Widget get buildPasswordInputWidget => LoginPasswordInputWidget(
        loginModelService: loginModelService,
      );

  //  forgot password
  Widget get buildForgotPasswordWidget => LoginForgotPasswordButtonWidget(
        loginRouterService: loginRouterService,
      );

  // login button
  Widget get buildLoginButtonWidget => LoginButtonWidget(
        signInEmailPasswordListenerBloc: signInEmailPasswordListenerBloc,
        loginModelService: loginModelService,
        dynamicViewExtensions: dynamicViewExtensions,
      );

  // or
  Widget get buildOrWidget => Padding(
        padding: context.padding.verticalLow,
        child: const LabelMediumGreyText(
          text: "veya",
          textAlign: TextAlign.center,
        ),
      );

  // google login
  Widget get buildGoogleLogin => LoginGoogleLoginButtonWidget(
        signInGoogleAuthListenerBloc: signInGoogleAuthListenerBloc,
        dynamicViewExtensions: dynamicViewExtensions,
      );

  // email register
  Widget get buildEmailRegisterButtonWidget => LoginEmailRegisterButtonWidget(
        loginRouterService: loginRouterService,
        dynamicViewExtensions: dynamicViewExtensions,
      );
}
