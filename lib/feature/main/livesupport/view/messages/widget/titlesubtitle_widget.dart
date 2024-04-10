import 'package:flutter/material.dart';
import 'package:flutterturizm/product/enums/main_enums/livesupport_enum/livesupport_enum.dart';
import 'package:flutterturizm/product/widget/text_widget/label_medium_text.dart';
import 'package:kartal/kartal.dart';

class LiveSupportMessageTitleSubTitleWidget extends StatelessWidget {
  const LiveSupportMessageTitleSubTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding.normal,
      child: Column(
        children: <Widget>[
          Padding(
            padding: context.padding.low,
            child: LabelMediumBlackBoldText(
              text:
                  LiveSupportViewStrings.liveSupportMessageStartTitleText.value,
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: context.padding.horizontalLow,
            child: LabelMediumGreyText(
              text: LiveSupportViewStrings
                  .liveSupportMessageStartSubTitleText.value,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
