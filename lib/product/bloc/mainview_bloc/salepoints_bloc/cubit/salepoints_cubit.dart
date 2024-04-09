import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterturizm/product/model/main_model/map_model/map_model.dart';
import 'package:flutterturizm/product/model/main_model/map_model/salepoints_model.dart';
import 'package:flutterturizm/product/utility/service/api/sellermap/sellermap_api.dart';
import 'package:http/http.dart' as http;

class SalePointsCubit extends Cubit<List<SalePointsModel>> {
  SalePointsCubit() : super([]);

  late MapModelService salePointsModel = MapModelService();

  Future<void> fetchSalePoints() async {
    try {
      emit([]);

      final response = await http.get(
        SellerMapApiUrl.getSellerMapApiUrl(),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        emit(
          data.map((item) => SalePointsModel.fromJson(item)).toList(),
        );
      } else {
        throw Exception('Satış Noktaları Yüklenmedi');
      }
    } catch (e) {
      throw Exception('Satış Noktaları Yüklenmedi');
    }
  }
}
