import 'package:flutter/material.dart';
import 'package:flutterturizm/product/mixin/mainview_mixin/livesupport_mixin/livesupport_mixin.dart';
import 'package:flutterturizm/product/mixin/mainview_mixin/livesupport_mixin/livesupportbloc_mixin.dart';
import 'package:flutterturizm/product/utility/dynamicextension/dynamicextension.dart';

abstract class LiveSupportBase<T extends StatefulWidget> extends State<T>
    with LiveSupportBlocMixin, LiveSupportMixin {
  // extension
  DynamicViewExtensions dynamicViewExtensions = DynamicViewExtensions();
}
