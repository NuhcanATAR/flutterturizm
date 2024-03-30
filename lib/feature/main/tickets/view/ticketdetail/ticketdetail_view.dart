import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterturizm/product/bloc/mainview_bloc/ticketdates_bloc/cubit/ticketdates_cubit.dart';
import 'package:flutterturizm/product/constant/color_constant.dart';
import 'package:flutterturizm/product/model/main_model/tickets_model/ticketdateslist_model.dart';
import 'package:flutterturizm/product/model/main_model/tickets_model/ticketslist_model.dart';
import 'package:flutterturizm/product/utility/base/mainbase/tickets_base/tickets_base.dart';
import 'package:flutterturizm/product/widget/text_widget/body_medium_text.dart';
import 'package:flutterturizm/product/widget/text_widget/label_medium_text.dart';
import 'package:kartal/kartal.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class TicketDetailView extends StatefulWidget {
  const TicketDetailView({
    super.key,
    required this.ticket,
  });

  final Tickets ticket;

  @override
  State<TicketDetailView> createState() => _TicketDetailViewState();
}

class _TicketDetailViewState extends MainTicketsBase<TicketDetailView> {
  @override
  void initState() {
    super.initState();

    context.read<TicketDatesCubit>().fetchTicketDates(
          widget.ticket.id as int,
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainAppColorConstants.backgroundColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        titleSpacing: 15,
        automaticallyImplyLeading: false,
        toolbarHeight: dynamicViewExtensions.dynamicHeight(context, 0.1),
        title: Row(
          children: <Widget>[
            SizedBox(
              width: 40,
              height: 40,
              child: Container(
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(4),
                  ),
                ),
                child: Icon(
                  MdiIcons.accountCircleOutline,
                  color: Colors.grey,
                  size: 30,
                ),
              ),
            ),
            // name surname
            Expanded(
              child: Padding(
                padding: context.padding.horizontalLow,
                child: FutureBuilder(
                  future: getUserInformation(),
                  builder: (BuildContext context, snapshot) {
                    if (snapshot.hasError) {
                      return const SizedBox();
                    }

                    if (snapshot.connectionState == ConnectionState.done) {
                      final currentUserValue = snapshot.data;
                      return Column(
                        children: <Widget>[
                          // welcome
                          SizedBox(
                            width: dynamicViewExtensions.maxWidth(context),
                            child: const Padding(
                              padding: EdgeInsets.only(bottom: 3),
                              child: LabelMediumWhiteText(
                                text: "Hoşgeldiniz 👋",
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),
                          // name surname
                          SizedBox(
                            width: dynamicViewExtensions.maxWidth(context),
                            child: Padding(
                              padding: context.padding.onlyBottomLow,
                              child: BodyMediumWhiteBoldText(
                                text:
                                    "${currentUserValue!.name} ${currentUserValue.surname} ",
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),
                        ],
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: context.padding.horizontalNormal,
            child: GestureDetector(
              onTap: () {},
              child: const Icon(
                Icons.notifications_outlined,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          // top
          buildTopWidget,
          // body
          buildBodyWidget,
        ],
      ),
    );
  }

  // top
  Widget get buildTopWidget => Flexible(
        fit: FlexFit.tight,
        flex: 1,
        child: Container(
          color: MainAppColorConstants.blueMainColor,
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: context.padding.normal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                // start location
                Flexible(
                  fit: FlexFit.tight,
                  flex: 1,
                  child: FadeInLeft(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        const LabelMediumWhiteText(
                          text: "Kalkış",
                          textAlign: TextAlign.center,
                        ),
                        BodyMediumWhiteBoldText(
                          text: widget.ticket.takeOff.toString(),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
                // rotation line
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: context.padding.horizontalLow,
                    child: Row(
                      children: <Widget>[
                        Flexible(
                          fit: FlexFit.tight,
                          flex: 1,
                          child: FadeInLeft(
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  MdiIcons.cityVariantOutline,
                                  color: Colors.white,
                                  size: 22,
                                ),
                                Flexible(
                                  fit: FlexFit.tight,
                                  flex: 1,
                                  child: Padding(
                                    padding: context.padding.onlyLeftLow,
                                    child: const LabelMediumWhiteText(
                                      text: "------------",
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Flexible(
                          fit: FlexFit.tight,
                          flex: 1,
                          child: FadeInUp(
                            child: Icon(
                              MdiIcons.bus,
                              color: Colors.white,
                              size: 22,
                            ),
                          ),
                        ),
                        Flexible(
                          fit: FlexFit.tight,
                          flex: 1,
                          child: FadeInRight(
                            child: Row(
                              children: <Widget>[
                                Flexible(
                                  fit: FlexFit.tight,
                                  flex: 1,
                                  child: Padding(
                                    padding: context.padding.onlyRightLow,
                                    child: const LabelMediumWhiteText(
                                      text: "------------",
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                Icon(
                                  MdiIcons.cityVariantOutline,
                                  color: Colors.white,
                                  size: 22,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // end location
                Flexible(
                  fit: FlexFit.tight,
                  flex: 1,
                  child: FadeInRight(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        const LabelMediumWhiteText(
                          text: "Kalkış",
                          textAlign: TextAlign.center,
                        ),
                        BodyMediumWhiteBoldText(
                          text: widget.ticket.takeOff.toString(),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  // body
  Widget get buildBodyWidget => Expanded(
        flex: 3,
        child: Padding(
          padding: context.padding.low,
          child: BlocBuilder<TicketDatesCubit, List<TicketDates>>(
            builder: (context, ticketDatesList) {
              if (ticketDatesList.isEmpty) {
                return const SizedBox();
              } else {
                final cubitTicketDates = context.watch<TicketDatesCubit>();
                if (cubitTicketDates.isLoading == true) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: ticketDatesList.length,
                    itemBuilder: (BuildContext context, index) {
                      TicketDates ticketDates = ticketDatesList[index];
                      return GestureDetector(
                        onTap: () {
                          routerService.selectTicketDetailViewNavigatorRouter(
                            context,
                            widget.ticket,
                            ticketDates,
                          );
                        },
                        child: Card(
                          child: Padding(
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
                                          padding:
                                              context.padding.horizontalLow,
                                          child: const LabelMediumBlackBoldText(
                                            text: "Bilet Ücreti:",
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              context.padding.horizontalLow,
                                          child: LabelMediumBlackBoldText(
                                            text:
                                                "${widget.ticket.ticketPrice.toString()}₺",
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            const LabelMediumBlackBoldText(
                                              text: "Kalkış",
                                              textAlign: TextAlign.center,
                                            ),
                                            LabelMediumBlackText(
                                              text: widget.ticket.takeOff
                                                  .toString(),
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: context.padding.low,
                                        child: Icon(
                                          Icons.circle,
                                          color: MainAppColorConstants
                                              .blueMainColor,
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
                                          color: MainAppColorConstants
                                              .blueMainColor,
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
                                            const LabelMediumBlackBoldText(
                                              text: "Varış",
                                              textAlign: TextAlign.center,
                                            ),
                                            LabelMediumBlackText(
                                              text: widget.ticket.arrival
                                                  .toString(),
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
        ),
      );
}
