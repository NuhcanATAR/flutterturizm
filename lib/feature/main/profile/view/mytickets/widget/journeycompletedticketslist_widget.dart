import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterturizm/feature/main/profile/view/mytickets/view/ticketlistloading_view.dart';
import 'package:flutterturizm/feature/main/profile/view/mytickets/view/ticketnolist_view.dart';
import 'package:flutterturizm/product/bloc/mainview_bloc/tickets_bloc/cubit/myticket_cubit.dart';
import 'package:flutterturizm/product/constant/color_constant.dart';
import 'package:flutterturizm/product/enums/main_enums/ticket_enums/ticket_enums.dart';
import 'package:flutterturizm/product/model/main_model/tickets_model/myticketlist_model.dart';
import 'package:flutterturizm/product/router/main_router/profile_router/profile_router.dart';
import 'package:flutterturizm/product/widget/text_widget/label_medium_text.dart';
import 'package:kartal/kartal.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class JourneyCompletedTicketsListWidget extends StatefulWidget {
  const JourneyCompletedTicketsListWidget({
    super.key,
    required this.routerService,
  });

  final ProfileRouterService routerService;

  @override
  State<JourneyCompletedTicketsListWidget> createState() =>
      _JourneyCompletedTicketsListWidgetState();
}

class _JourneyCompletedTicketsListWidgetState
    extends State<JourneyCompletedTicketsListWidget> {
  @override
  void initState() {
    super.initState();
    context.read<MyTicketsCubit>().fetchMyTickets(4);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding.low,
      child: BlocBuilder<MyTicketsCubit, List<MyTickets>>(
        builder: (context, mytickets) {
          if (mytickets.isEmpty) {
            return const TicketNoListWidget();
          } else {
            final cuibtMyTickets = context.watch<MyTicketsCubit>();
            if (cuibtMyTickets.isLoading == true) {
              return const TicketListLoadingWidget();
            } else {
              return ListView.builder(
                itemCount: mytickets.length,
                itemBuilder: (context, index) {
                  final MyTickets myTickets = mytickets[index];
                  return GestureDetector(
                    onTap: () {
                      widget.routerService.myTicketDetailViewNavigatorRouter(
                        context,
                        myTickets,
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
                                  Expanded(
                                    child: Row(
                                      children: <Widget>[
                                        Icon(
                                          MdiIcons.bus,
                                          color: Colors.black,
                                          size: 20,
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                context.padding.horizontalLow,
                                            child: LabelMediumBlackBoldText(
                                              text: myTickets.ticketType
                                                  .toString(),
                                              textAlign: TextAlign.left,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Flexible(
                                    fit: FlexFit.tight,
                                    flex: 2,
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                context.padding.horizontalLow,
                                            child: LabelMediumBlackText(
                                              text:
                                                  "Oluşturma: ${myTickets.ticketDate.toString()}",
                                              textAlign: TextAlign.right,
                                            ),
                                          ),
                                        ),
                                        const Icon(
                                          Icons.date_range_outlined,
                                          color: Colors.black,
                                          size: 18,
                                        ),
                                      ],
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        LabelMediumBlackBoldText(
                                          text: TicketViewStrings
                                              .ticketTakeOffText.value,
                                          textAlign: TextAlign.center,
                                        ),
                                        LabelMediumBlackText(
                                          text: myTickets.takeOff.toString(),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: context.padding.low,
                                    child: Icon(
                                      Icons.circle,
                                      color:
                                          MainAppColorConstants.blueMainColor,
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
                                            color: MainAppColorConstants
                                                .blueMainColor,
                                            borderRadius:
                                                const BorderRadius.all(
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
                                              "${myTickets.ticketPrice.toString()}₺",
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
                                      color:
                                          MainAppColorConstants.blueMainColor,
                                      size: 11,
                                    ),
                                  ),
                                  Flexible(
                                    fit: FlexFit.tight,
                                    flex: 1,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        LabelMediumBlackBoldText(
                                          text: TicketViewStrings
                                              .ticketArrivalText.value,
                                          textAlign: TextAlign.center,
                                        ),
                                        LabelMediumBlackText(
                                          text: myTickets.arrival.toString(),
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
                },
              );
            }
          }
        },
      ),
    );
  }
}
