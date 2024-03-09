import 'package:flutter/material.dart';
import 'package:flutterturizm/product/extension/view_extension.dart';
import 'package:flutterturizm/product/router/auth_router/logreg_router/logreg_router.dart';

abstract class MainLoginRegisterBase<T extends StatefulWidget>
    extends State<T> {
  // router servcie
  LoginRegisterRouterService loginRegisterRouterService =
      LoginRegisterRouterService();

  // view size
  double dynamicWidth(double value) => maxWidth * value;
  double dynamicHeight(double value) => maxHeight * value;

  late final maxWidth = ViewSizeModelExtension(context).mediaSize.width;
  late final maxHeight = ViewSizeModelExtension(context).mediaSize.height;
}
