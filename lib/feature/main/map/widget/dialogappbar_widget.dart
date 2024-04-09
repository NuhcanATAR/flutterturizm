import 'package:flutter/material.dart';
import 'package:flutterturizm/product/enums/main_enums/map_enum/map_enum.dart';
import 'package:flutterturizm/product/widget/text_widget/label_medium_text.dart';
import 'package:kartal/kartal.dart';

class DialogAppBarWidget extends StatelessWidget {
  const DialogAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding.normal,
      child: Row(
        children: <Widget>[
          Expanded(
            child: LabelMediumGreyText(
              text: MapViewStrings.dialogAppBarText.value,
              textAlign: TextAlign.center,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.close,
              color: Colors.grey,
              size: 21,
            ),
          ),
        ],
      ),
    );
  }
}
