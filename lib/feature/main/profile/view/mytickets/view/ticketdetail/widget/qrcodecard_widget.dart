import 'package:flutter/material.dart';
import 'package:flutterturizm/product/constant/color_constant.dart';
import 'package:flutterturizm/product/enums/main_enums/ticket_enums/myticket_enums.dart';
import 'package:flutterturizm/product/model/main_model/tickets_model/myticketlist_model.dart';
import 'package:flutterturizm/product/utility/dynamicextension/dynamicextension.dart';
import 'package:flutterturizm/product/widget/text_widget/body_medium_text.dart';
import 'package:kartal/kartal.dart';

class MyTicketQrCodeCardWidget extends StatelessWidget {
  const MyTicketQrCodeCardWidget({
    super.key,
    required this.myTickets,
    required this.dynamicViewExtensions,
  });

  final MyTickets myTickets;
  final DynamicViewExtensions dynamicViewExtensions;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding.low,
      child: Column(
        children: <Widget>[
          // title
          Padding(
            padding: context.padding.verticalLow,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: BodyMediumBlackBoldText(
                    text: MyTicketsViewStrings.qrCodeTitleText.value,
                    textAlign: TextAlign.left,
                  ),
                ),
                Icon(
                  Icons.qr_code,
                  color: MainAppColorConstants.blueMainColor,
                  size: 21,
                ),
              ],
            ),
          ),
          // qr image
          Card(
            child: SizedBox(
              width: dynamicViewExtensions.dynamicWidth(context, 0.3),
              child: Padding(
                padding: context.padding.low,
                child: Image.network(
                  myTickets.qrCode.toString(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
