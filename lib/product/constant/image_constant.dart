enum AppLoginRegisterImgConstants {
  backImg('backimg');

  final String value;
  const AppLoginRegisterImgConstants(this.value);

  String get toJpg => "assets/images/logregpass_img/$value.jpg";
}
