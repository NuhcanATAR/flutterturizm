import 'package:flutter/material.dart';
import 'package:flutterturizm/feature/main/home/home_view.dart';
import 'package:flutterturizm/feature/main/livesupport/livesupport_view.dart';
import 'package:flutterturizm/feature/main/map/map_view.dart';
import 'package:flutterturizm/feature/main/profile/profile_view.dart';
import 'package:flutterturizm/feature/main/tickets/tickets_view.dart';
import 'package:logger/logger.dart';

class BottomMenuModelService {
  late List<Widget> viewList = <Widget>[
    const TicketsView(),
    const MapView(),
    const HomeView(),
    const LiveSupportView(),
    const ProfileView(),
  ];

  late int selectView = 2;

  dynamic logger = Logger();
}
