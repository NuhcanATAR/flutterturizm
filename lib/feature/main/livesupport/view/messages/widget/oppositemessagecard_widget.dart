import 'package:flutter/material.dart';
import 'package:flutterturizm/product/model/main_model/livesupport_model/livesupportchat_model.dart';
import 'package:flutterturizm/product/utility/dynamicextension/dynamicextension.dart';
import 'package:flutterturizm/product/widget/text_widget/body_medium_text.dart';
import 'package:flutterturizm/product/widget/text_widget/label_medium_text.dart';
import 'package:kartal/kartal.dart';

class OppositeMessageCardWidget extends StatelessWidget {
  const OppositeMessageCardWidget({
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
            Expanded(
              flex: 2,
              child: Card(
                color: Colors.white,
                child: Padding(
                  padding: context.padding.normal,
                  child: BodyMediumBlackText(
                    text: message.messageText,
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            ),
            const Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: SizedBox(),
            ),
          ],
        ),
        SizedBox(
          width: dynamicViewExtensions.maxWidth(context),
          child: Padding(
            padding: context.padding.horizontalLow,
            child: LabelMediumBlackText(
              text: message.dateTime,
              textAlign: TextAlign.left,
            ),
          ),
        ),
      ],
    );
  }
}
