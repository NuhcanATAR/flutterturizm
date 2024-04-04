import 'package:flutter/material.dart';
import 'package:flutterturizm/product/constant/color_constant.dart';
import 'package:flutterturizm/product/enums/main_enums/ticket_enums/ticketcreate_enums.dart';
import 'package:flutterturizm/product/model/main_model/tickets_model/ticketdateslist_model.dart';
import 'package:flutterturizm/product/model/main_model/tickets_model/ticketslist_model.dart';
import 'package:flutterturizm/product/widget/text_widget/label_medium_text.dart';
import 'package:kartal/kartal.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class TicketSuccessTicketDetailCardWidget extends StatelessWidget {
  const TicketSuccessTicketDetailCardWidget({
    super.key,
    required this.ticket,
    required this.ticketDates,
  });

  final Tickets ticket;
  final TicketDates ticketDates;

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
                  Icon(
                    MdiIcons.ticketOutline,
                    color: Colors.black,
                    size: 18,
                  ),
                  Expanded(
                    child: Padding(
                      padding: context.padding.onlyLeftLow,
                      child: LabelMediumBlackText(
                        text: TicketCreateViewStrings
                            .ticketDetailCardTitleText.value,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // ticket detail
            Padding(
              padding: context.padding.low,
              child: Column(
                children: <Widget>[
                  // ticket fee
                  Padding(
                    padding: context.padding.onlyBottomLow,
                    child: Row(
                      children: <Widget>[
                        Icon(
                          MdiIcons.bus,
                          color: Colors.black,
                          size: 20,
                        ),
                        Flexible(
                          fit: FlexFit.tight,
                          flex: 1,
                          child: Padding(
                            padding: context.padding.horizontalLow,
                            child: LabelMediumBlackBoldText(
                              text: TicketCreateViewStrings.ticketFeeText.value,
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: context.padding.horizontalLow,
                            child: LabelMediumBlackBoldText(
                              text: "${ticket.ticketPrice.toString()}₺",
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // ticket detail
                  Padding(
                    padding: context.padding.onlyBottomLow,
                    child: Row(
                      children: <Widget>[
                        // start location
                        Flexible(
                          fit: FlexFit.tight,
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              LabelMediumBlackBoldText(
                                text: TicketCreateViewStrings.takeOffText.value,
                                textAlign: TextAlign.center,
                              ),
                              LabelMediumBlackText(
                                text: ticket.takeOff.toString(),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: context.padding.low,
                          child: Icon(
                            Icons.circle,
                            color: MainAppColorConstants.blueMainColor,
                            size: 11,
                          ),
                        ),
                        // ticket fee
                        Expanded(
                          flex: 2,
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: context.padding.low,
                                margin: context.padding.low,
                                decoration: BoxDecoration(
                                  color: MainAppColorConstants.blueMainColor,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(124),
                                  ),
                                ),
                                child: Icon(
                                  MdiIcons.bus,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                              LabelMediumBlackBoldText(
                                text:
                                    "${ticketDates.day.toString()}.${ticketDates.month.toString()}.${ticketDates.year.toString()} / Saat: ${ticketDates.hour.toString()}:${ticketDates.minute.toString()}",
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                        // end location
                        Padding(
                          padding: context.padding.low,
                          child: Icon(
                            Icons.circle,
                            color: MainAppColorConstants.blueMainColor,
                            size: 11,
                          ),
                        ),
                        Flexible(
                          fit: FlexFit.tight,
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              LabelMediumBlackBoldText(
                                text: TicketCreateViewStrings.arrivalText.value,
                                textAlign: TextAlign.center,
                              ),
                              LabelMediumBlackText(
                                text: ticket.arrival.toString(),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
