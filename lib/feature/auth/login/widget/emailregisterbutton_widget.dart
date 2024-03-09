import 'package:flutter/material.dart';
import 'package:flutterturizm/product/enums/logregpass_enums/login_enum/login_enum.dart';
import 'package:flutterturizm/product/widget/text_widget/label_medium_text.dart';
import 'package:kartal/kartal.dart';

import '../../../../product/constant/color_constant.dart';

class LoginEmailRegisterButtonWidget extends StatelessWidget {
  const LoginEmailRegisterButtonWidget({
    super.key,
    required this.loginRouterService,
    required this.maxWidth,
    required this.dynamicHeight,
  });
  final dynamic loginRouterService;
  final dynamic maxWidth;
  final dynamic dynamicHeight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding.verticalLow,
      child: GestureDetector(
        onTap: () {
          loginRouterService.loginRegisterViewNavigatorRouter(context);
        },
        child: SizedBox(
          width: maxWidth,
          height: dynamicHeight(0.07),
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: MainAppColorConstants.blueMainColor,
                width: 0.7,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(4),
              ),
            ),
            padding: context.padding.horizontalLow,
            child: LabelMediumMainColorText(
              text: LoginViewStrings.loginRegisterButtonText.value,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
