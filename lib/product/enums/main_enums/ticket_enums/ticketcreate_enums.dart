enum TicketCreateViewStrings {
  ticketCreateErrorText(
    'Bilet Oluşturulurken Hata oluştu, daha sonra tekrar deneyiniz.',
  ),
  ticketSeatSelectErrorText(
    'Koltuk Seçimi Yapmadınız, lütfen koltuk seçiminizi yapınız.',
  ),
  ticketTotalPriceText('Toplam Fiyat'),
  ticketCreateButtonText('Bileti Oluştur'),
  ticketCreateSuccessTitleText('Biletiniz Başarıyla Oluşturuldu'),
  ticketCreateSuccessSubTitleText(
    'Otobüs Biletiniz başarıyla oluşturuldu, biletiniz için detaylı bilgiler aşağıda bulunmaktadır, dilerseniz profil sayfanızdan biletlerim bölümünden takip edebilirsiniz, keyfili yolculuklar dileriz.',
  ),
  homeViewButtonText('Anasayfaya dön'),
  ticketQrCodeCardTitleText('Bilet QR Kodu'),
  ticketDetailCardTitleText('Bilet Detayı'),
  ticketFeeText('Bilet Ücreti:'),
  takeOffText('Kalkış'),
  arrivalText('Varış');

  final String value;
  const TicketCreateViewStrings(this.value);
}
