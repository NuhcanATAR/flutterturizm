import 'package:flutter/material.dart';
import 'package:flutterturizm/product/constant/color_constant.dart';
import 'package:flutterturizm/product/constant/image_constant.dart';
import 'package:flutterturizm/product/widget/text_widget/body_medium_text.dart';
import 'package:kartal/kartal.dart';

class ConnectionErrorView extends StatelessWidget {
  const ConnectionErrorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // image
            Padding(
              padding: context.padding.horizontalHigh,
              child: AppConnectionErrorImgConstants.connectionErrorImg.toImg,
            ),
            // title
            Padding(
              padding: context.padding.onlyTopHigh,
              child: const BodyMediumBlackBoldText(
                text: "Bağlantınızı Kontrol Ediniz!",
                textAlign: TextAlign.center,
              ),
            ),
            // sub title
            Padding(
              padding: context.padding.verticalNormal,
              child: const BodyMediumBlackText(
                text:
                    "Görünüşe göre internet bağlantınız yok devam edebilmek için internet bağlantınızı kontrol ediniz.",
                textAlign: TextAlign.center,
              ),
            ),
            // send button
            Padding(
              padding: context.padding.verticalNormal,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  padding: context.padding.low,
                  decoration: BoxDecoration(
                    color: MainAppColorConstants.blueMainColor,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(4),
                    ),
                  ),
                  child: const BodyMediumWhiteText(
                    text: "Tekrar Dene",
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
