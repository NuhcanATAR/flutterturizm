import 'package:flutter/material.dart';
import 'package:flutterturizm/product/enums/main_enums/ticket_enums/ticketcreate_enums.dart';
import 'package:flutterturizm/product/utility/dynamicextension/dynamicextension.dart';
import 'package:flutterturizm/product/widget/text_widget/label_medium_text.dart';
import 'package:kartal/kartal.dart';

class TicketCreateSuccessQrCodeCardWidget extends StatelessWidget {
  const TicketCreateSuccessQrCodeCardWidget({
    super.key,
    required this.dynamicViewExtensions,
    required this.qrCodeUrl,
  });

  final DynamicViewExtensions dynamicViewExtensions;
  final String qrCodeUrl;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: context.padding.low,
        child: Column(
          children: <Widget>[
            // title
            Padding(
              padding: context.padding.verticalNormal,
              child: Row(
                children: <Widget>[
                  const Icon(
                    Icons.qr_code,
                    color: Colors.black,
                    size: 18,
                  ),
                  Expanded(
                    child: Padding(
                      padding: context.padding.onlyLeftLow,
                      child: LabelMediumBlackText(
                        text: TicketCreateViewStrings
                            .ticketQrCodeCardTitleText.value,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // qr code
            SizedBox(
              width: dynamicViewExtensions.dynamicWidth(
                context,
                0.25,
              ),
              child: Image.network(
                qrCodeUrl.toString(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
