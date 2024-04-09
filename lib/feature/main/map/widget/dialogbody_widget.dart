import 'package:flutter/material.dart';
import 'package:flutterturizm/product/constant/color_constant.dart';
import 'package:flutterturizm/product/model/main_model/map_model/salepoints_model.dart';
import 'package:flutterturizm/product/utility/dynamicextension/dynamicextension.dart';
import 'package:flutterturizm/product/widget/text_widget/body_medium_text.dart';
import 'package:flutterturizm/product/widget/text_widget/label_medium_text.dart';
import 'package:kartal/kartal.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../../product/constant/logo_constant.dart';

class DialogBodyWidget extends StatelessWidget {
  const DialogBodyWidget({
    super.key,
    required this.point,
    required this.dynamicViewExtensions,
  });

  final SalePointsModel point;
  final DynamicViewExtensions dynamicViewExtensions;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding.low,
      child: Row(
        children: <Widget>[
          // logo
          buildLogoWidget(context),
          // info section
          Expanded(
            child: Padding(
              padding: context.padding.low,
              child: Column(
                children: <Widget>[
                  // city district
                  buildCityDistrictWidget(context),
                  // branch name
                  buildBranchNameWidget(context),
                  // branch authority
                  buildBranchAuthorityWidget(context),
                  // working hourse, service name
                  buildWorkingHourseServiceName(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // logo
  Widget buildLogoWidget(BuildContext context) => Padding(
        padding: context.padding.low,
        child: SizedBox(
          width: dynamicViewExtensions.dynamicWidth(context, 0.22),
          height: dynamicViewExtensions.dynamicHeight(context, 0.12),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(124),
              ),
              image: DecorationImage(
                image: AssetImage(
                  AppLogoImgConstants.appLogoTextWhite.toPng,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      );

  // city district
  Widget buildCityDistrictWidget(BuildContext context) => SizedBox(
        width: dynamicViewExtensions.maxWidth(context),
        child: Padding(
          padding: context.padding.onlyBottomLow,
          child: LabelMediumBlackText(
            text: "${point.city}/${point.district}",
            textAlign: TextAlign.left,
          ),
        ),
      );

  // branch name
  Widget buildBranchNameWidget(BuildContext context) => SizedBox(
        width: dynamicViewExtensions.maxWidth(context),
        child: Padding(
          padding: context.padding.onlyBottomLow,
          child: BodyMediumBlackBoldText(
            text: "${point.branchName}",
            textAlign: TextAlign.left,
          ),
        ),
      );

  // branch authority
  Widget buildBranchAuthorityWidget(BuildContext context) => SizedBox(
        width: dynamicViewExtensions.maxWidth(context),
        child: Padding(
          padding: context.padding.onlyBottomLow,
          child: Row(
            children: <Widget>[
              Icon(
                MdiIcons.accountOutline,
                color: MainAppColorConstants.blueMainColor,
                size: 20,
              ),
              Expanded(
                child: Padding(
                  padding: context.padding.onlyLeftLow,
                  child: LabelMediumBlackText(
                    text: "${point.branchAuthority}",
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  // working hourse, service name
  Widget buildWorkingHourseServiceName(BuildContext context) => Row(
        children: <Widget>[
          Flexible(
            fit: FlexFit.tight,
            flex: 1,
            child: Padding(
              padding: context.padding.onlyRightLow,
              child: Chip(
                backgroundColor: MainAppColorConstants.blueMainColor,
                avatar: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    MdiIcons.timelapse,
                    color: MainAppColorConstants.blueMainColor,
                    size: 18,
                  ),
                ),
                label: LabelMediumWhiteText(
                  text: "${point.workingHours}",
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          ),
          Flexible(
            fit: FlexFit.tight,
            flex: 1,
            child: Chip(
              backgroundColor: MainAppColorConstants.blueMainColor,
              avatar: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  MdiIcons.ticket,
                  color: MainAppColorConstants.blueMainColor,
                  size: 18,
                ),
              ),
              label: LabelMediumWhiteText(
                text: "${point.serviceName}",
                textAlign: TextAlign.left,
              ),
            ),
          ),
        ],
      );
}
