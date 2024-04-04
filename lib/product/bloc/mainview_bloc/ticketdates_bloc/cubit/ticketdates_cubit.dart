import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterturizm/product/enums/main_enums/ticket_enums/ticket_enums.dart';
import 'package:flutterturizm/product/model/main_model/tickets_model/ticketdateslist_model.dart';
import 'package:flutterturizm/product/model/main_model/tickets_model/tickets_model.dart';
import 'package:flutterturizm/product/utility/exception/service_exceptions/service_exceptions.dart';
import 'package:flutterturizm/product/utility/service/api/tickets/tickets_api.dart';
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
        TicketsApiUrl.getTicketDateListApiUrl(ticketID),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        emit(data.map((item) => TicketDates.fromJson(item)).toList());
      } else {
        throw ServiceExceptions(
          TicketViewStrings.ticketServiceStatusCodeErrorText.value.toString(),
        );
      }
    } catch (e) {
      throw ServiceExceptions(
        TicketViewStrings.ticketServiceCatchErrorText.value.toString(),
      );
    } finally {
      modelService.isTicketDateLoading = false;
    }
  }

  bool get isLoading => modelService.isTicketDateLoading;
}
