import 'package:flutter/material.dart';
import 'package:flutterturizm/product/mixin/logregpass_mixin/password_mixin/passwordbloc_mixin.dart';
import 'package:flutterturizm/product/utility/dynamicextension/dynamicextension.dart';

abstract class MainPasswordBase<T extends StatefulWidget> extends State<T>
    with AuthPasswordResetBlocMixin {
  // view size
  DynamicViewExtensions dynamicViewExtensions = DynamicViewExtensions();
}
