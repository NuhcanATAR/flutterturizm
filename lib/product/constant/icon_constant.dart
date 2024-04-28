import 'package:flutter/material.dart';

enum AppLogRegPassIconConstants {
  googleMailcon('icons8-google-96');

  final String value;
  const AppLogRegPassIconConstants(this.value);

  String get toPng => "assets/icons/logregpass_icons/$value.png";
  Image get toImg => Image.asset(toPng);
}

enum AppTicketsIconsConstants {
  successIcon('success');

  final String value;
  const AppTicketsIconsConstants(this.value);

  String get toPng => "assets/icons/tickets_icons/$value.png";
  Image get toImg => Image.asset(toPng);
}

enum AppProfileIconsConstants {
  userIcon('users'),
  locationMap('locationmap'),
  country('country');

  final String value;
  const AppProfileIconsConstants(this.value);

  String get toPng => "assets/icons/profile_icons/$value.png";
  Image get toImg => Image.asset(toPng);
}
