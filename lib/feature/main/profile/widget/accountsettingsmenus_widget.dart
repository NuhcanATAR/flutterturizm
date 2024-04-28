import 'package:flutter/material.dart';
import 'package:flutterturizm/product/constant/color_constant.dart';
import 'package:flutterturizm/product/enums/main_enums/profile_enum/profile_enum.dart';
import 'package:flutterturizm/product/router/main_router/profile_router/profile_router.dart';
import 'package:flutterturizm/product/utility/dynamicextension/dynamicextension.dart';
import 'package:flutterturizm/product/widget/text_widget/label_medium_text.dart';
import 'package:kartal/kartal.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../../product/widget/text_widget/body_medium_text.dart';

class AccountSettingsMenusWidget extends StatelessWidget {
  const AccountSettingsMenusWidget({
    super.key,
    required this.accountType,
    required this.dynamicViewExtensions,
    required this.routerService,
  });

  final String accountType;
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
                text: ProfileViewStrings.accountSettingsMenuTitleText.value,
                textAlign: TextAlign.left,
              ),
            ),
          ),
          // add account
          GestureDetector(
            onTap: () {
              routerService.newAccountViewNavigatorRouter(context);
            },
            child: Container(
              padding: context.padding.verticalNormal,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: MainAppColorConstants.blueMainColor,
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
                      color: MainAppColorConstants.blueMainColor,
                      size: 23,
                    ),
                    Expanded(
                      child: Padding(
                        padding: context.padding.horizontalNormal,
                        child: LabelMediumMainColorText(
                          text: ProfileViewStrings.newAccountMenuText.value,
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: MainAppColorConstants.blueMainColor,
                      size: 21,
                    ),
                  ],
                ),
              ),
            ),
          ),
          // exit account
          GestureDetector(
            onTap: () {
              routerService.exitAccountViewNavigatorRouter(
                context,
                accountType,
              );
            },
            child: Container(
              padding: context.padding.verticalNormal,
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.red,
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
                      color: Colors.redAccent,
                      size: 23,
                    ),
                    Expanded(
                      child: Padding(
                        padding: context.padding.horizontalNormal,
                        child: LabelMediumRedText(
                          text: ProfileViewStrings.accountExitMenuText.value,
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.redAccent,
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
