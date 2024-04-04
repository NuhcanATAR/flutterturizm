import 'package:flutterturizm/product/model/main_model/tickets_model/ticketdateslist_model.dart';
import 'package:flutterturizm/product/model/main_model/tickets_model/ticketslist_model.dart';

abstract class TicketCreateState {}

class TicketCreateInitial extends TicketCreateState {}

class TicketCreateLoading extends TicketCreateState {}

class TicketCreateSuccess extends TicketCreateState {
  final String qrCodeUrl;
  final Tickets tickets;
  final TicketDates ticketDates;

  TicketCreateSuccess(
    this.qrCodeUrl,
    this.tickets,
    this.ticketDates,
  );
}

class TicketCreateError extends TicketCreateState {
  final String value;

  TicketCreateError(this.value);
}
