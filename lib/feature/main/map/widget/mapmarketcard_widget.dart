import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutterturizm/product/constant/color_constant.dart';
import 'package:flutterturizm/product/constant/logo_constant.dart';
import 'package:flutterturizm/product/mixin/mainview_mixin/map_mixin/map_mixin.dart';
import 'package:flutterturizm/product/model/main_model/map_model/map_model.dart';
import 'package:flutterturizm/product/model/main_model/map_model/salepoints_model.dart';
import 'package:flutterturizm/product/utility/dynamicextension/dynamicextension.dart';
import 'package:kartal/kartal.dart';
import 'package:latlong2/latlong.dart';

class MapMarkerCardWidget extends StatelessWidget with MapMixin {
  const MapMarkerCardWidget({
    super.key,
    required this.salePoints,
    required this.dynamicViewExtensions,
    required this.modelService,
  });

  final List<SalePointsModel> salePoints;
  final DynamicViewExtensions dynamicViewExtensions;
  final MapModelService modelService;

  @override
  Widget build(BuildContext context) {
    return MarkerLayer(
      markers: salePoints.map((point) {
        return Marker(
          width: 50.0,
          height: 50.0,
          point: LatLng(point.latitude ?? 0, point.longitude ?? 0),
          child: GestureDetector(
            onTap: () {
              branchCardDialog(
                point,
                context,
                dynamicViewExtensions,
                modelService,
              );
            },
            child: Container(
              padding: context.padding.low,
              decoration: BoxDecoration(
                color: MainAppColorConstants.blueMainColor,
                borderRadius: const BorderRadius.all(
                  Radius.circular(124),
                ),
                border: Border.all(
                  color: MainAppColorConstants.blueMainColor,
                  width: 1,
                ),
              ),
              child: AppLogoImgConstants.appLogoBlue.toImg,
            ),
          ),
        );
      }).toList(),
    );
  }
}
