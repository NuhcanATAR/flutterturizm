import 'package:flutter/material.dart';
import 'package:flutterturizm/feature/main/bottommenu/bottommenu_view.dart';
import 'package:flutterturizm/product/bloc/logregpass_bloc/register_bloc/state/state.dart';
import 'package:flutterturizm/product/constant/color_constant.dart';
import 'package:flutterturizm/product/model/auth_model/register_model/register_model.dart';

import 'package:flutterturizm/product/widget/text_widget/label_medium_text.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

mixin AuthSignInUpBlocMixin {
  // model service
  RegisterModelService registerModelService = RegisterModelService();
  void signInUpListenerBloc(context, state) {
    if (state is AuthSignInUpSuccess) {
      Navigator.pop(context);
      final AlertDialog alertDialog = AlertDialog(
        title: Icon(
          MdiIcons.check,
          color: MainAppColorConstants.blueMainColor,
          size: 45,
        ),
        content: LabelMediumBlackText(
          text: state.errorMessage,
          textAlign: TextAlign.center,
        ),
      );
      showDialog(context: context, builder: (context) => alertDialog);
      registerModelService.nameController.clear();
      registerModelService.surnameController.clear();
      registerModelService.identificationNumberController.clear();
      registerModelService.phoneNumberController.clear();
      registerModelService.emailController.clear();
      registerModelService.passwordController.clear();
      registerModelService.passwordAgainController.clear();
      registerModelService.isAgreementCheckStatus = false;
    } else if (state is AuthSignInUpEmailAlReadyInUse) {
      Navigator.pop(context);
      final AlertDialog alertDialog = AlertDialog(
        title: Icon(
          MdiIcons.emailOutline,
          color: MainAppColorConstants.blueMainColor,
          size: 45,
        ),
        content: LabelMediumBlackText(
          text: state.errorMessage,
          textAlign: TextAlign.center,
        ),
      );
      showDialog(context: context, builder: (context) => alertDialog);
    } else if (state is AuthSignInUpError) {
      Navigator.pop(context);
      final AlertDialog alertDialog = AlertDialog(
        title: Icon(
          MdiIcons.close,
          color: MainAppColorConstants.blueMainColor,
          size: 45,
        ),
        content: LabelMediumBlackText(
          text: state.errorMessage,
          textAlign: TextAlign.center,
        ),
      );
      showDialog(context: context, builder: (context) => alertDialog);
    } else if (state is AuthSignInUpLoading) {
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

  void signInCompleteListenerBloc(context, state) {
    if (state is AuthSignInUpSuccess) {
      Navigator.pop(context);
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const BottomMenuView(),
        ),
        (Route<dynamic> route) => false,
      );
      registerModelService.nameController.clear();
      registerModelService.surnameController.clear();
      registerModelService.identificationNumberController.clear();
      registerModelService.phoneNumberController.clear();
      registerModelService.emailController.clear();
      registerModelService.passwordController.clear();
      registerModelService.passwordAgainController.clear();
      registerModelService.isAgreementCheckStatus = false;
    } else if (state is AuthSignInUpEmailAlReadyInUse) {
      Navigator.pop(context);
      final AlertDialog alertDialog = AlertDialog(
        title: Icon(
          MdiIcons.emailOutline,
          color: MainAppColorConstants.blueMainColor,
          size: 45,
        ),
        content: LabelMediumBlackText(
          text: state.errorMessage,
          textAlign: TextAlign.center,
        ),
      );
      showDialog(context: context, builder: (context) => alertDialog);
    } else if (state is AuthSignInUpError) {
      Navigator.pop(context);
      final AlertDialog alertDialog = AlertDialog(
        title: Icon(
          MdiIcons.close,
          color: MainAppColorConstants.blueMainColor,
          size: 45,
        ),
        content: LabelMediumBlackText(
          text: state.errorMessage,
          textAlign: TextAlign.center,
        ),
      );
      showDialog(context: context, builder: (context) => alertDialog);
    } else if (state is AuthSignInUpLoading) {
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
