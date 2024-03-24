import 'package:flutter/material.dart';
import 'package:flutterturizm/product/extension/view_extension.dart';

class DynamicViewExtensions {
  double maxWidth(BuildContext context) =>
      ViewSizeModelExtension(context).mediaSize.width;
  double maxHeight(BuildContext context) =>
      ViewSizeModelExtension(context).mediaSize.height;

  double dynamicWidth(BuildContext context, double value) =>
      maxWidth(context) * value;
  double dynamicHeight(BuildContext context, double value) =>
      maxHeight(context) * value;
}
