import 'package:flutter/material.dart';
import 'package:flutterturizm/product/model/main_model/tickets_model/ticketdateslist_model.dart';
import 'package:flutterturizm/product/model/main_model/tickets_model/tickets_model.dart';
import 'package:flutterturizm/product/utility/base/mainbase/tickets_base/tickets_base.dart';
import 'package:flutterturizm/product/widget/text_widget/label_medium_text.dart';
import 'package:kartal/kartal.dart';

import '../../../../../../product/constant/color_constant.dart';

class SeatSelectCardWidget extends StatefulWidget {
  const SeatSelectCardWidget({
    super.key,
    required this.ticketDates,
    required this.modelService,
  });

  final TicketDates ticketDates;
  final TicketsModelService modelService;

  @override
  State<SeatSelectCardWidget> createState() => _SeatSelectCardWidgetState();
}

class _SeatSelectCardWidgetState extends MainTicketsBase<SeatSelectCardWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: dynamicViewExtensions.maxWidth(context),
      height: dynamicViewExtensions.dynamicHeight(context, 0.4),
      child: Padding(
        padding: context.padding.horizontalLow,
        child: Column(
          children: <Widget>[
            // left
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child: Column(
                children: <Widget>[
                  // left seat
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 1,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        for (int i = 1; i <= 10; i++)
                          FutureBuilder<bool>(
                            future: purchasedTickets(
                              widget.ticketDates,
                              i,
                              widget.modelService,
                            ),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return GestureDetector(
                                  onTap: () {},
                                  child: SizedBox(
                                    width: dynamicViewExtensions.dynamicWidth(
                                      context,
                                      0.2,
                                    ),
                                    child: Container(
                                      alignment: Alignment.center,
                                      padding: const EdgeInsets.all(10),
                                      margin: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        color: Colors.grey.withOpacity(0.4),
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(4),
                                        ),
                                      ),
                                      child: LabelMediumWhiteText(
                                        text: i.toString(),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                );
                              } else if (snapshot.hasError) {
                                return GestureDetector(
                                  onTap: () {},
                                  child: SizedBox(
                                    width: dynamicViewExtensions.dynamicWidth(
                                      context,
                                      0.2,
                                    ),
                                    child: Container(
                                      alignment: Alignment.center,
                                      padding: const EdgeInsets.all(10),
                                      margin: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        color:
                                            Colors.redAccent.withOpacity(0.4),
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(4),
                                        ),
                                      ),
                                      child: LabelMediumWhiteText(
                                        text: i.toString(),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                );
                              } else {
                                if (snapshot.data == true) {
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        if (widget.modelService
                                                .selectedSeatIndex ==
                                            i - 1) {
                                          // Kullanıcı zaten seçilmiş bir koltuğu tekrar tıkladı, seçimi iptal et
                                          widget.modelService
                                              .selectedSeatIndex = -1;
                                          widget.modelService.seatValue = 0;
                                        } else {
                                          // Yeni bir koltuk seçildi
                                          widget.modelService
                                              .selectedSeatIndex = i - 1;
                                          widget.modelService.seatValue = i;
                                        }
                                      });
                                    },
                                    child: SizedBox(
                                      width: dynamicViewExtensions.dynamicWidth(
                                        context,
                                        0.2,
                                      ),
                                      child: Container(
                                        alignment: Alignment.center,
                                        padding: const EdgeInsets.all(10),
                                        margin: const EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          color: MainAppColorConstants
                                              .blueMainColor
                                              .withOpacity(0.7),
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(4),
                                          ),
                                        ),
                                        child: LabelMediumWhiteText(
                                          text: widget.modelService
                                                      .selectedSeatIndex ==
                                                  i - 1
                                              ? '$i. Koltuk Seçildi'
                                              : i.toString(),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  );
                                } else {
                                  return GestureDetector(
                                    onTap: () {},
                                    child: SizedBox(
                                      width: dynamicViewExtensions.dynamicWidth(
                                        context,
                                        0.2,
                                      ),
                                      child: Container(
                                        alignment: Alignment.center,
                                        padding: const EdgeInsets.all(10),
                                        margin: const EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                            color: MainAppColorConstants
                                                .blueMainColor
                                                .withOpacity(0.7),
                                            width: 0.7,
                                          ),
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(4),
                                          ),
                                        ),
                                        child: LabelMediumMainColorText(
                                          text: i.toString(),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                              }
                            },
                          ),
                      ],
                    ),
                  ),
                  // right seat
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 1,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        for (int i = 11; i <= 20; i++)
                          FutureBuilder<bool>(
                            future: purchasedTickets(
                              widget.ticketDates,
                              i,
                              widget.modelService,
                            ),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return GestureDetector(
                                  onTap: () {},
                                  child: SizedBox(
                                    width: dynamicViewExtensions.dynamicWidth(
                                      context,
                                      0.2,
                                    ),
                                    child: Container(
                                      alignment: Alignment.center,
                                      padding: const EdgeInsets.all(10),
                                      margin: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        color: Colors.grey.withOpacity(0.4),
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(4),
                                        ),
                                      ),
                                      child: LabelMediumWhiteText(
                                        text: i.toString(),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                );
                              } else if (snapshot.hasError) {
                                return GestureDetector(
                                  onTap: () {},
                                  child: SizedBox(
                                    width: dynamicViewExtensions.dynamicWidth(
                                      context,
                                      0.2,
                                    ),
                                    child: Container(
                                      alignment: Alignment.center,
                                      padding: const EdgeInsets.all(10),
                                      margin: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        color:
                                            Colors.redAccent.withOpacity(0.4),
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(4),
                                        ),
                                      ),
                                      child: LabelMediumWhiteText(
                                        text: i.toString(),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                );
                              } else {
                                if (snapshot.data == true) {
                                  return GestureDetector(
                                    onTap: () {
                                      setState(
                                        () {
                                          if (widget.modelService
                                                  .selectedSeatIndex ==
                                              i - 1) {
                                            // Kullanıcı zaten seçilmiş bir koltuğu tekrar tıkladı, seçimi iptal et
                                            widget.modelService
                                                .selectedSeatIndex = -1;
                                            widget.modelService.seatValue = i;
                                          } else {
                                            // Yeni bir koltuk seçildi
                                            widget.modelService
                                                .selectedSeatIndex = i - 1;
                                            widget.modelService.seatValue = i;
                                          }
                                        },
                                      );
                                    },
                                    child: SizedBox(
                                      width: dynamicViewExtensions.dynamicWidth(
                                        context,
                                        0.2,
                                      ),
                                      child: Container(
                                        alignment: Alignment.center,
                                        padding: const EdgeInsets.all(10),
                                        margin: const EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          color: MainAppColorConstants
                                              .blueMainColor
                                              .withOpacity(0.7),
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(4),
                                          ),
                                        ),
                                        child: LabelMediumWhiteText(
                                          text: widget.modelService
                                                      .selectedSeatIndex ==
                                                  i - 1
                                              ? '$i. Koltuk Seçildi'
                                              : i.toString(), // Eğer koltuk seçildiyse 'Koltuk Seçildi' yazsın, aksi halde koltuk numarasını göstersin,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  );
                                } else {
                                  return GestureDetector(
                                    onTap: () {},
                                    child: SizedBox(
                                      width: dynamicViewExtensions.dynamicWidth(
                                        context,
                                        0.2,
                                      ),
                                      child: Container(
                                        alignment: Alignment.center,
                                        padding: const EdgeInsets.all(10),
                                        margin: const EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                            color: MainAppColorConstants
                                                .blueMainColor
                                                .withOpacity(0.7),
                                            width: 0.7,
                                          ),
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(4),
                                          ),
                                        ),
                                        child: LabelMediumMainColorText(
                                          text: i.toString(),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                              }
                            },
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(
              flex: 1,
            ),
            // right
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  for (int i = 21; i <= 30; i++)
                    FutureBuilder<bool>(
                      future: purchasedTickets(
                        widget.ticketDates,
                        i,
                        widget.modelService,
                      ),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return GestureDetector(
                            onTap: () {},
                            child: SizedBox(
                              width: dynamicViewExtensions.dynamicWidth(
                                context,
                                0.2,
                              ),
                              child: Container(
                                alignment: Alignment.center,
                                padding: const EdgeInsets.all(10),
                                margin: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.4),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(4),
                                  ),
                                ),
                                child: LabelMediumWhiteText(
                                  text: i.toString(),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          );
                        } else if (snapshot.hasError) {
                          return GestureDetector(
                            onTap: () {},
                            child: SizedBox(
                              width: dynamicViewExtensions.dynamicWidth(
                                context,
                                0.2,
                              ),
                              child: Container(
                                alignment: Alignment.center,
                                padding: const EdgeInsets.all(10),
                                margin: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: Colors.redAccent.withOpacity(0.4),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(4),
                                  ),
                                ),
                                child: LabelMediumWhiteText(
                                  text: i.toString(),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          );
                        } else {
                          if (snapshot.data == true) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (widget.modelService.selectedSeatIndex ==
                                      i - 1) {
                                    // Kullanıcı zaten seçilmiş bir koltuğu tekrar tıkladı, seçimi iptal et
                                    widget.modelService.selectedSeatIndex = -1;
                                    widget.modelService.seatValue = i;
                                  } else {
                                    // Yeni bir koltuk seçildi
                                    widget.modelService.selectedSeatIndex =
                                        i - 1;
                                    widget.modelService.seatValue = i;
                                  }
                                });
                              },
                              child: SizedBox(
                                width: dynamicViewExtensions.dynamicWidth(
                                  context,
                                  0.2,
                                ),
                                child: Container(
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.all(10),
                                  margin: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    color: MainAppColorConstants.blueMainColor
                                        .withOpacity(0.7),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(4),
                                    ),
                                  ),
                                  child: LabelMediumWhiteText(
                                    text: widget.modelService
                                                .selectedSeatIndex ==
                                            i - 1
                                        ? '$i. Koltuk Seçildi'
                                        : i.toString(), // Eğer koltuk seçildiyse 'Koltuk Seçildi' yazsın, aksi halde koltuk numarasını göstersin,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            );
                          } else {
                            return GestureDetector(
                              onTap: () {},
                              child: SizedBox(
                                width: dynamicViewExtensions.dynamicWidth(
                                  context,
                                  0.2,
                                ),
                                child: Container(
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.all(10),
                                  margin: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                      color: MainAppColorConstants.blueMainColor
                                          .withOpacity(0.7),
                                      width: 0.7,
                                    ),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(4),
                                    ),
                                  ),
                                  child: LabelMediumMainColorText(
                                    text: i.toString(),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            );
                          }
                        }
                      },
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
