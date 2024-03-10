import 'package:flutter/widgets.dart';
import 'package:flutterturizm/product/enums/logregpass_enums/register_enum/register_enum.dart';
import 'package:flutterturizm/product/widget/text_widget/body_medium_text.dart';
import 'package:flutterturizm/product/widget/text_widget/label_medium_text.dart';
import 'package:kartal/kartal.dart';

class RegisterTitleSubTitleWidget extends StatelessWidget {
  const RegisterTitleSubTitleWidget({
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
                text: RegisterViewStrings.registerTitleText.value,
                textAlign: TextAlign.left,
              ),
            ),
          ),
          // sub title
          SizedBox(
            width: maxWidth,
            child: LabelMediumBlackText(
              text: RegisterViewStrings.registerSubTitleText.value,
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }
}
