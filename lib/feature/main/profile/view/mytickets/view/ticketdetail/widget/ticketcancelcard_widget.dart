import 'package:flutter/material.dart';
import 'package:flutterturizm/product/enums/main_enums/ticket_enums/myticket_enums.dart';
import 'package:flutterturizm/product/model/main_model/tickets_model/myticketlist_model.dart';
import 'package:flutterturizm/product/widget/text_widget/body_medium_text.dart';
import 'package:kartal/kartal.dart';

class TicketCanceledCardWidget extends StatelessWidget {
  const TicketCanceledCardWidget({
    super.key,
    required this.myTickets,
  });

  final MyTickets myTickets;

  @override
  Widget build(BuildContext context) {
    return myTickets.isTicketStatus == 2
        ? Card(
            child: Container(
              padding: context.padding.low,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.red,
                  width: 1,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(4),
                ),
              ),
              child: Row(
                children: <Widget>[
                  const Icon(
                    Icons.warning_outlined,
                    color: Colors.redAccent,
                    size: 21,
                  ),
                  Expanded(
                    child: BodyMediumRedText(
                      text: MyTicketsViewStrings.ticketCanceledCardText.value,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          )
        : const SizedBox();
  }
}
