class HomeModelService {
  // city distirct service
  Map<String, List<String>>? cityDistricts;
  String? selectStartCity;
  String? selectEndCity;

  late String apiUrl = 'https://turkiyeapi.dev/api/v1/provinces?name=';

  late DateTime ticketDate = DateTime.now();
}
