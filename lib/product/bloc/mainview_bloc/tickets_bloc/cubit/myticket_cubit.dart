import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterturizm/product/model/main_model/tickets_model/myticketlist_model.dart';
import 'package:flutterturizm/product/model/main_model/tickets_model/tickets_model.dart';
import 'package:flutterturizm/product/utility/exception/service_exceptions/service_exceptions.dart';
import 'package:flutterturizm/product/utility/service/api/tickets/tickets_api.dart';
import 'package:http/http.dart' as http;

class MyTicketsCubit extends Cubit<List<MyTickets>> {
  MyTicketsCubit() : super([]);

  TicketsModelService modelService = TicketsModelService();

  Future<void> fetchMyTickets(int statusValue) async {
    try {
      modelService.isTicketLoading = true;
      emit([]);

      final response =
          await http.get(TicketsApiUrl.getMyTicketsApiUrl(statusValue));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        emit(data.map((data) => MyTickets.fromJson(data)).toList());
      } else {
        throw ServiceExceptions('hATA');
      }
    } catch (e) {
      throw Exception("Hata");
    } finally {
      modelService.isTicketLoading = false;
    }
  }

  bool get isLoading => modelService.isTicketLoading;
}
