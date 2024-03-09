import 'package:flutter/material.dart';
import 'package:flutterturizm/product/constant/color_constant.dart';
import 'package:flutterturizm/product/constant/logo_constant.dart';
import 'package:flutterturizm/product/utility/base/auth_base/login_base/login_base.dart';
import 'package:kartal/kartal.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends MainLoginBase<SplashView> {
  @override
  void initState() {
    super.initState();
    controlSplashGoogleAuthUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainAppColorConstants.blueMainColor,
      body: buildBodyWidget(context),
    );
  }

  Widget buildBodyWidget(BuildContext context) => Center(
        child: Padding(
          padding: context.padding.high,
          child: AppLogoImgConstants.appLogoTextBlue.toImg,
        ),
      );
}
