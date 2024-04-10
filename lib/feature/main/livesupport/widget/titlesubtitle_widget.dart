import 'package:flutter/material.dart';
import 'package:flutterturizm/product/enums/main_enums/livesupport_enum/livesupport_enum.dart';
import 'package:flutterturizm/product/widget/text_widget/body_medium_text.dart';
import 'package:flutterturizm/product/widget/text_widget/label_medium_text.dart';
import 'package:kartal/kartal.dart';

class LiveSupportTitleSubTitleWidget extends StatelessWidget {
  const LiveSupportTitleSubTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // title
        Padding(
          padding: context.padding.horizontalLow,
          child: BodyMediumBlackBoldText(
            text: LiveSupportViewStrings.startSupportTitleText.value,
            textAlign: TextAlign.center,
          ),
        ),
        // sub title
        Padding(
          padding: context.padding.low,
          child: LabelMediumBlackText(
            text: LiveSupportViewStrings.startSupportSubTitleText.value,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
