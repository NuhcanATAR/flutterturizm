class MyTickets {
  // http://192.168.1.103:3000/api/myTicketList?userID=kullanicino
  int? id;
  int? ticketID;
  String? userID;
  String? travelStatus;
  String? qrCode;
  String? paymentStatus;
  int? seatNumber;

  MyTickets({
    this.id,
    this.ticketID,
    this.userID,
    this.travelStatus,
    this.qrCode,
    this.paymentStatus,
    this.seatNumber,
  });

  MyTickets.fromJson(Map<String, dynamic> json) {
    id = json['ID'];
    ticketID = json['TICKETID'];
    userID = json['USERID'];
    travelStatus = json['TRAVELSTATUS'];
    qrCode = json['QRCODE'];
    paymentStatus = json['PAYMENTSTATUS'];
    seatNumber = json['SEATNUMBER'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ID'] = id;
    data['TICKETID'] = ticketID;
    data['USERID'] = userID;
    data['TRAVELSTATUS'] = travelStatus;
    data['QRCODE'] = qrCode;
    data['PAYMENTSTATUS'] = paymentStatus;
    data['SEATNUMBER'] = seatNumber;
    return data;
  }
}
