import 'dart:math';

import 'package:flutterturizm/product/model/main_model/tickets_model/ticketdateslist_model.dart';
import 'package:flutterturizm/product/utility/service/firebase/firebase_service.dart';

class TicketsModelService {
  late List<TicketDates> ticketDatesList = [];

  final String ticketsListUrl = "http://192.168.1.103:3000/api/ticketList";

  final Uri ticketDatesUrl = Uri.parse(
    'http://192.168.1.103/flutterturizmbackend_service/tickets/ticketdatelist.php',
  );

  late bool isTicketLoading;
  late bool isTicketDateLoading;
  late bool isSeatActiveStatus = false;

  late int selectedSeatIndex = -1;
  late int seatValue = 0;

  // city distirct service
  Map<String, List<String>>? cityDistricts;
  String? selectStartCity;
  String? selectEndCity;

  late String apiUrl = 'https://turkiyeapi.dev/api/v1/provinces?name=';

  late DateTime ticketDate = DateTime.now();

  final Random randomKey = Random();

  late int keyValueFirst = randomKey.nextInt(200000);
  late int keyValueSecond = randomKey.nextInt(200000);

  late String qrCodeKey =
      "${keyValueFirst.toString()}${FirebaseService().userID.toString()}${keyValueSecond.toString()}";
}
