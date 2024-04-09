class SalePointsModel {
  int? id;
  String? branchName;
  String? branchAuthority;
  String? phoneNumber;
  String? emailAdress;
  String? city;
  String? district;
  String? country;
  String? workingHours;
  String? serviceName;
  String? googleMapsUrl;
  double? latitude;
  double? longitude;
  String? date;

  SalePointsModel({
    this.id,
    this.branchName,
    this.branchAuthority,
    this.phoneNumber,
    this.emailAdress,
    this.city,
    this.district,
    this.country,
    this.workingHours,
    this.serviceName,
    this.googleMapsUrl,
    this.latitude,
    this.longitude,
    this.date,
  });

  SalePointsModel.fromJson(Map<String, dynamic> json) {
    id = json['ID'];
    branchName = json['BRANCHNAME'];
    branchAuthority = json['BRANCHAUTHORITY'];
    phoneNumber = json['PHONENUMBER'];
    emailAdress = json['EMAILADRESS'];
    city = json['CITY'];
    district = json['DISTRICT'];
    country = json['COUNTRY'];
    workingHours = json['WORKINHOURS'];
    serviceName = json['SERVICENAME'];
    googleMapsUrl = json['GOOGLEMAPSURL'];
    latitude = json['LATITUDE'];
    longitude = json['LONGITUDE'];
    date = json['DATE'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ID'] = id;
    data['BRANCHNAME'] = branchName;
    data['BRANCHAUTHORITY'] = branchAuthority;
    data['PHONENUMBER'] = phoneNumber;
    data['EMAILADRESS'] = emailAdress;
    data['CITY'] = city;
    data['DISTRICT'] = district;
    data['COUNTRY'] = country;
    data['WORKINHOURS'] = workingHours;
    data['SERVICENAME'] = serviceName;
    data['GOOGLEMAPSURL'] = googleMapsUrl;
    data['LATITUDE'] = latitude;
    data['LONGITUDE'] = longitude;
    data['DATE'] = date;
    return data;
  }
}
