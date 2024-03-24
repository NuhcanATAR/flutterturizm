import 'package:flutter/material.dart';
import 'package:flutterturizm/feature/main/tickets/view/ticketempty_view.dart';
import 'package:flutterturizm/feature/main/tickets/widget/ticketcard_widget.dart';
import 'package:flutterturizm/product/model/main_model/tickets_model/tickets_model.dart';
import 'package:flutterturizm/product/model/main_model/tickets_model/ticketslist_model.dart';
import 'package:kartal/kartal.dart';

class FilterTicketListWidget extends StatelessWidget {
  const FilterTicketListWidget({
    super.key,
    required this.modelService,
  });

  final TicketsModelService modelService;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: modelService.ticketsList.isEmpty
          ? const FilterTicketEmptyView()
          : Padding(
              padding: context.padding.low,
              child: ListView.builder(
                itemCount: modelService.ticketsList.length,
                itemBuilder: (BuildContext context, int index) {
                  Tickets ticket = modelService.ticketsList[index];
                  return FilterTicketCardWidget(
                    ticket: ticket,
                  );
                },
              ),
            ),
    );
  }
}
