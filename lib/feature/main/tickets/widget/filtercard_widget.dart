import 'package:flutter/material.dart';
import 'package:flutterturizm/product/constant/color_constant.dart';
import 'package:flutterturizm/product/model/main_model/tickets_model/tickets_model.dart';
import 'package:flutterturizm/product/utility/dynamicextension/dynamicextension.dart';
import 'package:flutterturizm/product/widget/text_widget/label_medium_text.dart';
import 'package:kartal/kartal.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class TicketFilterCardWidget extends StatefulWidget {
  const TicketFilterCardWidget({
    super.key,
    required this.dynamicViewExtensions,
    required this.modelService,
    required this.selectTicketDate,
    required this.fetchTickets,
  });

  final DynamicViewExtensions dynamicViewExtensions;
  final TicketsModelService modelService;
  final dynamic selectTicketDate;
  final dynamic fetchTickets;

  @override
  State<TicketFilterCardWidget> createState() => _TicketFilterCardWidgetState();
}

class _TicketFilterCardWidgetState extends State<TicketFilterCardWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.dynamicViewExtensions.maxWidth(context),
      child: Column(
        children: <Widget>[
          // location select
          buildLocationSelectWidget(context),
          // ticket date
          buildTicketDateWidget(context),
          // filter list button
          buildFilterListButtonWidget(context),
        ],
      ),
    );
  }

  // location select
  Widget buildLocationSelectWidget(BuildContext context) => Row(
        children: <Widget>[
          // start location
          Flexible(
            fit: FlexFit.tight,
            flex: 1,
            child: widget.modelService.cityDistricts == null
                ? const SizedBox()
                : Container(
                    margin: context.padding.horizontalLow,
                    padding: context.padding.horizontalLow,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(4),
                      ),
                    ),
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(
                          MdiIcons.bus,
                          color: Colors.black,
                          size: 18,
                        ),
                      ),
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.transparent,
                        size: 21,
                      ),
                      value: widget.modelService.selectStartCity,
                      hint: const LabelMediumGreyText(
                        text: "Nerden?",
                        textAlign: TextAlign.left,
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          widget.modelService.selectStartCity = value;
                        });
                      },
                      items: widget.modelService.cityDistricts!.keys
                          .map((String city) {
                        return DropdownMenuItem<String>(
                          value: city,
                          child: LabelMediumBlackText(
                            text: city,
                            textAlign: TextAlign.left,
                          ),
                        );
                      }).toList(),
                    ),
                  ),
          ),
          // end location
          Flexible(
            fit: FlexFit.tight,
            flex: 1,
            child: widget.modelService.cityDistricts == null
                ? const SizedBox()
                : Container(
                    margin: context.padding.horizontalLow,
                    padding: context.padding.horizontalLow,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(4),
                      ),
                    ),
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(
                          MdiIcons.bus,
                          color: Colors.black,
                          size: 18,
                        ),
                      ),
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.transparent,
                        size: 21,
                      ),
                      value: widget.modelService.selectEndCity,
                      hint: const LabelMediumGreyText(
                        text: "Nereye?",
                        textAlign: TextAlign.left,
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          widget.modelService.selectEndCity = value;
                        });
                      },
                      items: widget.modelService.cityDistricts!.keys
                          .map((String city) {
                        return DropdownMenuItem<String>(
                          value: city,
                          child: LabelMediumBlackText(
                            text: city,
                            textAlign: TextAlign.left,
                          ),
                        );
                      }).toList(),
                    ),
                  ),
          ),
        ],
      );

  // ticket date
  Widget buildTicketDateWidget(BuildContext context) => Padding(
        padding: context.padding.verticalLow,
        child: GestureDetector(
          onTap: () {
            widget.selectTicketDate(context);
          },
          child: Container(
            margin: context.padding.horizontalLow,
            padding: context.padding.horizontalLow,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.2),
              borderRadius: const BorderRadius.all(
                Radius.circular(4),
              ),
            ),
            child: Padding(
              padding: context.padding.verticalLow,
              child: Row(
                children: <Widget>[
                  Icon(
                    MdiIcons.calendar,
                    color: Colors.black,
                    size: 18,
                  ),
                  Expanded(
                    child: Padding(
                      padding: context.padding.horizontalNormal,
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            width:
                                widget.dynamicViewExtensions.maxWidth(context),
                            child: const LabelMediumBlackText(
                              text: "Bilet Tarihi",
                              textAlign: TextAlign.left,
                            ),
                          ),
                          SizedBox(
                            width:
                                widget.dynamicViewExtensions.maxWidth(context),
                            child: LabelMediumBlackText(
                              text:
                                  "${widget.modelService.ticketDate.day}.${widget.modelService.ticketDate.month}.${widget.modelService.ticketDate.year}",
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  // filter list button
  Widget buildFilterListButtonWidget(BuildContext context) => GestureDetector(
        onTap: () {
          widget.modelService.ticketsList.clear();
          widget.fetchTickets(widget.modelService);
        },
        child: Padding(
          padding: context.padding.verticalLow,
          child: SizedBox(
            width: widget.dynamicViewExtensions.maxWidth(context),
            height: widget.dynamicViewExtensions.dynamicHeight(context, 0.07),
            child: Container(
              decoration: BoxDecoration(
                color: MainAppColorConstants.blueMainColor,
                borderRadius: const BorderRadius.all(
                  Radius.circular(4),
                ),
              ),
              margin: context.padding.horizontalLow,
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    MdiIcons.filterOutline,
                    color: Colors.white,
                    size: 18,
                  ),
                  Padding(
                    padding: context.padding.verticalLow,
                    child: const LabelMediumWhiteText(
                      text: "Biletleri Göster",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
