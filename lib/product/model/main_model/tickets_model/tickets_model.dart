import 'package:flutterturizm/product/model/main_model/tickets_model/ticketdateslist_model.dart';
import 'package:flutterturizm/product/model/main_model/tickets_model/ticketslist_model.dart';

class TicketsModelService {
  List<Tickets> ticketList = [];
  late List<TicketDates> ticketDatesList = [];

  final String ticketsListUrl = "http://192.168.1.103:3000/api/ticketList";

  final Uri ticketDatesUrl = Uri.parse(
    'http://192.168.1.103/flutterturizmbackend_service/tickets/ticketdatelist.php',
  );

  late bool isTicketLoading;
  late bool isTicketDateLoading;

  // city distirct service
  Map<String, List<String>>? cityDistricts;
  String? selectStartCity;
  String? selectEndCity;

  late String apiUrl = 'https://turkiyeapi.dev/api/v1/provinces?name=';

  late DateTime ticketDate = DateTime.now();
}
