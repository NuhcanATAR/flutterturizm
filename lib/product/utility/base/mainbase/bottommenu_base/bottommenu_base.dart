// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutterturizm/product/extension/view_extension.dart';
import 'package:flutterturizm/product/model/main_model/bottommenu_model/bottommenu_model.dart';
import 'package:data_connection_checker_nulls/data_connection_checker_nulls.dart';
import 'package:flutterturizm/product/router/main_router/bottommenu_router/bottommenu_router.dart';

abstract class MainBottomMenuBase<T extends StatefulWidget> extends State<T> {
  // model service
  BottomMenuModelService modelService = BottomMenuModelService();

  // router service
  BottomMenuRouterService routerService = BottomMenuRouterService();

  // view size
  double dynamicWidth(double value) => maxWidth * value;
  double dynamicHeight(double value) => maxHeight * value;

  late final maxWidth = ViewSizeModelExtension(context).mediaSize.width;
  late final maxHeight = ViewSizeModelExtension(context).mediaSize.height;

  @override
  void initState() {
    super.initState();
    checkConnection();
  }

  Future<void> checkConnection() async {
    bool result = await DataConnectionChecker().hasConnection;
    if (result == true) {
      modelService.logger.i('Internet Baglandi');
    } else {
      routerService.connectionErrorViewNavigatoRouter(context);
    }
  }

  // menu ontap
  void menuClickChange(int viewValue) {
    setState(() {
      modelService.selectView = viewValue;
    });
  }
}
