enum TicketViewStrings {
  ticketServiceStatusCodeErrorText('Servise Bağlanılamadı!'),
  ticketServiceCatchErrorText('Service İsteği Esnasında bir sorun oluştu!'),
  ticketEmptyTitleText('Bilet Filtreleyin'),
  ticketEmptySubTitleText(
    'Henüz yeni bir bilet yok gibi görünüyor, isterseniz filtreleme yaparak size uygun filtreyi bulabilirsiniz.',
  ),
  ticketTakeOffInputText('Nerden?'),
  ticketArrivalInputText('Nereye?'),
  ticketDateInputText('Bilet Tarihi'),
  ticketFilterButtonText('Biletleri Göster'),
  ticketTakeOffText('Kalkış'),
  ticketArrivalText('Varış'),
  ticketFeeText('Bilet Ücreti:');

  final String value;
  const TicketViewStrings(this.value);
}
