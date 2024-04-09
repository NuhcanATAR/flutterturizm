class SellerMapApiUrl {
  static const String allSalePointsUrl =
      'http://192.168.1.103:3000/api/sales-points';

  static Uri getSellerMapApiUrl() {
    return Uri.parse(allSalePointsUrl);
  }
}
