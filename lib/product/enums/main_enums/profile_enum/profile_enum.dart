enum ProfileViewStrings {
  userCardTitleText('Hoşgeldiniz'),
  cityCardTitleText('Şehir/İlçe'),
  countryCardTitleText('Ülke'),
  appShareCardText('Uygulamayı Paylaş'),
  profileSettingsMenuTitleText('Profil Ayarları'),
  profileEditMenuText('Profili düzenle'),
  locationUpdateMenuText('Konumu değiştir'),
  phoneNumberUpdateMenuText('Telefon Numarasını değiştir'),
  myTicketsMenuTitleText('Biletler'),
  myticketsMenuText('Biletlerim'),
  accountSettingsMenuTitleText('Hesap Ayaları'),
  newAccountMenuText('Yeni Hesap Ekle'),
  accountExitMenuText('Çıkış yap'),
  exitDialogTitleText('Çıkış yapmak istediğinize eminmisiniz?'),

  profileEditSuccessText('Profil Bilgileri Güncellendi'),
  profileLocationEditSuccessText('Konum Bilgisi Güncellendi'),
  profilePhoneNumberEditSuccessText('Telefon Numarası Güncellendi'),
  profileEditErrorText('Bir Hata Oluştu, daha sonra tekrar deneyiniz!'),

  myTicketsListTabbarText1('Yeni Biletler'),
  myTicketsListTabbarText2('İptal'),
  myTicketsListTabbarText3('Yolculukta'),
  myTicketsListTabbarText4('Tamamlanan'),

  myTicketEvaluationCreateSuccessText(
    'Değerlendirmeniz alındı, teşekkür ederiz.',
  ),
  myTicketEvaluationCreateErrorText(
    'Değerlendirme esnasında bir hata oluştu, daha sonra tekrar deneyiniz.',
  );

  final String value;
  const ProfileViewStrings(this.value);
}
