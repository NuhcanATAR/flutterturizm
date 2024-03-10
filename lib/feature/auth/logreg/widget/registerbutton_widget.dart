import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutterturizm/product/constant/color_constant.dart';
import 'package:flutterturizm/product/enums/logregpass_enums/logreg_enum/logreg_enum.dart';
import 'package:flutterturizm/product/widget/text_widget/label_medium_text.dart';
import 'package:kartal/kartal.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class RegisterButtonWidget extends StatelessWidget {
  const RegisterButtonWidget({
    super.key,
    required this.routerService,
    required this.maxWidth,
    required this.dynamicHeight,
  });

  final dynamic routerService;
  final dynamic maxWidth;
  final dynamic dynamicHeight;

  @override
  Widget build(BuildContext context) {
    return FadeInRight(
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
                  Icon(
                    MdiIcons.account,
                    color: MainAppColorConstants.blueMainColor,
                    size: 25,
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
}
