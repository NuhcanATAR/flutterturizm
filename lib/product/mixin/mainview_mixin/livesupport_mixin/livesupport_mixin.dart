import 'package:flutter/material.dart';
import 'package:flutterturizm/feature/main/bottommenu/bottommenu_view.dart';
import 'package:flutterturizm/product/constant/color_constant.dart';
import 'package:flutterturizm/product/enums/main_enums/livesupport_enum/livesupport_enum.dart';
import 'package:flutterturizm/product/widget/text_widget/body_medium_text.dart';
import 'package:flutterturizm/product/widget/text_widget/label_medium_text.dart';
import 'package:kartal/kartal.dart';

mixin LiveSupportMixin {
  void liveSupportExitDialog(BuildContext context) {
    final AlertDialog alertDialog = AlertDialog(
      title: const Icon(
        Icons.warning_outlined,
        color: Colors.redAccent,
        size: 45,
      ),
      content: BodyMediumBlackText(
        text: LiveSupportViewStrings.liveSupportExitDialogTitleText.value,
        textAlign: TextAlign.center,
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        Padding(
          padding: context.padding.horizontalMedium,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const BottomMenuView(),
                ),
                (Route<dynamic> route) => false,
              );
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateColor.resolveWith(
                (states) => Colors.redAccent,
              ),
            ),
            child: const LabelMediumWhiteText(
              text: "Evet",
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Padding(
          padding: context.padding.horizontalMedium,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateColor.resolveWith(
                (states) => MainAppColorConstants.blueMainColor,
              ),
            ),
            child: const LabelMediumWhiteText(
              text: "Hayır",
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
    showDialog(context: context, builder: (context) => alertDialog);
  }
}
