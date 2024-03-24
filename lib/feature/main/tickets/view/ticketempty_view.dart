import 'package:flutter/material.dart';
import 'package:flutterturizm/product/constant/image_constant.dart';
import 'package:flutterturizm/product/widget/text_widget/body_medium_text.dart';
import 'package:flutterturizm/product/widget/text_widget/label_medium_text.dart';
import 'package:kartal/kartal.dart';

class FilterTicketEmptyView extends StatelessWidget {
  const FilterTicketEmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding.low,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // image
            Padding(
              padding: context.padding.horizontalHigh,
              child: AppTicketsImgConstants.notFoundImg.toImg,
            ),
            // title
            Padding(
              padding: context.padding.onlyTopLow,
              child: const BodyMediumBlackBoldText(
                text: "Bilet Filtreleyin",
                textAlign: TextAlign.center,
              ),
            ),
            // sub title
            Padding(
              padding: context.padding.onlyTopLow,
              child: const LabelMediumBlackText(
                text:
                    "Henüz yeni bir bilet yok gibi görünüyor, isterseniz filtreleme yaparak size uygun filtreyi bulabilirsiniz.",
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
