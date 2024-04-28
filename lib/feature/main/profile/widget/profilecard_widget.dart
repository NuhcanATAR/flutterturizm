import 'package:flutter/material.dart';
import 'package:flutterturizm/product/constant/color_constant.dart';
import 'package:flutterturizm/product/enums/main_enums/profile_enum/profile_enum.dart';
import 'package:flutterturizm/product/model/auth_model/currentuser_model/currentuser_model.dart';
import 'package:flutterturizm/product/utility/dynamicextension/dynamicextension.dart';
import 'package:flutterturizm/product/widget/text_widget/body_medium_text.dart';
import 'package:flutterturizm/product/widget/text_widget/label_medium_text.dart';
import 'package:kartal/kartal.dart';

import '../../../../product/constant/icon_constant.dart';

class ProfileCardWidget extends StatelessWidget {
  const ProfileCardWidget({
    super.key,
    required this.currentUserValue,
    required this.dynamicViewExtensions,
  });

  final CurrentUserModel? currentUserValue;
  final DynamicViewExtensions dynamicViewExtensions;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: context.padding.normal,
      child: Row(
        children: <Widget>[
          // profile image
          SizedBox(
            width: 50,
            height: 50,
            child: Container(
              padding: context.padding.normal,
              decoration: BoxDecoration(
                color: MainAppColorConstants.blueMainColor.withOpacity(0.3),
                borderRadius: const BorderRadius.all(
                  Radius.circular(124),
                ),
              ),
              child: AppProfileIconsConstants.userIcon.toImg,
            ),
          ),
          // name surname
          Expanded(
            child: Padding(
              padding: context.padding.horizontalNormal,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(
                    height: 5,
                  ),
                  // welcome
                  SizedBox(
                    width: dynamicViewExtensions.maxWidth(context),
                    child: Padding(
                      padding: context.padding.onlyBottomLow,
                      child: LabelMediumBlackText(
                        text: ProfileViewStrings.userCardTitleText.value,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  // name surname
                  SizedBox(
                    width: dynamicViewExtensions.maxWidth(context),
                    child: Padding(
                      padding: context.padding.onlyBottomLow,
                      child: BodyMediumBlackBoldText(
                        text:
                            "${currentUserValue!.name} ${currentUserValue!.surname}",
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
