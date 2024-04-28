import 'package:flutter/material.dart';
import 'package:flutterturizm/product/enums/main_enums/profile_enum/profile_enum.dart';
import 'package:flutterturizm/product/widget/text_widget/label_medium_text.dart';
import 'package:kartal/kartal.dart';

class ShareAppCardWidget extends StatelessWidget {
  const ShareAppCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 5,
      ),
      color: Colors.white,
      padding: context.padding.normal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: context.padding.onlyRightLow,
            child: LabelMediumBlackText(
              text: ProfileViewStrings.appShareCardText.value,
              textAlign: TextAlign.center,
            ),
          ),
          const Icon(
            Icons.share,
            color: Colors.black,
            size: 21,
          ),
        ],
      ),
    );
  }
}
