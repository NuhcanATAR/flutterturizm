import 'package:flutter/material.dart';
import 'package:flutterturizm/product/constant/color_constant.dart';
import 'package:flutterturizm/product/enums/main_enums/home_enum/home_enum.dart';
import 'package:flutterturizm/product/model/main_model/tickets_model/tickets_model.dart';
import 'package:flutterturizm/product/router/main_router/ticket_router/ticket_router.dart';
import 'package:flutterturizm/product/utility/dynamicextension/dynamicextension.dart';
import 'package:flutterturizm/product/widget/text_widget/label_medium_text.dart';
import 'package:kartal/kartal.dart';

class TicketFilterButtonWidget extends StatelessWidget {
  const TicketFilterButtonWidget({
    super.key,
    required this.dynamicViewExtensions,
    required this.modelService,
    required this.routerService,
  });

  final DynamicViewExtensions dynamicViewExtensions;
  final TicketRouterService routerService;
  final TicketsModelService modelService;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding.onlyTopLow,
      child: GestureDetector(
        onTap: () {
          routerService.fastTicketFilteringView(
            context,
            modelService,
          );
        },
        child: SizedBox(
          width: dynamicViewExtensions.maxWidth(context),
          height: dynamicViewExtensions.dynamicHeight(context, 0.06),
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: MainAppColorConstants.blueMainColor,
              borderRadius: const BorderRadius.all(
                Radius.circular(4),
              ),
            ),
            child: LabelMediumWhiteText(
              text: HomeViewStrings.ticketFilterButtonText.value,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
