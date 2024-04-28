import 'package:flutter/material.dart';
import 'package:flutterturizm/product/enums/main_enums/profile_enum/profile_enum.dart';
import 'package:flutterturizm/product/model/auth_model/currentuser_model/currentuser_model.dart';
import 'package:flutterturizm/product/router/main_router/profile_router/profile_router.dart';
import 'package:flutterturizm/product/utility/dynamicextension/dynamicextension.dart';
import 'package:flutterturizm/product/widget/text_widget/body_medium_text.dart';
import 'package:flutterturizm/product/widget/text_widget/label_medium_text.dart';
import 'package:kartal/kartal.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class TicketMenusWidget extends StatelessWidget {
  const TicketMenusWidget({
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
                text: ProfileViewStrings.myTicketsMenuTitleText.value,
                textAlign: TextAlign.left,
              ),
            ),
          ),
          // ticket menu
          GestureDetector(
            onTap: () {
              routerService.myTicketsViewNavigatorRouter(
                context,
                userModel,
              );
            },
            child: Padding(
              padding: context.padding.verticalNormal,
              child: Padding(
                padding: context.padding.horizontalLow,
                child: Row(
                  children: <Widget>[
                    Icon(
                      MdiIcons.ticket,
                      color: Colors.black54,
                      size: 23,
                    ),
                    Expanded(
                      child: Padding(
                        padding: context.padding.horizontalNormal,
                        child: LabelMediumBlackText(
                          text: ProfileViewStrings.myticketsMenuText.value,
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
