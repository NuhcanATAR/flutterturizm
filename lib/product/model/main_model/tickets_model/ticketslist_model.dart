class Tickets {
  String? id;
  String? busId;
  String? takeOffCity;
  String? arrivalCity;
  String? ticketType;
  String? ticketFee;
  String? salesStatus;
  String? date;

  Tickets({
    this.id,
    this.busId,
    this.takeOffCity,
    this.arrivalCity,
    this.ticketType,
    this.ticketFee,
    this.salesStatus,
    this.date,
  });

  Tickets.fromJson(Map<String, dynamic> json) {
    id = json['ID'];
    busId = json['BUSID'];
    takeOffCity = json['TAKEOFF'];
    arrivalCity = json['ARRIVAL'];
    ticketType = json['TICKETTYPE'];
    ticketFee = json['TICKETFEE'];
    salesStatus = json['SALESSTATUS'];
    date = json['DATE'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ID'] = id;
    data['BUSID'] = busId;
    data['TAKEOFF'] = takeOffCity;
    data['ARRIVAL'] = arrivalCity;
    data['TICKETTYPE'] = ticketType;
    data['TICKETFEE'] = ticketFee;
    data['SALESSTATUS'] = salesStatus;
    data['DATE'] = date;

    return data;
  }
}
