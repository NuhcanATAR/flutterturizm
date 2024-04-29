// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterturizm/product/bloc/mainview_bloc/salepoints_bloc/cubit/salepoints_cubit.dart';
import 'package:flutterturizm/product/mixin/mainview_mixin/map_mixin/map_mixin.dart';
import 'package:flutterturizm/product/model/connection_model/connection_model.dart';
import 'package:flutterturizm/product/model/main_model/map_model/map_model.dart';
import 'package:flutterturizm/product/utility/dynamicextension/dynamicextension.dart';
import 'package:geolocator/geolocator.dart';

abstract class MainMapBase<T extends StatefulWidget> extends State<T>
    with MapMixin {
  // model
  MapModelService modelService = MapModelService();

  // extension
  DynamicViewExtensions dynamicViewExtensions = DynamicViewExtensions();

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
    context.read<SalePointsCubit>().fetchSalePoints();
    ConnectionControlModel().checkConnection(context);
  }

  Future<Position> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Konum servisleri etkin değil!');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Konum izni verilmedi!');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception(
        'Konum izni kalıcı olarak reddedildi, ayarlardan açabilirsiniz.',
      );
    }

    return await Geolocator.getCurrentPosition();
  }
}
