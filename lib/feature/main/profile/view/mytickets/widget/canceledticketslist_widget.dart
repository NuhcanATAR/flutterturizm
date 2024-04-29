import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterturizm/feature/main/profile/view/mytickets/view/ticketdetail/widget/ticketcard_widget.dart';
import 'package:flutterturizm/feature/main/profile/view/mytickets/view/ticketlistloading_view.dart';
import 'package:flutterturizm/product/model/main_model/tickets_model/myticketlist_model.dart';
import 'package:flutterturizm/product/router/main_router/profile_router/profile_router.dart';
import 'package:kartal/kartal.dart';

import '../../../../../../product/bloc/mainview_bloc/tickets_bloc/cubit/myticket_cubit.dart';

class CanceledTicketsListWidget extends StatefulWidget {
  const CanceledTicketsListWidget({
    super.key,
    required this.routerService,
  });

  final ProfileRouterService routerService;

  @override
  State<CanceledTicketsListWidget> createState() =>
      _CanceledTicketsListWidgetState();
}

class _CanceledTicketsListWidgetState extends State<CanceledTicketsListWidget> {
  @override
  void initState() {
    super.initState();
    context.read<MyTicketsCubit>().fetchMyTickets(2);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding.low,
      child: BlocBuilder<MyTicketsCubit, List<MyTickets>>(
        builder: (context, mytickets) {
          if (mytickets.isEmpty) {
            return const Center(
              child: Text("Boş"),
            );
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
