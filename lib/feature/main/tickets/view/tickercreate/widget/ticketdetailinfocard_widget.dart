import 'package:flutter/material.dart';
import 'package:flutterturizm/product/enums/main_enums/ticket_enums/ticketcreate_enums.dart';
import 'package:flutterturizm/product/model/main_model/tickets_model/ticketdateslist_model.dart';
import 'package:flutterturizm/product/model/main_model/tickets_model/ticketslist_model.dart';
import 'package:flutterturizm/product/utility/dynamicextension/dynamicextension.dart';
import 'package:flutterturizm/product/widget/text_widget/label_medium_text.dart';
import 'package:kartal/kartal.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class TicketDetailInformationCardWidget extends StatelessWidget {
  const TicketDetailInformationCardWidget({
    super.key,
    required this.ticket,
    required this.ticketDates,
    required this.dynamicViewExtensions,
  });

  final Tickets ticket;
  final TicketDates ticketDates;
  final DynamicViewExtensions dynamicViewExtensions;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding.verticalMedium,
      child: Row(
        children: <Widget>[
          // ticket title & date
          Expanded(
            flex: 2,
            child: Column(
              children: <Widget>[
                // title
                Padding(
                  padding: context.padding.onlyBottomLow,
                  child: SizedBox(
                    width: dynamicViewExtensions.maxWidth(context),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          MdiIcons.bus,
                          color: Colors.black,
                          size: 20,
                        ),
                        Expanded(
                          child: Padding(
                            padding: context.padding.onlyLeftLow,
                            child: LabelMediumBlackBoldText(
                              text: ticket.ticketType.toString(),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // ticket date
                Padding(
                  padding: context.padding.onlyBottomLow,
                  child: SizedBox(
                    width: dynamicViewExtensions.maxWidth(context),
                    child: Row(
                      children: <Widget>[
                        const Icon(
                          Icons.date_range_outlined,
                          color: Colors.black,
                          size: 18,
                        ),
                        Expanded(
                          child: Padding(
                            padding: context.padding.onlyLeftLow,
                            child: LabelMediumBlackText(
                              text:
                                  "${ticketDates.day}.${ticketDates.month}.${ticketDates.year}",
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // ticket hours
                Padding(
                  padding: context.padding.onlyBottomLow,
                  child: SizedBox(
                    width: dynamicViewExtensions.maxWidth(context),
                    child: Row(
                      children: <Widget>[
                        const Icon(
                          Icons.timelapse_outlined,
                          color: Colors.black,
                          size: 18,
                        ),
                        Expanded(
                          child: Padding(
                            padding: context.padding.onlyLeftLow,
                            child: LabelMediumBlackText(
                              text: "${ticketDates.hour}:${ticketDates.minute}",
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // ticket price
          Flexible(
            fit: FlexFit.tight,
            flex: 1,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: context.padding.onlyBottomLow,
                  child: LabelMediumBlackText(
                    text: TicketCreateViewStrings.ticketTotalPriceText.value,
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: context.padding.onlyBottomLow,
                  child: LabelMediumBlackBoldText(
                    text: "${ticket.ticketPrice.toString()}₺",
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
