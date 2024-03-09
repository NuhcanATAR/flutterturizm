import 'package:flutter/material.dart';
import 'package:flutterturizm/feature/auth/logreg/widget/centerbody_widget.dart';
import 'package:flutterturizm/feature/auth/logreg/widget/footerbuttons_widget.dart';
import 'package:flutterturizm/product/constant/color_constant.dart';
import 'package:flutterturizm/product/constant/image_constant.dart';
import 'package:flutterturizm/product/utility/base/auth_base/logreg_base/logreg_base.dart';

class LoginRegisterView extends StatefulWidget {
  const LoginRegisterView({super.key});

  @override
  State<LoginRegisterView> createState() => _LoginRegisterViewState();
}

class _LoginRegisterViewState extends MainLoginRegisterBase<LoginRegisterView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppLoginRegisterImgConstants.backImg.toJpg),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                MainAppColorConstants.blueMainColor, BlendMode.overlay),
          ),
        ),
        child: Column(
          children: <Widget>[
            // center body
            buildCenterBodyWidget,
            // footer buttons
            buildFooterButtonsWidget,
          ],
        ),
      ),
    );
  }

  // center body
  Widget get buildCenterBodyWidget => CenterBodyWidget(
        maxWidth: maxWidth,
      );

  // footer buttons
  Widget get buildFooterButtonsWidget => FooterButtonsWidget(
        maxWidth: maxWidth,
        dynamicHeight: dynamicHeight,
        routerService: loginRegisterRouterService,
      );
}
