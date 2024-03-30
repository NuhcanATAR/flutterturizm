import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutterturizm/product/constant/color_constant.dart';
import 'package:flutterturizm/product/model/main_model/tickets_model/ticketdateslist_model.dart';
import 'package:flutterturizm/product/model/main_model/tickets_model/ticketslist_model.dart';
import 'package:flutterturizm/product/utility/base/mainbase/tickets_base/tickets_base.dart';
import 'package:flutterturizm/product/widget/text_widget/body_medium_text.dart';
import 'package:flutterturizm/product/widget/text_widget/label_medium_text.dart';
import 'package:kartal/kartal.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class TicketCreateView extends StatefulWidget {
  const TicketCreateView({
    super.key,
    required this.ticket,
    required this.ticketDates,
  });

  final Tickets ticket;
  final TicketDates ticketDates;

  @override
  State<TicketCreateView> createState() => _TicketCreateViewState();
}

class _TicketCreateViewState extends MainTicketsBase<TicketCreateView> {
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
          // footer
          buildFooterWidget,
        ],
      ),
    );
  }

  // top
  Widget get buildTopWidget => Flexible(
        fit: FlexFit.tight,
        flex: 2,
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
        flex: 6,
        child: Padding(
          padding: context.padding.low,
          child: ListView(
            children: <Widget>[
              // ticket detail information
              // seat select card
              //
            ],
          ),
        ),
      );

  // footer
  Widget get buildFooterWidget => Flexible(
        fit: FlexFit.tight,
        flex: 1,
        child: Padding(
          padding: context.padding.low,
          child: Row(
            children: <Widget>[
              // ticket total price
              Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: Padding(
                  padding: context.padding.low,
                  child: LabelMediumBlackBoldText(
                    text: "${widget.ticket.ticketPrice.toString()}₺",
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              // ticket create button
              Expanded(
                flex: 3,
                child: Container(
                  margin: context.padding.verticalLow,
                  padding: context.padding.horizontalMedium,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: MainAppColorConstants.blueMainColor,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(4),
                    ),
                  ),
                  child: const LabelMediumWhiteText(
                    text: "Bileti Oluştur",
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
