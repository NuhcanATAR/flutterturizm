import 'package:flutter/material.dart';
import 'package:flutterturizm/product/constant/icon_constant.dart';
import 'package:flutterturizm/product/enums/main_enums/profile_enum/profile_enum.dart';
import 'package:flutterturizm/product/model/auth_model/currentuser_model/currentuser_model.dart';
import 'package:flutterturizm/product/utility/dynamicextension/dynamicextension.dart';
import 'package:flutterturizm/product/widget/text_widget/label_medium_text.dart';
import 'package:kartal/kartal.dart';

class CityDistrictCardWidget extends StatelessWidget {
  const CityDistrictCardWidget({
    super.key,
    required this.currentUserValue,
    required this.dynamicViewExtensions,
  });

  final CurrentUserModel? currentUserValue;
  final DynamicViewExtensions dynamicViewExtensions;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 5,
      ),
      color: Colors.white,
      padding: context.padding.normal,
      child: Row(
        children: <Widget>[
          // city district
          Flexible(
            fit: FlexFit.tight,
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 25,
                  height: 25,
                  child: AppProfileIconsConstants.locationMap.toImg,
                ),
                Expanded(
                  child: Padding(
                    padding: context.padding.horizontalNormal,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          width: dynamicViewExtensions.maxWidth(context),
                          child: LabelMediumGreyText(
                            text: ProfileViewStrings.cityCardTitleText.value,
                            textAlign: TextAlign.left,
                          ),
                        ),
                        SizedBox(
                          width: dynamicViewExtensions.maxWidth(context),
                          child: LabelMediumBlackBoldText(
                            text:
                                "${currentUserValue!.city}/${currentUserValue!.district}",
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          // country
          Flexible(
            fit: FlexFit.tight,
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 25,
                  height: 25,
                  child: AppProfileIconsConstants.country.toImg,
                ),
                Expanded(
                  child: Padding(
                    padding: context.padding.horizontalLow,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          width: dynamicViewExtensions.maxWidth(context),
                          child: LabelMediumGreyText(
                            text: ProfileViewStrings.countryCardTitleText.value,
                            textAlign: TextAlign.left,
                          ),
                        ),
                        SizedBox(
                          width: dynamicViewExtensions.maxWidth(context),
                          child: const LabelMediumBlackBoldText(
                            text: "Türkiye",
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
