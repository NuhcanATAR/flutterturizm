import 'package:flutter/material.dart';

enum AppLogoImgConstants {
  appLogoBlue('logo_blue'),
  appLogoWhite('logo_white'),
  appLogoTextBlue('logotext_blue'),
  appLogoTextWhite('logotext_white');

  final String value;
  const AppLogoImgConstants(this.value);

  String get toPng => "assets/images/app_img/$value.png";
  Image get toImg => Image.asset(toPng);
}
