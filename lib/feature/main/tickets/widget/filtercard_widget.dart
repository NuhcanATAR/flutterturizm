import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:flutterturizm/product/bloc/mainview_bloc/tickets_bloc/cubit/ticket_cubit.dart';
import 'package:flutterturizm/product/constant/color_constant.dart';
import 'package:flutterturizm/product/enums/main_enums/ticket_enums/ticket_enums.dart';
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
  });

  final DynamicViewExtensions dynamicViewExtensions;
  final TicketsModelService modelService;

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
  Widget buildLocationSelectWidget(BuildContext context) => Padding(
        padding: context.padding.onlyTopLow,
        child: Row(
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
                        hint: LabelMediumGreyText(
                          text: TicketViewStrings.ticketTakeOffInputText.value,
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
                        hint: LabelMediumGreyText(
                          text: TicketViewStrings.ticketArrivalInputText.value,
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
        ),
      );

  // ticket date
  Widget buildTicketDateWidget(BuildContext context) => Padding(
        padding: context.padding.verticalLow,
        child: GestureDetector(
          onTap: () {
            DatePicker.showDatePicker(
              context,
              showTitleActions: true,
              onConfirm: (date) {
                final DateTime selectedDateTime = DateTime(
                  date.year,
                  date.month,
                  date.day,
                );

                setState(() {
                  widget.modelService.ticketDate = selectedDateTime;
                });
              },
              currentTime: DateTime.now(),
              locale: LocaleType.tr,
            );
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
                            child: LabelMediumBlackText(
                              text: TicketViewStrings.ticketDateInputText.value,
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
          context.read<TicketsCubit>().fetchTickets(
                widget.modelService.selectStartCity.toString(),
                widget.modelService.selectEndCity.toString(),
                widget.modelService.ticketDate,
              );
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
                    child: LabelMediumWhiteText(
                      text: TicketViewStrings.ticketFilterButtonText.value,
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
