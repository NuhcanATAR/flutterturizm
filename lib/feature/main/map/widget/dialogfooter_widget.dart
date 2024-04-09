import 'package:flutter/material.dart';
import 'package:flutterturizm/product/enums/main_enums/map_enum/map_enum.dart';
import 'package:flutterturizm/product/mixin/mainview_mixin/map_mixin/map_mixin.dart';
import 'package:flutterturizm/product/model/main_model/map_model/map_model.dart';
import 'package:flutterturizm/product/model/main_model/map_model/salepoints_model.dart';
import 'package:flutterturizm/product/utility/dynamicextension/dynamicextension.dart';
import 'package:flutterturizm/product/widget/text_widget/label_medium_text.dart';
import 'package:kartal/kartal.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../../product/constant/color_constant.dart';

class DialogFooterButtonsWidget extends StatelessWidget with MapMixin {
  const DialogFooterButtonsWidget({
    super.key,
    required this.point,
    required this.modelService,
    required this.dynamicViewExtensions,
  });

  final SalePointsModel point;
  final MapModelService modelService;
  final DynamicViewExtensions dynamicViewExtensions;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding.low,
      child: Row(
        children: <Widget>[
          // google maps
          buildGoogleMapsButtonWidget(context),
          // phone call
          buildPhoneCallButtonWidget(context),
        ],
      ),
    );
  }

  // google maps button
  Widget buildGoogleMapsButtonWidget(BuildContext context) => Flexible(
        fit: FlexFit.tight,
        flex: 1,
        child: GestureDetector(
          onTap: () {
            googleMapLocation(
              point.googleMapsUrl.toString(),
              modelService,
            );
          },
          child: SizedBox(
            width: dynamicViewExtensions.maxWidth(context),
            height: dynamicViewExtensions.dynamicHeight(
              context,
              0.06,
            ),
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: MainAppColorConstants.lightGreenColor,
                borderRadius: const BorderRadius.all(
                  Radius.circular(4),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    MdiIcons.googleMaps,
                    color: Colors.white,
                    size: 21,
                  ),
                  Padding(
                    padding: context.padding.onlyLeftLow,
                    child: LabelMediumWhiteText(
                      text: MapViewStrings.googleMapsButtonText.value,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  // phone call button
  Widget buildPhoneCallButtonWidget(BuildContext context) => Flexible(
        fit: FlexFit.tight,
        flex: 1,
        child: GestureDetector(
          onTap: () {
            phoneCall(
              point.phoneNumber.toString(),
              modelService,
            );
          },
          child: SizedBox(
            width: dynamicViewExtensions.maxWidth(context),
            height: dynamicViewExtensions.dynamicHeight(
              context,
              0.06,
            ),
            child: Container(
              margin: context.padding.onlyLeftLow,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: MainAppColorConstants.blueMainColor,
                borderRadius: const BorderRadius.all(
                  Radius.circular(4),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    MdiIcons.phone,
                    color: Colors.white,
                    size: 21,
                  ),
                  Padding(
                    padding: context.padding.onlyLeftLow,
                    child: LabelMediumWhiteText(
                      text: "+90 ${point.phoneNumber}",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
