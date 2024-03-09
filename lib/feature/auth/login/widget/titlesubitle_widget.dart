import 'package:flutter/material.dart';
import 'package:flutterturizm/product/enums/logregpass_enums/login_enum/login_enum.dart';
import 'package:flutterturizm/product/widget/text_widget/body_medium_text.dart';
import 'package:flutterturizm/product/widget/text_widget/label_medium_text.dart';
import 'package:kartal/kartal.dart';

class LoginTitleSubTitleWidget extends StatelessWidget {
  const LoginTitleSubTitleWidget({
    super.key,
    required this.maxWidth,
  });
  final dynamic maxWidth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding.verticalMedium,
      child: Column(
        children: <Widget>[
          // title
          SizedBox(
            width: maxWidth,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: BodyMediumBlackBoldText(
                text: LoginViewStrings.loginTitleText.value,
                textAlign: TextAlign.left,
              ),
            ),
          ),
          // sub title
          SizedBox(
            width: maxWidth,
            child: LabelMediumBlackText(
              text: LoginViewStrings.loginSubTitleText.value,
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }
}
