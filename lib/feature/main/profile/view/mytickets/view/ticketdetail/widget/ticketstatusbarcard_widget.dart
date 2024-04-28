import 'package:flutter/material.dart';
import 'package:flutterturizm/product/constant/color_constant.dart';
import 'package:flutterturizm/product/enums/main_enums/ticket_enums/myticket_enums.dart';
import 'package:flutterturizm/product/model/main_model/tickets_model/myticketlist_model.dart';
import 'package:flutterturizm/product/utility/dynamicextension/dynamicextension.dart';
import 'package:flutterturizm/product/widget/text_widget/body_medium_text.dart';
import 'package:kartal/kartal.dart';

import '../../../../../../../../product/widget/text_widget/label_medium_text.dart';

class TicketStatusBarCardWidget extends StatelessWidget {
  const TicketStatusBarCardWidget({
    super.key,
    required this.myTickets,
    required this.dynamicViewExtensions,
  });

  final MyTickets myTickets;
  final DynamicViewExtensions dynamicViewExtensions;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: dynamicViewExtensions.maxWidth(context),
      height: dynamicViewExtensions.dynamicHeight(context, 0.2),
      child: Padding(
        padding: context.padding.low,
        child: Row(
          children: <Widget>[
            // ticket create status
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: Padding(
                padding: context.padding.low,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    // icon
                    Container(
                      margin: context.padding.onlyBottomLow,
                      padding: context.padding.normal,
                      decoration: BoxDecoration(
                        color: myTickets.isTicketStatus! == 1
                            ? MainAppColorConstants.blueMainColor
                            : myTickets.isTicketStatus! == 2
                                ? Colors.redAccent
                                : myTickets.isTicketStatus! >= 3
                                    ? MainAppColorConstants.blueMainColor
                                    : Colors.redAccent,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(124),
                        ),
                      ),
                      child: const Icon(
                        Icons.location_on,
                        color: Colors.white,
                        size: 21,
                      ),
                    ),
                    // status text
                    LabelMediumBlackBoldText(
                      text: "${MyTicketsViewStrings.ticketStatus1Text.value}\n",
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            // status line
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: Container(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    myTickets.isTicketStatus! == 1
                        ? const BodyMediumMainColorText(
                            text: "------------------------",
                            textAlign: TextAlign.center,
                          )
                        : myTickets.isTicketStatus! == 2
                            ? const BodyMediumRedText(
                                text: "------------------------",
                                textAlign: TextAlign.center,
                              )
                            : myTickets.isTicketStatus! >= 3
                                ? const BodyMediumMainColorText(
                                    text: "------------------------",
                                    textAlign: TextAlign.center,
                                  )
                                : const BodyMediumRedText(
                                    text: "------------------------",
                                    textAlign: TextAlign.center,
                                  ),
                  ],
                ),
              ),
            ),
            // on the journey status
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: Padding(
                padding: context.padding.low,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    // icon
                    Container(
                      margin: context.padding.onlyBottomLow,
                      padding: context.padding.normal,
                      decoration: BoxDecoration(
                        color: myTickets.isTicketStatus! == 2
                            ? Colors.redAccent
                            : myTickets.isTicketStatus! >= 3
                                ? MainAppColorConstants.blueMainColor
                                : Colors.grey,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(124),
                        ),
                      ),
                      child: const Icon(
                        Icons.location_on,
                        color: Colors.white,
                        size: 21,
                      ),
                    ),
                    // status text
                    LabelMediumBlackBoldText(
                      text: "${MyTicketsViewStrings.ticketStatus2Text.value}\n",
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            // status line
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: Container(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    myTickets.isTicketStatus! == 2
                        ? const BodyMediumRedText(
                            text: "------------------------",
                            textAlign: TextAlign.center,
                          )
                        : myTickets.isTicketStatus! >= 3
                            ? const BodyMediumMainColorText(
                                text: "------------------------",
                                textAlign: TextAlign.center,
                              )
                            : const BodyMediumGreyText(
                                text: "------------------------",
                                textAlign: TextAlign.center,
                              ),
                  ],
                ),
              ),
            ),
            // journey completed
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: Padding(
                padding: context.padding.low,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    // icon
                    Container(
                      margin: context.padding.onlyBottomLow,
                      padding: context.padding.normal,
                      decoration: BoxDecoration(
                        color: myTickets.isTicketStatus! == 2
                            ? Colors.redAccent
                            : myTickets.isTicketStatus! > 3
                                ? MainAppColorConstants.blueMainColor
                                : Colors.grey,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(124),
                        ),
                      ),
                      child: const Icon(
                        Icons.location_on,
                        color: Colors.white,
                        size: 21,
                      ),
                    ),
                    // status text
                    LabelMediumBlackBoldText(
                      text: "${MyTicketsViewStrings.ticketStatus3Text.value}\n",
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
