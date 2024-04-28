class MyTickets {
  int? id;
  String? travelStatus;
  String? takeOff;
  String? arrival;
  String? ticketType;
  int? ticketPrice;
  String? createDate;
  String? ticketDate;
  String? userID;
  String? qrCode;
  int? paymentStatus;
  int? seatNumber;
  String? ticketCreateDate;
  int? isTicketStatus;
  bool? evaluationStatus;

  MyTickets({
    this.id,
    this.travelStatus,
    this.takeOff,
    this.arrival,
    this.ticketType,
    this.ticketPrice,
    this.createDate,
    this.ticketDate,
    this.userID,
    this.qrCode,
    this.paymentStatus,
    this.seatNumber,
    this.ticketCreateDate,
    this.isTicketStatus,
    this.evaluationStatus,
  });

  MyTickets.fromJson(Map<String, dynamic> json) {
    id = json['ID'];
    travelStatus = json['TRAVELSTATUS'];
    takeOff = json['TAKEOFF'];
    arrival = json['ARRIVAL'];
    ticketType = json['TICKETTYPE'];
    ticketPrice = json['TICKETPRICE'];
    createDate = json['CREATEDATE'];
    ticketDate = json['TICKETDATE'];
    userID = json['USERID'];
    qrCode = json['QRCODE'];
    paymentStatus = json['PAYMENTSTATUS'];
    seatNumber = json['SEATNUMBER'];
    ticketCreateDate = json['TICKETCREATEDATE'];
    isTicketStatus = json['TICKETSTATUS'];
    evaluationStatus = json['EVALUATION'] == 1 ? true : false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ID'] = id;
    data['TRAVELSTATUS'] = travelStatus;
    data['TAKEOFF'] = takeOff;
    data['ARRIVAL'] = arrival;
    data['TICKETTYPE'] = ticketType;
    data['TICKETPRICE'] = ticketPrice;
    data['CREATEDATE'] = createDate;
    data['TICKETDATE'] = ticketDate;
    data['USERID'] = userID;
    data['QRCODE'] = qrCode;
    data['PAYMENTSTATUS'] = paymentStatus;
    data['SEATNUMBER'] = seatNumber;
    data['TICKETCREATEDATE'] = ticketCreateDate;
    data['TICKETSTATUS'] = isTicketStatus;
    data['EVALUATION'] = evaluationStatus == true ? 1 : 2;
    return data;
  }
}
