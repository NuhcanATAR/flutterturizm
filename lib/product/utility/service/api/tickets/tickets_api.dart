class TicketsApiUrl {
  static const String ticketCreateUrl =
      'http://192.168.1.103:3000/ticket-create';
  static const String ticketsFilterUrl =
      'http://192.168.1.103:3000/api/ticketList';
  static const String ticketDatesApiUrl =
      'http://192.168.1.103:3000/api/ticketDateList';

  static Uri getTicketCreateApiUrl() {
    return Uri.parse(ticketCreateUrl);
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
}
