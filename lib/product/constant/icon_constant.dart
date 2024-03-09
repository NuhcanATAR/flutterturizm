import 'package:flutter/material.dart';

enum AppLogRegPassIconConstants {
  googleMailcon('icons8-google-96');

  final String value;
  const AppLogRegPassIconConstants(this.value);

  String get toPng => "assets/icons/logregpass_icons/$value.png";
  Image get toImg => Image.asset(toPng);
}