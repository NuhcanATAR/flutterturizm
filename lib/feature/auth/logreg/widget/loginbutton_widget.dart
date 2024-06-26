import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutterturizm/product/constant/color_constant.dart';
import 'package:flutterturizm/product/enums/logregpass_enums/logreg_enum/logreg_enum.dart';
import 'package:flutterturizm/product/router/auth_router/logreg_router/logreg_router.dart';
import 'package:flutterturizm/product/utility/dynamicextension/dynamicextension.dart';
import 'package:flutterturizm/product/widget/text_widget/label_medium_text.dart';
import 'package:kartal/kartal.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class LoginButtonWidget extends StatelessWidget {
  const LoginButtonWidget({
    super.key,
    required this.routerService,
    required this.dynamicViewExtensions,
  });

  final LoginRegisterRouterService routerService;
  final DynamicViewExtensions dynamicViewExtensions;

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: GestureDetector(
          onTap: () {
            routerService.loginViewNavigatorRouter(context);
          },
          child: SizedBox(
            width: dynamicViewExtensions.maxWidth(context),
            height: dynamicViewExtensions.dynamicHeight(context, 0.07),
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
  }
}
