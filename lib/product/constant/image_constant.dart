import 'package:flutter/material.dart';

enum AppLoginRegisterImgConstants {
  backImg('backimg');

  final String value;
  const AppLoginRegisterImgConstants(this.value);

  String get toJpg => "assets/images/logregpass_img/$value.jpg";
}

enum AppTicketsImgConstants {
  notFoundImg('notfound');

  final String value;
  const AppTicketsImgConstants(this.value);

  String get toPng => "assets/images/tickets_img/$value.png";
  Image get toImg => Image.asset(toPng);
}
