import 'package:flutter/material.dart';
import 'package:flutterturizm/product/enums/main_enums/home_enum/home_enum.dart';
import 'package:flutterturizm/product/utility/dynamicextension/dynamicextension.dart';
import 'package:flutterturizm/product/widget/text_widget/body_medium_text.dart';
import 'package:kartal/kartal.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class FilterCardTitleWidget extends StatelessWidget {
  const FilterCardTitleWidget({
    super.key,
    required this.dynamicViewExtensions,
  });

  final DynamicViewExtensions dynamicViewExtensions;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: dynamicViewExtensions.maxWidth(context),
      child: Padding(
        padding: context.padding.onlyBottomLow,
        child: Row(
          children: <Widget>[
            Expanded(
              child: BodyMediumBlackText(
                text: HomeViewStrings.ticketFilterCardTitleText.value,
                textAlign: TextAlign.left,
              ),
            ),
            Icon(
              MdiIcons.filterOutline,
              color: Colors.grey,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
