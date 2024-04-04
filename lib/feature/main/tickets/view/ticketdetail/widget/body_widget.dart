import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterturizm/feature/main/tickets/view/ticketdetail/widget/ticketdatecards_widget.dart';
import 'package:flutterturizm/product/bloc/mainview_bloc/ticketdates_bloc/cubit/ticketdates_cubit.dart';
import 'package:flutterturizm/product/model/main_model/tickets_model/ticketslist_model.dart';
import 'package:flutterturizm/product/router/main_router/ticket_router/ticket_router.dart';
import 'package:kartal/kartal.dart';

import '../../../../../../product/model/main_model/tickets_model/ticketdateslist_model.dart';

class TicketDetailBodyWidget extends StatelessWidget {
  const TicketDetailBodyWidget({
    super.key,
    required this.ticket,
    required this.routerService,
  });

  final Tickets ticket;
  final TicketRouterService routerService;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Padding(
        padding: context.padding.low,
        child: BlocBuilder<TicketDatesCubit, List<TicketDates>>(
          builder: (context, ticketDatesList) {
            if (ticketDatesList.isEmpty) {
              return const SizedBox();
            } else {
              final cubitTicketDates = context.watch<TicketDatesCubit>();
              if (cubitTicketDates.isLoading == true) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: ticketDatesList.length,
                  itemBuilder: (BuildContext context, index) {
                    final TicketDates ticketDates = ticketDatesList[index];
                    return TicketDateCardsWidget(
                      ticket: ticket,
                      ticketDates: ticketDates,
                      routerService: routerService,
                    );
                  },
                );
              }
            }
          },
        ),
      ),
    );
  }
}
