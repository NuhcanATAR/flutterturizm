enum MyTicketsViewStrings {
  listNoTitleText('Bilet Bulunamadı!'),
  listNoSubTitleText('Kategoriye uygun bilet bulunamadı.'),
  ticketCanceledCardText('Biletiniz iptal edilmiştir!'),

  ticketStatus1Text('Bekliyor'),
  ticketStatus2Text('Yolda'),
  ticketStatus3Text('Varışda'),

  qrCodeTitleText('QR Kod'),

  ticketEvaluationCreateButtonText('Yolculuğu Değerlendir'),

  ticketEvaluationCreateExplanationInpuText(
    'Deneyimin hakkında bir şeyler yazmak istermisin?',
  ),

  ticketEvaluationSendButtonText('Değerlendirmeyi Gönder!');

  final String value;
  const MyTicketsViewStrings(this.value);
}
