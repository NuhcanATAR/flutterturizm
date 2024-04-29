import 'package:flutter/material.dart';
import 'package:flutterturizm/product/model/main_model/tickets_model/myticketlist_model.dart';
import 'package:flutterturizm/product/utility/dynamicextension/dynamicextension.dart';
import 'package:kartal/kartal.dart';

import '../../../../../../../../product/constant/color_constant.dart';
import '../../../../../../../../product/widget/text_widget/body_medium_text.dart';

class MyTicketSeatNumberCardWidget extends StatelessWidget {
  const MyTicketSeatNumberCardWidget({
    super.key,
    required this.myTickets,
    required this.dynamicViewExtensions,
  });

  final MyTickets myTickets;
  final DynamicViewExtensions dynamicViewExtensions;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        // seat number card
        Card(
          child: SizedBox(
            width: dynamicViewExtensions.dynamicWidth(context, 0.3),
            height: dynamicViewExtensions.dynamicHeight(context, 0.15),
            child: Container(
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(4),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  // icon
                  Container(
                    padding: context.padding.normal,
                    decoration: BoxDecoration(
                      color: MainAppColorConstants.blueMainColor,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(124),
                      ),
                    ),
                    child: const Icon(
                      Icons.chair,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                  // text
                  Padding(
                    padding: context.padding.verticalLow,
                    child: BodyMediumBlackText(
                      text: "Koltuk\n${myTickets.seatNumber.toString()}",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
