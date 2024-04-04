import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:flutterturizm/product/enums/main_enums/home_enum/home_enum.dart';
import 'package:flutterturizm/product/model/main_model/tickets_model/tickets_model.dart';
import 'package:flutterturizm/product/utility/dynamicextension/dynamicextension.dart';
import 'package:flutterturizm/product/widget/text_widget/label_medium_text.dart';
import 'package:kartal/kartal.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class FilterCardDateInputWidget extends StatefulWidget {
  const FilterCardDateInputWidget({
    super.key,
    required this.dynamicViewExtensions,
    required this.homeModelService,
  });

  final DynamicViewExtensions dynamicViewExtensions;
  final TicketsModelService homeModelService;

  @override
  State<FilterCardDateInputWidget> createState() =>
      _FilterCardDateInputWidgetState();
}

class _FilterCardDateInputWidgetState extends State<FilterCardDateInputWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
              widget.homeModelService.ticketDate = selectedDateTime;
            });
          },
          currentTime: DateTime.now(),
          locale: LocaleType.tr,
        );
      },
      child: Container(
        margin: context.padding.verticalLow,
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
                        width: widget.dynamicViewExtensions.maxWidth(context),
                        child: LabelMediumBlackText(
                          text: HomeViewStrings.ticketDateSelectText.value,
                          textAlign: TextAlign.left,
                        ),
                      ),
                      SizedBox(
                        width: widget.dynamicViewExtensions.maxWidth(context),
                        child: LabelMediumBlackText(
                          text:
                              "${widget.homeModelService.ticketDate.day}.${widget.homeModelService.ticketDate.month}.${widget.homeModelService.ticketDate.year}",
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
    );
  }
}
