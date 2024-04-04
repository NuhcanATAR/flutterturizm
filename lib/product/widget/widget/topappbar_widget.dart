import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutterturizm/product/constant/color_constant.dart';
import 'package:flutterturizm/product/model/main_model/tickets_model/ticketslist_model.dart';
import 'package:flutterturizm/product/widget/text_widget/body_medium_text.dart';
import 'package:flutterturizm/product/widget/text_widget/label_medium_text.dart';
import 'package:kartal/kartal.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class TopAppBarWidget extends StatefulWidget {
  const TopAppBarWidget({
    super.key,
    required this.ticket,
  });

  final Tickets ticket;

  @override
  State<TopAppBarWidget> createState() => _TopAppBarWidgetState();
}

class _TopAppBarWidgetState extends State<TopAppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
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
                        text: "Varış",
                        textAlign: TextAlign.center,
                      ),
                      BodyMediumWhiteBoldText(
                        text: widget.ticket.arrival.toString(),
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
  }
}
