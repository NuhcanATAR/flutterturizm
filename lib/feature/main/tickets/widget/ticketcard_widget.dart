import 'package:flutter/material.dart';
import 'package:flutterturizm/product/constant/color_constant.dart';
import 'package:flutterturizm/product/model/main_model/tickets_model/ticketslist_model.dart';
import 'package:flutterturizm/product/router/main_router/ticket_router/ticket_router.dart';
import 'package:flutterturizm/product/widget/text_widget/label_medium_text.dart';
import 'package:kartal/kartal.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class FilterTicketCardWidget extends StatelessWidget {
  const FilterTicketCardWidget({
    super.key,
    required this.ticket,
    required this.routerService,
  });

  final Tickets ticket;
  final TicketRouterService routerService;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        routerService.ticketDetailViewNavigatorRouter(
          context,
          ticket,
        );
      },
      child: Card(
        child: Padding(
          padding: context.padding.low,
          child: Column(
            children: <Widget>[
              // ticket title
              Padding(
                padding: context.padding.onlyBottomLow,
                child: Row(
                  children: <Widget>[
                    Icon(
                      MdiIcons.bus,
                      color: Colors.black,
                      size: 20,
                    ),
                    Expanded(
                      child: Padding(
                        padding: context.padding.horizontalLow,
                        child: LabelMediumBlackBoldText(
                          text: ticket.ticketType.toString(),
                          textAlign: TextAlign.left,
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
                          const LabelMediumBlackBoldText(
                            text: "Kalkış",
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
                            text: "${ticket.ticketPrice.toString()}₺",
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
                          const LabelMediumBlackBoldText(
                            text: "Varış",
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
      ),
    );
  }
}
