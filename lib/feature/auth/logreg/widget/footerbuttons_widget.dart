import 'package:flutter/material.dart';
import 'package:flutterturizm/feature/auth/logreg/widget/loginbutton_widget.dart';
import 'package:flutterturizm/feature/auth/logreg/widget/registerbutton_widget.dart';
import 'package:flutterturizm/product/utility/dynamicextension/dynamicextension.dart';
import 'package:kartal/kartal.dart';

class FooterButtonsWidget extends StatelessWidget {
  const FooterButtonsWidget({
    super.key,
    required this.dynamicViewExtensions,
    required this.routerService,
  });

  final DynamicViewExtensions dynamicViewExtensions;
  final dynamic routerService;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.tight,
      flex: 1,
      child: Padding(
        padding: context.padding.low,
        child: Column(
          children: <Widget>[
            // login button
            buildLoginButtonWidget(context),
            // register emiail & google button
            buildRegisterEmailGoogleButtonWidget(context),
          ],
        ),
      ),
    );
  }

  // login button
  Widget buildLoginButtonWidget(BuildContext context) => LoginButtonWidget(
        routerService: routerService,
        dynamicViewExtensions: dynamicViewExtensions,
      );

  // register email & google button
  Widget buildRegisterEmailGoogleButtonWidget(BuildContext context) =>
      RegisterButtonWidget(
        routerService: routerService,
        dynamicViewExtensions: dynamicViewExtensions,
      );
}
