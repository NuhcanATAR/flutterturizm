import 'package:flutter/widgets.dart';
import 'package:flutterturizm/product/enums/logregpass_enums/password_enum/password_enum.dart';
import 'package:flutterturizm/product/widget/text_widget/body_medium_text.dart';
import 'package:flutterturizm/product/widget/text_widget/label_medium_text.dart';
import 'package:kartal/kartal.dart';

class PasswordTitleSubTitleWidget extends StatelessWidget {
  const PasswordTitleSubTitleWidget({
    super.key,
    required this.maxWidth,
  });
  final dynamic maxWidth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding.onlyBottomMedium,
      child: Column(
        children: <Widget>[
          // title
          SizedBox(
            width: maxWidth,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: BodyMediumBlackBoldText(
                text: PasswordViewStrings.titleText.value,
                textAlign: TextAlign.left,
              ),
            ),
          ),
          // sub title
          SizedBox(
            width: maxWidth,
            child: LabelMediumBlackText(
              text: PasswordViewStrings.subTitleText.value,
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }
}
