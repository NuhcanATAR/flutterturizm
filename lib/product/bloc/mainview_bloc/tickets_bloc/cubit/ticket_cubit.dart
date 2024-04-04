import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterturizm/product/enums/main_enums/ticket_enums/ticket_enums.dart';
import 'package:flutterturizm/product/model/main_model/tickets_model/tickets_model.dart';
import 'package:flutterturizm/product/model/main_model/tickets_model/ticketslist_model.dart';
import 'package:flutterturizm/product/utility/exception/service_exceptions/service_exceptions.dart';
import 'package:flutterturizm/product/utility/service/api/tickets/tickets_api.dart';
import 'package:http/http.dart' as http;

class TicketsCubit extends Cubit<List<Tickets>> {
  TicketsCubit() : super([]);

  TicketsModelService modelService = TicketsModelService();

  Future<void> fetchTickets(
    String startCity,
    String endCity,
    DateTime ticketDate,
  ) async {
    try {
      modelService.isTicketLoading = true;
      emit([]);

      late final String month = ticketDate.month.toString().padLeft(2, '0');
      late final String formattedTicketDate =
          "${ticketDate.day}.$month.${ticketDate.year}";

      final response = await http.get(
        TicketsApiUrl.getTicketFilterListApiUrl(
          startCity,
          endCity,
          formattedTicketDate,
        ),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        emit(data.map((item) => Tickets.fromJson(item)).toList());
      } else {
        throw ServiceExceptions(
          TicketViewStrings.ticketServiceStatusCodeErrorText.value.toString(),
        );
      }
    } catch (e) {
      throw Exception(
        TicketViewStrings.ticketServiceCatchErrorText.value.toString(),
      );
    } finally {
      modelService.isTicketLoading = false;
    }
  }

  bool get isLoading => modelService.isTicketLoading;
}
