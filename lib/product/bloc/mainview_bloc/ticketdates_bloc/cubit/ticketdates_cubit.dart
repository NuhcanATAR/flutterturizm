import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterturizm/product/model/main_model/tickets_model/ticketdateslist_model.dart';
import 'package:flutterturizm/product/model/main_model/tickets_model/tickets_model.dart';
import 'package:http/http.dart' as http;

class TicketDatesCubit extends Cubit<List<TicketDates>> {
  TicketDatesCubit() : super([]);

  // model service
  TicketsModelService modelService = TicketsModelService();

  Future<void> fetchTicketDates(int ticketID) async {
    try {
      modelService.isTicketDateLoading = true;
      emit([]);

      final response = await http.get(
        Uri.parse('http://192.168.1.103:3000/api/ticketDateList?ticketId=1'),
      );

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        emit(data.map((item) => TicketDates.fromJson(item)).toList());
      } else {
        throw Exception('Failed to load ticket dates');
      }
    } catch (e) {
      throw Exception('Failed to load ticket dates');
    } finally {
      modelService.isTicketDateLoading = false;
    }
  }

  bool get isLoading => modelService.isTicketDateLoading;
}
