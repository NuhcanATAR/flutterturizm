import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../../product/enums/logregpass_enums/login_enum/login_enum.dart';
import '../../../../product/widget/text_widget/label_medium_text.dart';

class LoginForgotPasswordButtonWidget extends StatelessWidget {
  const LoginForgotPasswordButtonWidget({
    super.key,
    required this.loginRouterService,
  });
  final dynamic loginRouterService;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding.verticalNormal,
      child: Container(
        alignment: Alignment.centerRight,
        child: GestureDetector(
          onTap: () {
            loginRouterService.loginForgotPassowrdNavigatorRouter(context);
          },
          child: LabelMediumMainColorText(
            text: LoginViewStrings.loginForgotPasswordInputText.value,
            textAlign: TextAlign.left,
          ),
        ),
      ),
    );
  }
}
