import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterturizm/feature/main/profile/view/mytickets/view/ticketdetail/widget/ticketcard_widget.dart';
import 'package:flutterturizm/feature/main/profile/view/mytickets/view/ticketlistloading_view.dart';
import 'package:flutterturizm/feature/main/profile/view/mytickets/view/ticketnolist_view.dart';
import 'package:flutterturizm/product/bloc/mainview_bloc/tickets_bloc/cubit/myticket_cubit.dart';
import 'package:flutterturizm/product/model/main_model/tickets_model/myticketlist_model.dart';
import 'package:flutterturizm/product/router/main_router/profile_router/profile_router.dart';
import 'package:kartal/kartal.dart';

class OnTheJourneyTicketsListWidget extends StatefulWidget {
  const OnTheJourneyTicketsListWidget({
    super.key,
    required this.routerService,
  });

  final ProfileRouterService routerService;

  @override
  State<OnTheJourneyTicketsListWidget> createState() =>
      _OnTheJourneyTicketsListWidgetState();
}

class _OnTheJourneyTicketsListWidgetState
    extends State<OnTheJourneyTicketsListWidget> {
  @override
  void initState() {
    super.initState();
    context.read<MyTicketsCubit>().fetchMyTickets(3);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding.low,
      child: BlocBuilder<MyTicketsCubit, List<MyTickets>>(
        builder: (context, mytickets) {
          if (mytickets.isEmpty) {
            return const TicketNoListWidget();
          } else {
            final cuibtMyTickets = context.watch<MyTicketsCubit>();
            if (cuibtMyTickets.isLoading == true) {
              return const TicketListLoadingWidget();
            } else {
              return ListView.builder(
                itemCount: mytickets.length,
                itemBuilder: (context, index) {
                  final MyTickets myTickets = mytickets[index];
                  return GestureDetector(
                    onTap: () {
                      widget.routerService.myTicketDetailViewNavigatorRouter(
                        context,
                        myTickets,
                      );
                    },
                    child: MyTicketCardWidget(
                      myTickets: myTickets,
                    ),
                  );
                },
              );
            }
          }
        },
      ),
    );
  }
}
