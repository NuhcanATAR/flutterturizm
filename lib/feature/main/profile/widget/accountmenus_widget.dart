import 'package:flutter/material.dart';
import 'package:flutterturizm/product/model/auth_model/currentuser_model/currentuser_model.dart';
import 'package:flutterturizm/product/router/main_router/profile_router/profile_router.dart';
import 'package:flutterturizm/product/utility/dynamicextension/dynamicextension.dart';
import 'package:flutterturizm/product/widget/text_widget/body_medium_text.dart';
import 'package:flutterturizm/product/widget/text_widget/label_medium_text.dart';
import 'package:kartal/kartal.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../../product/enums/main_enums/profile_enum/profile_enum.dart';

class AccountMenusWidget extends StatelessWidget {
  const AccountMenusWidget({
    super.key,
    required this.userModel,
    required this.dynamicViewExtensions,
    required this.routerService,
  });

  final CurrentUserModel? userModel;
  final DynamicViewExtensions dynamicViewExtensions;
  final ProfileRouterService routerService;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: context.padding.verticalNormal,
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        children: <Widget>[
          // menu title
          SizedBox(
            width: dynamicViewExtensions.maxWidth(context),
            child: Padding(
              padding: context.padding.low,
              child: BodyMediumBlackText(
                text: ProfileViewStrings.profileSettingsMenuTitleText.value,
                textAlign: TextAlign.left,
              ),
            ),
          ),
          // profile edit
          GestureDetector(
            onTap: () {
              routerService.profileEditViewNavigatorRouter(
                context,
                userModel,
              );
            },
            child: Container(
              padding: context.padding.verticalNormal,
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey,
                    width: 1,
                  ),
                ),
              ),
              child: Padding(
                padding: context.padding.horizontalLow,
                child: Row(
                  children: <Widget>[
                    Icon(
                      MdiIcons.accountEdit,
                      color: Colors.black54,
                      size: 23,
                    ),
                    Expanded(
                      child: Padding(
                        padding: context.padding.horizontalNormal,
                        child: LabelMediumBlackText(
                          text: ProfileViewStrings.profileEditMenuText.value,
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black54,
                      size: 21,
                    ),
                  ],
                ),
              ),
            ),
          ),
          // location edit
          GestureDetector(
            onTap: () {
              routerService.locationEditViewNavigatorRouter(
                context,
                userModel,
              );
            },
            child: Container(
              padding: context.padding.verticalNormal,
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey,
                    width: 1,
                  ),
                ),
              ),
              child: Padding(
                padding: context.padding.horizontalLow,
                child: Row(
                  children: <Widget>[
                    const Icon(
                      Icons.location_on,
                      color: Colors.black54,
                      size: 23,
                    ),
                    Expanded(
                      child: Padding(
                        padding: context.padding.horizontalNormal,
                        child: LabelMediumBlackText(
                          text: ProfileViewStrings.locationUpdateMenuText.value,
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black54,
                      size: 21,
                    ),
                  ],
                ),
              ),
            ),
          ),
          // phone number edit
          GestureDetector(
            onTap: () {
              routerService.phoneNumberEditViewNavigatorRouter(
                context,
                userModel,
              );
            },
            child: Container(
              padding: context.padding.verticalNormal,
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey,
                    width: 1,
                  ),
                ),
              ),
              child: Padding(
                padding: context.padding.horizontalLow,
                child: Row(
                  children: <Widget>[
                    const Icon(
                      Icons.phone,
                      color: Colors.black54,
                      size: 23,
                    ),
                    Expanded(
                      child: Padding(
                        padding: context.padding.horizontalNormal,
                        child: LabelMediumBlackText(
                          text: ProfileViewStrings
                              .phoneNumberUpdateMenuText.value,
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black54,
                      size: 21,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
