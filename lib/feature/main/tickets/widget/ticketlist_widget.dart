import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterturizm/feature/main/tickets/view/ticketempty_view.dart';
import 'package:flutterturizm/feature/main/tickets/widget/ticketcard_widget.dart';
import 'package:flutterturizm/product/bloc/mainview_bloc/tickets_bloc/cubit/ticket_cubit.dart';
import 'package:flutterturizm/product/model/main_model/tickets_model/tickets_model.dart';
import 'package:flutterturizm/product/model/main_model/tickets_model/ticketslist_model.dart';
import 'package:flutterturizm/product/router/main_router/ticket_router/ticket_router.dart';
import 'package:kartal/kartal.dart';

class FilterTicketListWidget extends StatelessWidget {
  const FilterTicketListWidget({
    super.key,
    required this.modelService,
    required this.routerService,
  });

  final TicketsModelService modelService;
  final TicketRouterService routerService;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<TicketsCubit, List<Tickets>>(
        builder: (context, ticketList) {
          if (ticketList.isEmpty) {
            return const FilterTicketEmptyView();
          } else {
            final cubitTickets = context.watch<TicketsCubit>();
            if (cubitTickets.isLoading == true) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Padding(
                padding: context.padding.low,
                child: ListView.builder(
                  itemCount: ticketList.length,
                  itemBuilder: (BuildContext context, int index) {
                    final Tickets ticket = ticketList[index];
                    return FilterTicketCardWidget(
                      ticket: ticket,
                      routerService: routerService,
                    );
                  },
                ),
              );
            }
          }
        },
      ),
    );
  }
}
