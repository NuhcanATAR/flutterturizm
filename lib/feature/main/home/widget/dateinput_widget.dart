import 'package:flutter/material.dart';
import 'package:flutterturizm/product/model/main_model/tickets_model/tickets_model.dart';
import 'package:flutterturizm/product/utility/dynamicextension/dynamicextension.dart';
import 'package:flutterturizm/product/widget/text_widget/label_medium_text.dart';
import 'package:kartal/kartal.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class FilterCardDateInputWidget extends StatelessWidget {
  const FilterCardDateInputWidget({
    super.key,
    required this.selectTicketDate,
    required this.dynamicViewExtensions,
    required this.homeModelService,
  });

  final dynamic selectTicketDate;
  final DynamicViewExtensions dynamicViewExtensions;
  final TicketsModelService homeModelService;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        selectTicketDate(context);
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
                        width: dynamicViewExtensions.maxWidth(context),
                        child: const LabelMediumBlackText(
                          text: "Tarih",
                          textAlign: TextAlign.left,
                        ),
                      ),
                      SizedBox(
                        width: dynamicViewExtensions.maxWidth(context),
                        child: LabelMediumBlackText(
                          text:
                              "${homeModelService.ticketDate.day}.${homeModelService.ticketDate.month}.${homeModelService.ticketDate.year}",
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
