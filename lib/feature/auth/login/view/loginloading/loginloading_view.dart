// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutterturizm/product/constant/color_constant.dart';
import 'package:flutterturizm/product/mixin/logregpass_mixin/login_mixin/loginloading_mixin.dart';
import 'package:flutterturizm/product/widget/text_widget/body_medium_text.dart';
import 'package:flutterturizm/product/widget/text_widget/label_medium_text.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoginLoadingView extends StatelessWidget
    with LoginLoadingRouterViewMixin {
  const LoginLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
        const Duration(
          seconds: 4,
        ), () {
      loginLoadingControl(context);
    });
    return Scaffold(
      backgroundColor: MainAppColorConstants.backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            LoadingAnimationWidget.hexagonDots(
              color: MainAppColorConstants.blueMainColor,
              size: 45,
            ),
            const Padding(
              padding: EdgeInsets.only(
                top: 15,
                bottom: 5,
              ),
              child: BodyMediumBlackBoldText(
                text: "Bilgileriniz Kontrol Ediliyor",
                textAlign: TextAlign.center,
              ),
            ),
            const LabelMediumGreyText(
              text: "Lütfen Bekleyiniz...",
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
