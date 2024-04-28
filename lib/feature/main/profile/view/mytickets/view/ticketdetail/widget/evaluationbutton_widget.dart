import 'package:flutter/material.dart';
import 'package:flutterturizm/product/constant/color_constant.dart';
import 'package:flutterturizm/product/enums/main_enums/ticket_enums/myticket_enums.dart';
import 'package:flutterturizm/product/model/main_model/tickets_model/myticketlist_model.dart';
import 'package:flutterturizm/product/router/main_router/profile_router/profile_router.dart';
import 'package:flutterturizm/product/utility/dynamicextension/dynamicextension.dart';
import 'package:flutterturizm/product/widget/text_widget/body_medium_text.dart';
import 'package:kartal/kartal.dart';

class EvaluationButtonWidget extends StatelessWidget {
  const EvaluationButtonWidget({
    super.key,
    required this.myTickets,
    required this.routerService,
    required this.dynamicViewExtensions,
  });

  final MyTickets myTickets;
  final ProfileRouterService routerService;
  final DynamicViewExtensions dynamicViewExtensions;

  @override
  Widget build(BuildContext context) {
    return myTickets.isTicketStatus == 2
        ? const SizedBox()
        : myTickets.isTicketStatus == 4
            ? myTickets.evaluationStatus == true
                ? const SizedBox()
                : Padding(
                    padding: context.padding.verticalMedium,
                    child: GestureDetector(
                      onTap: () {
                        routerService.evaluationCreateViewNavigatorRouter(
                          context,
                          myTickets,
                        );
                      },
                      child: Card(
                        child: SizedBox(
                          height: dynamicViewExtensions.dynamicHeight(
                            context,
                            0.07,
                          ),
                          child: Container(
                            padding: context.padding.low,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: MainAppColorConstants.blueMainColor,
                                width: 1,
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(4),
                              ),
                            ),
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.star,
                                  color: MainAppColorConstants.blueMainColor,
                                  size: 21,
                                ),
                                Expanded(
                                  child: BodyMediumMainColorText(
                                    text: MyTicketsViewStrings
                                        .ticketEvaluationCreateButtonText.value,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
            : const SizedBox();
  }
}
