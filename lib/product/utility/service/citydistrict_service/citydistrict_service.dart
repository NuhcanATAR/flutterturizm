// ignore_for_file: avoid_function_literals_in_foreach_calls, avoid_dynamic_calls

import 'dart:convert';
import 'package:http/http.dart' as http;

class CityDistrictService {
  final String apiUrl;

  CityDistrictService(this.apiUrl);

  Future<Map<String, List<String>>> fetchAllCityDistricts() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return parseData(jsonData);
    } else {
      throw CityDistrictException('Şehir ve İlçe Yüklenemedi!');
    }
  }

  Map<String, List<String>> parseData(Map jsonData) {
    final List<dynamic> data = jsonData['data'];
    final Map<String, List<String>> cityDistricts = {};
    data.forEach((province) {
      final String provinceName = province['name'];
      final List<String> districtNames =
          extractDistricts(province['districts']);
      cityDistricts[provinceName] = districtNames;
    });
    return cityDistricts;
  }

  List<String> extractDistricts(List<dynamic> districtData) {
    return districtData.map((district) => district['name'].toString()).toList();
  }
}

class CityDistrictException implements Exception {
  final String message;

  CityDistrictException(this.message);
}
