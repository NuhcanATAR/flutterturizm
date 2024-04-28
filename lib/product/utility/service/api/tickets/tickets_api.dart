import 'package:flutterturizm/product/utility/service/firebase/firebase_service.dart';

class TicketsApiUrl {
  static const String ipV4 = "192.168.1.103:3000";
  static const String ticketCreateUrl = 'http://$ipV4/ticket-create';
  static const String evaluationCreateUrl = 'http://$ipV4/evaluation-create';
  static const String ticketsFilterUrl = 'http://$ipV4/api/ticketList';
  static const String ticketDatesApiUrl = 'http://$ipV4/api/ticketDateList';
  static const String myTicketssApiUrl = 'http://$ipV4/api/myTicketList';

  static Uri getTicketCreateApiUrl() {
    return Uri.parse(ticketCreateUrl);
  }

  static Uri postEvaluationApiUrl() {
    return Uri.parse(evaluationCreateUrl);
  }

  static Uri getTicketDateListApiUrl(int ticketID) {
    return Uri.parse("$ticketDatesApiUrl?ticketId=$ticketID");
  }

  static Uri getTicketFilterListApiUrl(
    String startCity,
    String endCity,
    String formattedTicketDate,
  ) {
    return Uri.parse(
      "$ticketsFilterUrl?takeOff=$startCity&arrival=$endCity&ticketdate=$formattedTicketDate",
    );
  }

  static Uri getMyTicketsApiUrl(int statusValue) {
    return Uri.parse(
      '$myTicketssApiUrl?userID=${FirebaseService().userID.toString()}&ticketStatus=${statusValue.toInt()}',
    );
  }
}
