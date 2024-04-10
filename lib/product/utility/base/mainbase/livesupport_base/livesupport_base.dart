import 'package:flutter/material.dart';
import 'package:flutterturizm/product/mixin/mainview_mixin/livesupport_mixin/livesupport_mixin.dart';
import 'package:flutterturizm/product/mixin/mainview_mixin/livesupport_mixin/livesupportbloc_mixin.dart';
import 'package:flutterturizm/product/model/main_model/livesupport_model/livesupport_model.dart';
import 'package:flutterturizm/product/utility/dynamicextension/dynamicextension.dart';

abstract class LiveSupportBase<T extends StatefulWidget> extends State<T>
    with LiveSupportBlocMixin, LiveSupportMixin {
  // model service
  LiveSupportModelService modelService = LiveSupportModelService();

  // extension
  DynamicViewExtensions dynamicViewExtensions = DynamicViewExtensions();
}
