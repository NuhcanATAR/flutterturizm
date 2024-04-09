import 'package:flutter/material.dart';
import 'package:flutterturizm/feature/main/map/widget/dialogappbar_widget.dart';
import 'package:flutterturizm/feature/main/map/widget/dialogbody_widget.dart';
import 'package:flutterturizm/feature/main/map/widget/dialogfooter_widget.dart';
import 'package:flutterturizm/product/enums/main_enums/map_enum/map_enum.dart';
import 'package:flutterturizm/product/model/main_model/map_model/map_model.dart';
import 'package:flutterturizm/product/model/main_model/map_model/salepoints_model.dart';
import 'package:flutterturizm/product/utility/dynamicextension/dynamicextension.dart';
import 'package:flutterturizm/product/widget/text_widget/body_medium_text.dart';
import 'package:flutterturizm/product/widget/text_widget/label_medium_text.dart';
import 'package:url_launcher/url_launcher.dart';

mixin MapMixin {
  void branchCardDialog(
    SalePointsModel point,
    BuildContext context,
    DynamicViewExtensions dynamicViewExtensions,
    MapModelService modelService,
  ) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) => SizedBox(
        width: dynamicViewExtensions.maxWidth(context),
        height: dynamicViewExtensions.dynamicHeight(
          context,
          0.4,
        ),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
          ),
          child: ListView(
            children: <Widget>[
              // appbbar
              const DialogAppBarWidget(),
              // branch card
              DialogBodyWidget(
                point: point,
                dynamicViewExtensions: dynamicViewExtensions,
              ),
              // google maps url, phone number
              DialogFooterButtonsWidget(
                point: point,
                modelService: modelService,
                dynamicViewExtensions: dynamicViewExtensions,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void mapAbout(BuildContext context) {
    final AlertDialog alertDialog = AlertDialog(
      title: BodyMediumBlackBoldText(
        text: MapViewStrings.questionDialogTitleText.value,
        textAlign: TextAlign.center,
      ),
      content: LabelMediumBlackText(
        text: MapViewStrings.questionDialogSubTitleText.value,
        textAlign: TextAlign.center,
      ),
      actionsPadding:
          const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
      actions: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const LabelMediumBlackText(
            text: "Tamam",
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
    showDialog(context: context, builder: (context) => alertDialog);
  }

  // url convert

  Future<void> googleMapLocation(
    String url,
    MapModelService modelService,
  ) async {
    final convertedUrl = modelService.googleMaps(url);
    final bool isCheckUrl = await launchUrl(convertedUrl);

    if (!isCheckUrl) {
      throw Exception('Url Bulunamadı');
    }
  }

  // phone number
  Future<void> phoneCall(
    String phoneNumberValue,
    MapModelService modelService,
  ) async {
    await launchUrl(modelService.launchPhoneNumberUrl(phoneNumberValue));
  }
}
