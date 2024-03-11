// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutterturizm/product/constant/color_constant.dart';
import 'package:flutterturizm/product/utility/base/mainbase/bottommenu_base/bottommenu_base.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class BottomMenuView extends StatefulWidget {
  const BottomMenuView({super.key});

  @override
  State<BottomMenuView> createState() => _BottomMenuViewState();
}

class _BottomMenuViewState extends MainBottomMenuBase<BottomMenuView> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => routerService.exitWarningDialog(context),
      child: Scaffold(
        body: modelService.viewList[modelService.selectView],
        bottomNavigationBar: NavigationBar(
          backgroundColor: Colors.white,
          indicatorColor: Colors.transparent,
          selectedIndex: modelService.selectView,
          height: 80,
          onDestinationSelected: menuClickChange,
          destinations: <Widget>[
            // tickets button
            NavigationDestination(
              selectedIcon: Icon(
                MdiIcons.ticket,
                color: MainAppColorConstants.blueMainColor,
                size: 21,
              ),
              icon: Icon(
                MdiIcons.ticketOutline,
                color: Colors.grey,
                size: 21,
              ),
              label: '',
            ),
            // seller map
            NavigationDestination(
              selectedIcon: Icon(
                MdiIcons.map,
                color: MainAppColorConstants.blueMainColor,
                size: 21,
              ),
              icon: Icon(
                MdiIcons.mapOutline,
                color: Colors.grey,
                size: 21,
              ),
              label: '',
            ),
            // home
            NavigationDestination(
              selectedIcon: Icon(
                MdiIcons.home,
                color: MainAppColorConstants.blueMainColor,
                size: 21,
              ),
              icon: Icon(
                MdiIcons.homeOutline,
                color: Colors.grey,
                size: 21,
              ),
              label: '',
            ),
            // live support
            NavigationDestination(
              selectedIcon: Icon(
                MdiIcons.helpCircle,
                color: MainAppColorConstants.blueMainColor,
                size: 21,
              ),
              icon: Icon(
                MdiIcons.helpCircleOutline,
                color: Colors.grey,
                size: 21,
              ),
              label: '',
            ),
            // profile
            NavigationDestination(
              selectedIcon: Icon(
                MdiIcons.account,
                color: MainAppColorConstants.blueMainColor,
                size: 21,
              ),
              icon: Icon(
                MdiIcons.accountOutline,
                color: Colors.grey,
                size: 21,
              ),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
