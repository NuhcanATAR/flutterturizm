// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutterturizm/feature/main/map/widget/mapmarketcard_widget.dart';
import 'package:flutterturizm/product/model/main_model/map_model/map_model.dart';
import 'package:flutterturizm/product/model/main_model/map_model/salepoints_model.dart';
import 'package:flutterturizm/product/utility/dynamicextension/dynamicextension.dart';
import 'package:geolocator/geolocator.dart';

class CurrentLocationMapView extends StatelessWidget {
  const CurrentLocationMapView({
    super.key,
    required this.position,
    required this.modelService,
    required this.salePoints,
    required this.dynamicViewExtensions,
  });

  final Position position;
  final MapModelService modelService;
  final List<SalePointsModel> salePoints;
  final DynamicViewExtensions dynamicViewExtensions;

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      mapController: modelService.mapController,
      options: MapOptions(
        center: modelService.userCurrentLocation(position),
        zoom: 13.0,
      ),
      children: [
        TileLayer(
          urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
          subdomains: const ['a', 'b', 'c'],
        ),
        MapMarkerCardWidget(
          salePoints: salePoints,
          dynamicViewExtensions: dynamicViewExtensions,
          modelService: modelService,
        ),
      ],
    );
  }
}
