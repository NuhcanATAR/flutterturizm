// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterturizm/feature/auth/password/widget/emailinput_widget.dart';
import 'package:flutterturizm/feature/auth/password/widget/sendmailbutton_widget.dart';
import 'package:flutterturizm/feature/auth/password/widget/titlesubtitle_widget.dart';
import 'package:flutterturizm/product/bloc/logregpass_bloc/password_bloc/cubit/cubit.dart';
import 'package:flutterturizm/product/bloc/logregpass_bloc/password_bloc/state/state.dart';
import 'package:flutterturizm/product/constant/color_constant.dart';
import 'package:flutterturizm/product/utility/base/auth_base/password_base/password_base.dart';
import 'package:flutterturizm/product/widget/text_widget/label_medium_text.dart';
import 'package:kartal/kartal.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends MainPasswordBase<ForgotPasswordView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainAppColorConstants.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: MainAppColorConstants.blueMainColor,
            size: 20,
          ),
        ),
        title: const LabelMediumMainColorText(
          text: "Şifremi Unuttum!",
          textAlign: TextAlign.center,
        ),
      ),
      body: buildBodyWidget,
    );
  }

  // body
  Widget get buildBodyWidget =>
      BlocConsumer<AuthPasswordCubit, AuthPasswordResetMainState>(
        listener: sendMailResetPasswordListenerBLoc,
        builder: (context, state) {
          return Form(
            key: passwordModelService.formPasswordKey,
            child: Padding(
              padding: context.padding.low,
              child: Column(
                children: <Widget>[
                  // title & sub title
                  buildTitleSubTitleWidget,
                  // email input
                  buildEmailInputWidget,
                  // send mail button
                  buildSendMailButtonWidget,
                ],
              ),
            ),
          );
        },
      );

  // title & sub title
  Widget get buildTitleSubTitleWidget => PasswordTitleSubTitleWidget(
        dynamicViewExtensions: dynamicViewExtensions,
      );

  // email input
  Widget get buildEmailInputWidget => PasswordEmailInputWidget(
        passwordModelService: passwordModelService,
      );

  // send mail button
  Widget get buildSendMailButtonWidget => PasswordResetEmailButtonWidget(
        dynamicViewExtensions: dynamicViewExtensions,
        passwordModelService: passwordModelService,
      );
}
