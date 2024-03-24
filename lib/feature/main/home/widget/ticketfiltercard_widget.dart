import 'package:flutter/material.dart';
import 'package:flutterturizm/feature/main/home/widget/dateinput_widget.dart';
import 'package:flutterturizm/feature/main/home/widget/endlocation_widget.dart';
import 'package:flutterturizm/feature/main/home/widget/filtercardtitle_widget.dart';
import 'package:flutterturizm/feature/main/home/widget/startinglocation_widget.dart';
import 'package:flutterturizm/feature/main/home/widget/ticketfilterbtn_widget.dart';
import 'package:flutterturizm/product/constant/color_constant.dart';
import 'package:flutterturizm/product/model/main_model/home_model/home_model.dart';
import 'package:flutterturizm/product/utility/base/mainbase/home_base/home_base.dart';
import 'package:flutterturizm/product/utility/dynamicextension/dynamicextension.dart';
import 'package:kartal/kartal.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class HomeTicketFilterCardWidget extends StatefulWidget {
  const HomeTicketFilterCardWidget({
    super.key,
    required this.homeModelService,
    required this.dynamicViewExtensions,
    required this.selectTicketDate,
  });

  final HomeModelService homeModelService;
  final DynamicViewExtensions dynamicViewExtensions;

  final dynamic selectTicketDate;

  @override
  State<HomeTicketFilterCardWidget> createState() =>
      _HomeTicketFilterCardWidgetState();
}

class _HomeTicketFilterCardWidgetState
    extends MainHomeBase<HomeTicketFilterCardWidget> {
  @override
  Widget build(BuildContext context) {
    return widget.homeModelService.cityDistricts == null
        ? SizedBox(
            width: dynamicViewExtensions.maxWidth(context),
            height: dynamicViewExtensions.dynamicHeight(context, 0.6),
            child: Container(
              decoration: BoxDecoration(
                color: MainAppColorConstants.blueMainColor,
              ),
              child: Stack(
                children: <Widget>[
                  // card
                  Positioned(
                    left: 25,
                    right: 25,
                    bottom: 10,
                    child: buildEmptyFilterCardWidget,
                  ),
                ],
              ),
            ),
          )
        : SizedBox(
            width: dynamicViewExtensions.maxWidth(context),
            height: dynamicViewExtensions.dynamicHeight(context, 0.6),
            child: Container(
              decoration: BoxDecoration(
                color: MainAppColorConstants.blueMainColor,
              ),
              child: Stack(
                children: <Widget>[
                  // card
                  Positioned(
                    left: 25,
                    right: 25,
                    bottom: 10,
                    child: buildFilterCardWidget,
                  ),
                ],
              ),
            ),
          );
  }

  // empty filter card
  Widget get buildEmptyFilterCardWidget => Card(
        child: SizedBox(
          width: dynamicViewExtensions.maxWidth(context),
          height: dynamicViewExtensions.dynamicHeight(context, 0.4),
          child: Container(
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(4),
              ),
            ),
            child: LoadingAnimationWidget.hexagonDots(
              color: MainAppColorConstants.blueMainColor,
              size: 45,
            ),
          ),
        ),
      );

  // filter card
  Widget get buildFilterCardWidget => Card(
        child: Padding(
          padding: context.padding.normal,
          child: Column(
            children: <Widget>[
              // title
              buildFilterTitleWidget,
              // starting location
              buildStartingLocationWidget,
              // end location
              buildEndLocationWidget,
              // date
              buildDateWidget,
              // ticket filter button
              buildTicketFilterButtonWidget,
            ],
          ),
        ),
      );

  // title
  Widget get buildFilterTitleWidget => FilterCardTitleWidget(
        dynamicViewExtensions: dynamicViewExtensions,
      );

  // starting location
  Widget get buildStartingLocationWidget => FilterCardStartingLocationWidget(
        homeModelService: homeModelService,
      );

  // end location
  Widget get buildEndLocationWidget => FilterCardEndLocationWidget(
        homeModelService: homeModelService,
      );

  // date
  Widget get buildDateWidget => FilterCardDateInputWidget(
        selectTicketDate: selectTicketDate,
        dynamicViewExtensions: dynamicViewExtensions,
        homeModelService: homeModelService,
      );

  // ticket filter button
  Widget get buildTicketFilterButtonWidget => TicketFilterButtonWidget(
        dynamicViewExtensions: dynamicViewExtensions,
      );
}
