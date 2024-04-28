// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

enum MyTicketValues {
  NEWTICKETS,
  CANCELED,
  ONTHEJOURNEY,
  JOURNEYCOMPLETED;
}

class ProfileModelService {
  // form key
  final formProfileKey = GlobalKey<FormState>();
  final avaluationKey = GlobalKey<FormState>();

  // evaluation explanation controller
  late TextEditingController evaluationExplanationController =
      TextEditingController();

  // is numeric control
  bool isNumeric(String? s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  // my ticket value status
  Map<String, int> statusMap = {
    "New": 1,
    "Canceled": 2,
    "OnTheJourney": 3,
    "JourneyCompleted": 4,
  };

  // city distirct service
  Map<String, List<String>>? cityDistricts;
  String? selectCity;
  String? selectDistrict;

  late String apiUrl = 'https://turkiyeapi.dev/api/v1/provinces?name=';

  // rating
  late double ratingPointValue = 1;

  // validator
  String? identificationValidator(String? identificationIDVal) {
    if (identificationIDVal == null || identificationIDVal.isEmpty) {
      return "Zorunlu Alan";
    } else if (identificationIDVal.length != 11) {
      return "TC Kimlik Numarası 11 haneli olmalıdır!";
    } else if (identificationIDVal.startsWith("0")) {
      return "TC Kimlik Numarası sıfır ile başlayamaz!";
    } else if (!isNumeric(identificationIDVal)) {
      return "TC Kimlik Numarası sadece rakamlardan oluşmalıdır!";
    }
    return null;
  }

  String? nameValidator(String? nameVal) {
    if (nameVal == null || nameVal.isEmpty) {
      return "Zorunlu Alan";
    }
    return null;
  }

  String? surNameValidator(String? surNameVal) {
    if (surNameVal == null || surNameVal.isEmpty) {
      return "Zorunlu Alan";
    }
    return null;
  }

  String? phoneNumberValidator(String? phoneNumberVal) {
    if (phoneNumberVal == null || phoneNumberVal.isEmpty) {
      return "Telefon numarası alanı boş bırakılamaz";
    }
    if (!RegExp(r"^[1-9][0-9]{9}$").hasMatch(phoneNumberVal)) {
      return "Geçersiz telefon numarası formatı";
    }
    return null;
  }
}
