import 'package:flutter/material.dart';
import 'package:flutterturizm/product/constant/color_constant.dart';
import 'package:flutterturizm/product/model/main_model/livesupport_model/livesupportchat_model.dart';
import 'package:flutterturizm/product/utility/dynamicextension/dynamicextension.dart';
import 'package:flutterturizm/product/widget/text_widget/body_medium_text.dart';
import 'package:flutterturizm/product/widget/text_widget/label_medium_text.dart';
import 'package:kartal/kartal.dart';

class UserMessageCardWidget extends StatelessWidget {
  const UserMessageCardWidget({
    super.key,
    required this.message,
    required this.dynamicViewExtensions,
  });

  final LiveSupportChatModelService message;
  final DynamicViewExtensions dynamicViewExtensions;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            const Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: SizedBox(),
            ),
            Expanded(
              flex: 2,
              child: Card(
                color: MainAppColorConstants.blueMainColor,
                child: Padding(
                  padding: context.padding.normal,
                  child: BodyMediumWhiteText(
                    text: message.messageText,
                    textAlign: TextAlign.right,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          width: dynamicViewExtensions.maxWidth(context),
          child: Padding(
            padding: context.padding.horizontalLow,
            child: LabelMediumBlackText(
              text: message.dateTime,
              textAlign: TextAlign.right,
            ),
          ),
        ),
      ],
    );
  }
}
