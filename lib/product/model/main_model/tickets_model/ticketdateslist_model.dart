class TicketDates {
  int? id;
  int? ticketId;
  int? hour;
  int? minute;
  int? day;
  int? month;
  int? year;
  int? seatStatus;

  TicketDates({
    this.id,
    this.ticketId,
    this.hour,
    this.minute,
    this.day,
    this.month,
    this.year,
    this.seatStatus,
  });

  TicketDates.fromJson(Map<String, dynamic> json) {
    id = json['ID'];
    ticketId = json['TICKETID'];
    hour = json['HOUR'];
    minute = json['MINUTE'];
    day = json['DAY'];
    month = json['MONTH'];
    year = json['YEAR'];
    seatStatus = json['SEATSTATUS'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ID'] = id;
    data['TICKETID'] = ticketId;
    data['HOUR'] = hour;
    data['MINUTE'] = minute;
    data['DAY'] = day;
    data['MONTH'] = month;
    data['YEAR'] = year;
    data['SEATSTATUS'] = seatStatus;
    return data;
  }
}
