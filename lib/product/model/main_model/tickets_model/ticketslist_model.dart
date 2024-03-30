class Tickets {
  int? id;
  int? busId;
  String? travelStatus;
  String? takeOff;
  String? arrival;
  String? ticketType;
  int? ticketPrice;
  String? createDate;

  Tickets({
    this.id,
    this.busId,
    this.travelStatus,
    this.takeOff,
    this.arrival,
    this.ticketType,
    this.ticketPrice,
    this.createDate,
  });

  Tickets.fromJson(Map<String, dynamic> json) {
    id = json['ID'];
    busId = json['BUSID'];
    travelStatus = json['TRAVELSTATUS'];
    takeOff = json['TAKEOFF'];
    arrival = json['ARRIVAL'];
    ticketType = json['TICKETTYPE'];
    ticketPrice = json['TICKETPRICE'];
    createDate = json['CREATEDATE'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ID'] = id;
    data['BUSID'] = busId;
    data['TRAVELSTATUS'] = travelStatus;
    data['TAKEOFF'] = takeOff;
    data['ARRIVAL'] = arrival;
    data['TICKETTYPE'] = ticketType;
    data['TICKETPRICE'] = ticketPrice;
    data['CREATEDATE'] = createDate;
    return data;
  }
}
