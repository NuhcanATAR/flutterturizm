import 'package:flutter/widgets.dart';

import 'package:flutterturizm/product/constant/color_constant.dart';
import 'package:flutterturizm/product/enums/main_enums/ticket_enums/ticketcreate_enums.dart';
import 'package:flutterturizm/product/mixin/mainview_mixin/ticket/ticket_mixin.dart';
import 'package:flutterturizm/product/model/main_model/tickets_model/ticketdateslist_model.dart';
import 'package:flutterturizm/product/model/main_model/tickets_model/tickets_model.dart';
import 'package:flutterturizm/product/model/main_model/tickets_model/ticketslist_model.dart';
import 'package:flutterturizm/product/utility/dynamicextension/dynamicextension.dart';
import 'package:flutterturizm/product/widget/text_widget/label_medium_text.dart';
import 'package:kartal/kartal.dart';

class TicketCreateFooterButtonWidget extends StatelessWidget with TicketMixin {
  const TicketCreateFooterButtonWidget({
    super.key,
    required this.dynamicViewExtensions,
    required this.ticket,
    required this.ticketDates,
    required this.modelService,
  });

  final DynamicViewExtensions dynamicViewExtensions;
  final Tickets ticket;
  final TicketDates ticketDates;
  final TicketsModelService modelService;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: dynamicViewExtensions.maxWidth(context),
      height: dynamicViewExtensions.dynamicHeight(
        context,
        0.12,
      ),
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
                  text: "${ticket.ticketPrice.toString()}₺",
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            // ticket create button
            Expanded(
              flex: 3,
              child: GestureDetector(
                onTap: () {
                  ticketCreate(
                    context,
                    ticket,
                    ticketDates,
                    modelService,
                  );
                },
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
                  child: LabelMediumWhiteText(
                    text: TicketCreateViewStrings.ticketCreateButtonText.value,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
