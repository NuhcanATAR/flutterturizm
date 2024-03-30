import 'package:flutter/material.dart';
import 'package:flutterturizm/feature/main/home/view/fastticketfiltering/fastticketfiltering_view.dart';
import 'package:flutterturizm/feature/main/tickets/view/tickercreate/tickercreate_view.dart';
import 'package:flutterturizm/feature/main/tickets/view/ticketdetail/ticketdetail_view.dart';
import 'package:flutterturizm/product/model/main_model/tickets_model/ticketdateslist_model.dart';
import 'package:flutterturizm/product/model/main_model/tickets_model/tickets_model.dart';
import 'package:flutterturizm/product/model/main_model/tickets_model/ticketslist_model.dart';

class TicketRouterService {
  // fast ticket filtering view
  void fastTicketFilteringView(
    BuildContext context,
    TicketsModelService modelService,
    dynamic fetchTickets,
  ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FastTicketFilteringView(
          modelService: modelService,
        ),
      ),
    );
    fetchTickets(modelService);
  }

  // ticket detail view
  void ticketDetailViewNavigatorRouter(BuildContext context, Tickets ticket) {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 500),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = const Offset(1.0, 0.0);
          var end = Offset.zero;
          var curve = Curves.ease;

          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
        pageBuilder: (context, animation, secondaryAnimation) =>
            TicketDetailView(
          ticket: ticket,
        ),
      ),
    );
  }

  // select ticket detail view
  void selectTicketDetailViewNavigatorRouter(
    BuildContext context,
    Tickets ticket,
    TicketDates ticketDates,
  ) {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 500),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = const Offset(1.0, 0.0);
          var end = Offset.zero;
          var curve = Curves.ease;

          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
        pageBuilder: (context, animation, secondaryAnimation) =>
            TicketCreateView(
          ticket: ticket,
          ticketDates: ticketDates,
        ),
      ),
    );
  }
}
