import 'package:flutter/material.dart';
import 'package:flutterturizm/product/constant/color_constant.dart';
import 'package:flutterturizm/product/widget/text_widget/body_medium_text.dart';
import 'package:flutterturizm/product/widget/text_widget/label_medium_text.dart';
import 'package:kartal/kartal.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class TicketListLoadingWidget extends StatelessWidget {
  const TicketListLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding.low,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // image
          LoadingAnimationWidget.hexagonDots(
            color: MainAppColorConstants.blueMainColor,
            size: 55,
          ),
          // title
          Padding(
            padding: context.padding.onlyTopLow,
            child: const BodyMediumBlackBoldText(
              text: "Biletler Yükleniyor",
              textAlign: TextAlign.center,
            ),
          ),
          // sub title
          Padding(
            padding: context.padding.onlyTopLow,
            child: const LabelMediumGreyText(
              text: "Lütfen Bekleyiniz...",
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
