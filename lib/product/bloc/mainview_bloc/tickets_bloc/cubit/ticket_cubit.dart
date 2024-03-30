import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterturizm/product/model/main_model/tickets_model/tickets_model.dart';
import 'package:flutterturizm/product/model/main_model/tickets_model/ticketslist_model.dart';
import 'package:http/http.dart' as http;

class TicketsCubit extends Cubit<List<Tickets>> {
  TicketsCubit() : super([]);

  TicketsModelService modelService = TicketsModelService();

  Future<void> fetchTickets(
      String startCity, String endCity, DateTime ticketDate) async {
    try {
      modelService.isTicketLoading = true;
      emit([]);

      String month = ticketDate.month.toString().padLeft(2, '0');
      String formattedTicketDate =
          "${ticketDate.day}.$month.${ticketDate.year}";

      final response = await http.get(
        Uri.parse(
          "http://192.168.1.103:3000/api/ticketList?takeOff=$startCity&arrival=$endCity&ticketdate=$formattedTicketDate",
        ),
      );

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        emit(data.map((item) => Tickets.fromJson(item)).toList());
      } else {
        throw Exception('Failed to load tickets');
      }
    } catch (e) {
      throw Exception('Failed to load tickets');
    } finally {
      modelService.isTicketLoading = false;
    }
  }

  bool get isLoading => modelService.isTicketLoading;
}
