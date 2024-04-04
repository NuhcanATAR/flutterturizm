class AdvertsModelService {
  int? id;
  String? img;
  String? url;
  int? urlActive;

  AdvertsModelService({
    this.id,
    this.img,
    this.url,
    this.urlActive,
  });

  AdvertsModelService.fromJson(Map<String, dynamic> json) {
    id = json['ID'];
    img = json['IMG'];
    url = json['URL'];
    urlActive = json['URLACTIVE'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['ID'] = id;
    data['IMG'] = img;
    data['URL'] = url;
    data['URLACTIVE'] = urlActive;
    return data;
  }
}
