import 'package:flutter/material.dart';
import 'package:flutterturizm/feature/main/bottommenu/bottommenu_view.dart';
import 'package:flutterturizm/product/constant/color_constant.dart';
import 'package:flutterturizm/product/enums/main_enums/ticket_enums/ticketcreate_enums.dart';
import 'package:flutterturizm/product/utility/dynamicextension/dynamicextension.dart';
import 'package:flutterturizm/product/widget/text_widget/body_medium_text.dart';
import 'package:flutterturizm/product/widget/text_widget/label_medium_text.dart';
import 'package:kartal/kartal.dart';

import '../../../../../../../../product/constant/icon_constant.dart';

class TicketCreateSuccessTopWidget extends StatelessWidget {
  const TicketCreateSuccessTopWidget({
    super.key,
    required this.dynamicViewExtensions,
  });
  final DynamicViewExtensions dynamicViewExtensions;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // image
        SizedBox(
          width: 55,
          height: 55,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  AppTicketsIconsConstants.successIcon.toPng,
                ),
              ),
            ),
          ),
        ),

        // title
        Padding(
          padding: context.padding.verticalNormal,
          child: BodyMediumBlackBoldText(
            text: TicketCreateViewStrings.ticketCreateSuccessTitleText.value,
            textAlign: TextAlign.center,
          ),
        ),

        // sub title
        Padding(
          padding: context.padding.onlyBottomLow,
          child: LabelMediumBlackText(
            text: TicketCreateViewStrings.ticketCreateSuccessSubTitleText.value,
            textAlign: TextAlign.center,
          ),
        ),

        // home view button
        Padding(
          padding: context.padding.verticalMedium,
          child: GestureDetector(
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const BottomMenuView(),
                ),
                (Route<dynamic> route) => false,
              );
            },
            child: SizedBox(
              width: dynamicViewExtensions.maxHeight(context),
              height: dynamicViewExtensions.dynamicHeight(context, 0.07),
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: MainAppColorConstants.blueMainColor,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(4),
                  ),
                ),
                child: LabelMediumWhiteText(
                  text: TicketCreateViewStrings.homeViewButtonText.value,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
