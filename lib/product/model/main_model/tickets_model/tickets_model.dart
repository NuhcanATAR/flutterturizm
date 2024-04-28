// ignore_for_file: constant_identifier_names

import 'dart:math';

import 'package:flutterturizm/product/model/main_model/tickets_model/ticketdateslist_model.dart';
import 'package:flutterturizm/product/utility/service/firebase/firebase_service.dart';

enum MyTicketTravelStatusType {
  Active('Aktif'),
  Canceled('Bilet İptal Edildi'),
  OnTheJournery('Yolculukta'),
  OnBreak('Molada'),
  AtDestination('Varış Noktasında'),
  JourneyCompleted('Yolculuk Tamamlandı');

  final String value;
  const MyTicketTravelStatusType(this.value);
}

class TicketsModelService {
  late List<TicketDates> ticketDatesList = [];

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
