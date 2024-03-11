import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutterturizm/feature/main/connection/connectionerror_view.dart';
import 'package:flutterturizm/product/constant/color_constant.dart';
import 'package:flutterturizm/product/enums/main_enums/bottommenu_enum/bottommenu_enum.dart';
import 'package:flutterturizm/product/widget/text_widget/body_medium_text.dart';
import 'package:flutterturizm/product/widget/text_widget/label_medium_text.dart';
import 'package:kartal/kartal.dart';

class BottomMenuRouterService {
  // connection error view router
  void connectionErrorViewNavigatoRouter(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ConnectionErrorView(),
      ),
    );
  }

  // exit dialog
  Future<bool> exitWarningDialog(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: BodyMediumBlackBoldText(
          text: BottomMenuViewStrings.exitDialogTitleText.value,
          textAlign: TextAlign.center,
        ),
        content: LabelMediumBlackText(
          text: BottomMenuViewStrings.exitDialogSubTitleText.value,
          textAlign: TextAlign.center,
        ),
        actionsPadding: context.padding.normal,
        actions: [
          Row(
            children: <Widget>[
              // yes
              Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: GestureDetector(
                  onTap: () {
                    exit(0);
                  },
                  child: Container(
                    margin: context.padding.onlyRightLow,
                    padding: context.padding.low,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: MainAppColorConstants.blueMainColor,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(4),
                      ),
                    ),
                    child: const LabelMediumWhiteText(
                      text: "Evet",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              // no
              Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    margin: context.padding.onlyRightLow,
                    padding: context.padding.low,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: MainAppColorConstants.blueMainColor,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(4),
                      ),
                    ),
                    child: const LabelMediumWhiteText(
                      text: "Hayır",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
