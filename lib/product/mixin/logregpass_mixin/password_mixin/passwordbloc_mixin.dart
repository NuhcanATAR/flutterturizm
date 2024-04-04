import 'package:flutter/material.dart';
import 'package:flutterturizm/product/bloc/logregpass_bloc/password_bloc/state/state.dart';
import 'package:flutterturizm/product/constant/color_constant.dart';
import 'package:flutterturizm/product/model/auth_model/password_model/password_model.dart';
import 'package:flutterturizm/product/widget/text_widget/label_medium_text.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

mixin AuthPasswordResetBlocMixin {
  // model service
  PasswordModelService passwordModelService = PasswordModelService();
  void sendMailResetPasswordListenerBLoc(context, state) {
    if (state is SendMailSuccess) {
      Navigator.pop(context);
      final AlertDialog alertDialog = AlertDialog(
        title: Icon(
          MdiIcons.check,
          color: MainAppColorConstants.blueMainColor,
          size: 45,
        ),
        content: LabelMediumBlackText(
          text: state.message,
          textAlign: TextAlign.center,
        ),
      );
      showDialog(context: context, builder: (context) => alertDialog);
      passwordModelService.emailController.clear();
    } else if (state is SendMailError) {
      Navigator.pop(context);
      final snackBar = SnackBar(
        backgroundColor: MainAppColorConstants.blueMainColor,
        content: LabelMediumWhiteText(
          text: state.errorMessage,
          textAlign: TextAlign.left,
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else if (state is AuthPasswordLoading) {
      final AlertDialog alertDialog = AlertDialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: LoadingAnimationWidget.hexagonDots(
          color: Colors.white,
          size: 45,
        ),
        content: const LabelMediumWhiteText(
          text: "Lütfen Bekleyiniz...",
          textAlign: TextAlign.center,
        ),
      );
      showDialog(context: context, builder: (context) => alertDialog);
    }
  }
}
