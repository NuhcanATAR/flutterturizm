import 'package:flutterturizm/product/model/main_model/tickets_model/ticketslist_model.dart';

class TicketsModelService {
  late List<Tickets> ticketsList = [];

  final Uri ticketsListUrl = Uri.parse(
    'http://192.168.1.103/flutterturizmbackend_service/tickets/ticketslist.php',
  );

  late List<Tickets> tempTicketsList = [];

  // city distirct service
  Map<String, List<String>>? cityDistricts;
  String? selectStartCity;
  String? selectEndCity;

  late String apiUrl = 'https://turkiyeapi.dev/api/v1/provinces?name=';

  late DateTime ticketDate = DateTime.now();
}
