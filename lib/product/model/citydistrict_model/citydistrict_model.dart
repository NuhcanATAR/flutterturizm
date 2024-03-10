// ignore_for_file: unnecessary_new, unnecessary_this, unnecessary_getters_setters, prefer_collection_literals

import 'dart:convert';

class MainCityDistrict {
  String? _status;
  List<Data>? _data;

  MainCityDistrict({String? status, List<Data>? data}) {
    if (status != null) {
      this._status = status;
    }
    if (data != null) {
      this._data = data;
    }
  }

  String? get status => _status;
  set status(String? status) => _status = status;
  List<Data>? get data => _data;
  set data(List<Data>? data) => _data = data;

  MainCityDistrict.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
    if (json['data'] != null) {
      _data = <Data>[];
      json['data'].forEach((v) {
        _data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this._status;
    if (this._data != null) {
      data['data'] = this._data!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  List<MainCityDistrict> usersFromJson(String jsonString) {
    final parsed = json.decode(jsonString).cast<Map<String, dynamic>>();
    return parsed
        .map<MainCityDistrict>((json) => MainCityDistrict.fromJson(json))
        .toList();
  }
}

class Data {
  int? _id;
  String? _name;
  int? _population;
  int? _area;
  int? _altitude;
  List<int>? _areaCode;
  bool? _isMetropolitan;
  Nuts? _nuts;
  Coordinates? _coordinates;
  Maps? _maps;
  Name? _region;
  List<Districts>? _districts;

  Data(
      {int? id,
      String? name,
      int? population,
      int? area,
      int? altitude,
      List<int>? areaCode,
      bool? isMetropolitan,
      Nuts? nuts,
      Coordinates? coordinates,
      Maps? maps,
      Name? region,
      List<Districts>? districts}) {
    if (id != null) {
      this._id = id;
    }
    if (name != null) {
      this._name = name;
    }
    if (population != null) {
      this._population = population;
    }
    if (area != null) {
      this._area = area;
    }
    if (altitude != null) {
      this._altitude = altitude;
    }
    if (areaCode != null) {
      this._areaCode = areaCode;
    }
    if (isMetropolitan != null) {
      this._isMetropolitan = isMetropolitan;
    }
    if (nuts != null) {
      this._nuts = nuts;
    }
    if (coordinates != null) {
      this._coordinates = coordinates;
    }
    if (maps != null) {
      this._maps = maps;
    }
    if (region != null) {
      this._region = region;
    }
    if (districts != null) {
      this._districts = districts;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get name => _name;
  set name(String? name) => _name = name;
  int? get population => _population;
  set population(int? population) => _population = population;
  int? get area => _area;
  set area(int? area) => _area = area;
  int? get altitude => _altitude;
  set altitude(int? altitude) => _altitude = altitude;
  List<int>? get areaCode => _areaCode;
  set areaCode(List<int>? areaCode) => _areaCode = areaCode;
  bool? get isMetropolitan => _isMetropolitan;
  set isMetropolitan(bool? isMetropolitan) => _isMetropolitan = isMetropolitan;
  Nuts? get nuts => _nuts;
  set nuts(Nuts? nuts) => _nuts = nuts;
  Coordinates? get coordinates => _coordinates;
  set coordinates(Coordinates? coordinates) => _coordinates = coordinates;
  Maps? get maps => _maps;
  set maps(Maps? maps) => _maps = maps;
  Name? get region => _region;
  set region(Name? region) => _region = region;
  List<Districts>? get districts => _districts;
  set districts(List<Districts>? districts) => _districts = districts;

  Data.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _population = json['population'];
    _area = json['area'];
    _altitude = json['altitude'];
    _areaCode = json['areaCode'].cast<int>();
    _isMetropolitan = json['isMetropolitan'];
    _nuts = json['nuts'] != null ? new Nuts.fromJson(json['nuts']) : null;
    _coordinates = json['coordinates'] != null
        ? new Coordinates.fromJson(json['coordinates'])
        : null;
    _maps = json['maps'] != null ? new Maps.fromJson(json['maps']) : null;
    _region = json['region'] != null ? new Name.fromJson(json['region']) : null;
    if (json['districts'] != null) {
      _districts = <Districts>[];
      json['districts'].forEach((v) {
        _districts!.add(new Districts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['population'] = this._population;
    data['area'] = this._area;
    data['altitude'] = this._altitude;
    data['areaCode'] = this._areaCode;
    data['isMetropolitan'] = this._isMetropolitan;
    if (this._nuts != null) {
      data['nuts'] = this._nuts!.toJson();
    }
    if (this._coordinates != null) {
      data['coordinates'] = this._coordinates!.toJson();
    }
    if (this._maps != null) {
      data['maps'] = this._maps!.toJson();
    }
    if (this._region != null) {
      data['region'] = this._region!.toJson();
    }
    if (this._districts != null) {
      data['districts'] = this._districts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Nuts {
  Nuts1? _nuts1;
  Nuts2? _nuts2;
  String? _nuts3;

  Nuts({Nuts1? nuts1, Nuts2? nuts2, String? nuts3}) {
    if (nuts1 != null) {
      this._nuts1 = nuts1;
    }
    if (nuts2 != null) {
      this._nuts2 = nuts2;
    }
    if (nuts3 != null) {
      this._nuts3 = nuts3;
    }
  }

  Nuts1? get nuts1 => _nuts1;
  set nuts1(Nuts1? nuts1) => _nuts1 = nuts1;
  Nuts2? get nuts2 => _nuts2;
  set nuts2(Nuts2? nuts2) => _nuts2 = nuts2;
  String? get nuts3 => _nuts3;
  set nuts3(String? nuts3) => _nuts3 = nuts3;

  Nuts.fromJson(Map<String, dynamic> json) {
    _nuts1 = json['nuts1'] != null ? new Nuts1.fromJson(json['nuts1']) : null;
    _nuts2 = json['nuts2'] != null ? new Nuts2.fromJson(json['nuts2']) : null;
    _nuts3 = json['nuts3'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._nuts1 != null) {
      data['nuts1'] = this._nuts1!.toJson();
    }
    if (this._nuts2 != null) {
      data['nuts2'] = this._nuts2!.toJson();
    }
    data['nuts3'] = this._nuts3;
    return data;
  }
}

class Nuts1 {
  String? _code;
  Name? _name;

  Nuts1({String? code, Name? name}) {
    if (code != null) {
      this._code = code;
    }
    if (name != null) {
      this._name = name;
    }
  }

  String? get code => _code;
  set code(String? code) => _code = code;
  Name? get name => _name;
  set name(Name? name) => _name = name;

  Nuts1.fromJson(Map<String, dynamic> json) {
    _code = json['code'];
    _name = json['name'] != null ? new Name.fromJson(json['name']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this._code;
    if (this._name != null) {
      data['name'] = this._name!.toJson();
    }
    return data;
  }
}

class Name {
  String? _en;
  String? _tr;

  Name({String? en, String? tr}) {
    if (en != null) {
      this._en = en;
    }
    if (tr != null) {
      this._tr = tr;
    }
  }

  String? get en => _en;
  set en(String? en) => _en = en;
  String? get tr => _tr;
  set tr(String? tr) => _tr = tr;

  Name.fromJson(Map<String, dynamic> json) {
    _en = json['en'];
    _tr = json['tr'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['en'] = this._en;
    data['tr'] = this._tr;
    return data;
  }
}

class Nuts2 {
  String? _code;
  String? _name;

  Nuts2({String? code, String? name}) {
    if (code != null) {
      this._code = code;
    }
    if (name != null) {
      this._name = name;
    }
  }

  String? get code => _code;
  set code(String? code) => _code = code;
  String? get name => _name;
  set name(String? name) => _name = name;

  Nuts2.fromJson(Map<String, dynamic> json) {
    _code = json['code'];
    _name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this._code;
    data['name'] = this._name;
    return data;
  }
}

class Coordinates {
  double? _latitude;
  double? _longitude;

  Coordinates({double? latitude, double? longitude}) {
    if (latitude != null) {
      this._latitude = latitude;
    }
    if (longitude != null) {
      this._longitude = longitude;
    }
  }

  double? get latitude => _latitude;
  set latitude(double? latitude) => _latitude = latitude;
  double? get longitude => _longitude;
  set longitude(double? longitude) => _longitude = longitude;

  Coordinates.fromJson(Map<String, dynamic> json) {
    _latitude = json['latitude'];
    _longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['latitude'] = this._latitude;
    data['longitude'] = this._longitude;
    return data;
  }
}

class Maps {
  String? _googleMaps;
  String? _openStreetMap;

  Maps({String? googleMaps, String? openStreetMap}) {
    if (googleMaps != null) {
      this._googleMaps = googleMaps;
    }
    if (openStreetMap != null) {
      this._openStreetMap = openStreetMap;
    }
  }

  String? get googleMaps => _googleMaps;
  set googleMaps(String? googleMaps) => _googleMaps = googleMaps;
  String? get openStreetMap => _openStreetMap;
  set openStreetMap(String? openStreetMap) => _openStreetMap = openStreetMap;

  Maps.fromJson(Map<String, dynamic> json) {
    _googleMaps = json['googleMaps'];
    _openStreetMap = json['openStreetMap'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['googleMaps'] = this._googleMaps;
    data['openStreetMap'] = this._openStreetMap;
    return data;
  }
}

class Districts {
  int? _id;
  String? _name;
  int? _population;
  int? _area;

  Districts({int? id, String? name, int? population, int? area}) {
    if (id != null) {
      this._id = id;
    }
    if (name != null) {
      this._name = name;
    }
    if (population != null) {
      this._population = population;
    }
    if (area != null) {
      this._area = area;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get name => _name;
  set name(String? name) => _name = name;
  int? get population => _population;
  set population(int? population) => _population = population;
  int? get area => _area;
  set area(int? area) => _area = area;

  Districts.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _population = json['population'];
    _area = json['area'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['population'] = this._population;
    data['area'] = this._area;
    return data;
  }
}
