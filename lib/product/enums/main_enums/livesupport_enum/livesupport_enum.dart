enum LiveSupportViewStrings {
  startSupportTitleText('Gçrüşme Başlat!'),
  startSupportSubTitleText(
    'Görüşme başlatabilir ve bir sorun veya görüşünüzü bize burdan bilderebilirsiniz.',
  ),
  startSupportButtonText('Görüşme Başlat'),
  startSupportErrorText(
    'Görüşme Başlatılırken bir sorun oluştu, daha sonra tekrar deneyiniz.',
  ),
  liveSupportExitDialogTitleText(
    'Görüşmeyi Sonlandırmak İstediğinize Eminmisiniz?',
  ),
  liveSupportMessageStartTitleText('Görüşme Başlatıldı'),
  liveSupportMessageStartSubTitleText(
    'Görüşme başlatıldı, lütfen temsilcimizin mesajını bekleyiniz.',
  ),
  liveSupportMessageInput('Mesajınızı buraya yazın...'),
  liveSupportSendMessageErrorText('Mesaj Gönderilemedi Lütfen Tekrar Deneyin');

  final String value;
  const LiveSupportViewStrings(this.value);
}
