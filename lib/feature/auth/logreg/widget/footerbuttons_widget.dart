import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutterturizm/product/constant/color_constant.dart';
import 'package:flutterturizm/product/constant/icon_constant.dart';
import 'package:flutterturizm/product/enums/logregpass_enums/logreg_enum/logreg_enum.dart';
import 'package:flutterturizm/product/widget/text_widget/label_medium_text.dart';
import 'package:kartal/kartal.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class FooterButtonsWidget extends StatelessWidget {
  const FooterButtonsWidget({
    super.key,
    required this.maxWidth,
    required this.dynamicHeight,
    required this.routerService,
  });

  final dynamic maxWidth;
  final dynamic dynamicHeight;
  final dynamic routerService;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.tight,
      flex: 1,
      child: Padding(
        padding: context.padding.low,
        child: Column(
          children: <Widget>[
            // login button
            buildLoginButtonWidget(context),
            // register emiail & google button
            buildRegisterEmailGoogleButtonWidget(context),
          ],
        ),
      ),
    );
  }

  // login button
  Widget buildLoginButtonWidget(BuildContext context) => FadeInLeft(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: GestureDetector(
            onTap: () {
              routerService.loginViewNavigatorRouter(context);
            },
            child: SizedBox(
              width: maxWidth,
              height: dynamicHeight(0.07),
              child: Container(
                padding: context.padding.low,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: MainAppColorConstants.blueMainColor,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(4),
                  ),
                ),
                child: Row(
                  children: <Widget>[
                    Icon(
                      MdiIcons.login,
                      color: Colors.white,
                      size: 25,
                    ),
                    Expanded(
                      child: LabelMediumWhiteText(
                        text: LoginRegisterViewStrings.loginText.value,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );

  // register email & google button
  Widget buildRegisterEmailGoogleButtonWidget(BuildContext context) =>
      FadeInRight(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: GestureDetector(
            onTap: () {
              routerService.loginRegisterViewNavigatorRouter(context);
            },
            child: SizedBox(
              width: maxWidth,
              height: dynamicHeight(0.07),
              child: Container(
                padding: context.padding.low,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(4),
                  ),
                ),
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 30,
                      height: 30,
                      child: AppLogRegPassIconConstants.googleMailcon.toImg,
                    ),
                    Expanded(
                      child: LabelMediumBlackText(
                        text: LoginRegisterViewStrings.registerText.value,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}
