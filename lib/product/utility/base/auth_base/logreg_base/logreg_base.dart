import 'package:flutter/material.dart';
import 'package:flutterturizm/product/router/auth_router/logreg_router/logreg_router.dart';
import 'package:flutterturizm/product/utility/dynamicextension/dynamicextension.dart';

abstract class MainLoginRegisterBase<T extends StatefulWidget>
    extends State<T> {
  // router servcie
  LoginRegisterRouterService loginRegisterRouterService =
      LoginRegisterRouterService();

  // view size
  DynamicViewExtensions dynamicViewExtensions = DynamicViewExtensions();
}
