import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterturizm/feature/main/map/widget/currentlocationmap_widget.dart';
import 'package:flutterturizm/feature/main/map/widget/standartlocationmap_widget.dart';
import 'package:flutterturizm/product/bloc/mainview_bloc/salepoints_bloc/cubit/salepoints_cubit.dart';
import 'package:flutterturizm/product/constant/color_constant.dart';
import 'package:flutterturizm/product/model/main_model/map_model/salepoints_model.dart';
import 'package:flutterturizm/product/utility/base/mainbase/map_base/map_base.dart';
import 'package:flutterturizm/product/widget/text_widget/label_medium_text.dart';
import 'package:geolocator/geolocator.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MapView extends StatefulWidget {
  const MapView({super.key});

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends MainMapBase<MapView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const LabelMediumMainColorText(
          text: "Satış Noktaları",
          textAlign: TextAlign.center,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: MainAppColorConstants.blueMainColor,
        onPressed: () {
          mapAbout(context);
        },
        child: Icon(
          MdiIcons.help,
          color: Colors.white,
          size: 20,
        ),
      ),
      body: BlocBuilder<SalePointsCubit, List<SalePointsModel>>(
        builder: (context, salePoints) {
          if (salePoints.isNotEmpty) {
            return FutureBuilder(
              future: getCurrentLocation(),
              builder: (BuildContext context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const SizedBox();
                } else if (snapshot.hasError) {
                  return StandartLocationMapWidget(
                    modelService: modelService,
                    salePoints: salePoints,
                    dynamicViewExtensions: dynamicViewExtensions,
                  );
                } else {
                  final Position position = snapshot.data!;
                  return CurrentLocationMapView(
                    position: position,
                    modelService: modelService,
                    salePoints: salePoints,
                    dynamicViewExtensions: dynamicViewExtensions,
                  );
                }
              },
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
