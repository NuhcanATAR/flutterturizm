import 'package:flutter/material.dart';

enum GenderType { men, women }

class RegisterModelService {
  // form key
  final formRegisterKey = GlobalKey<FormState>();

  // controller
  late TextEditingController nameController = TextEditingController();
  late TextEditingController surnameController = TextEditingController();
  late TextEditingController identificationNumberController =
      TextEditingController();
  late TextEditingController phoneNumberController = TextEditingController();
  late TextEditingController emailController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();
  late TextEditingController passwordAgainController = TextEditingController();

  // gender type
  GenderType? genderType = GenderType.men;

  // date of birth
  late DateTime dateOfBirth = DateTime.now();

  // agrement check
  late bool isAgreementCheckStatus = false;

  // city distirct service
  Map<String, List<String>>? cityDistricts;
  String? selectCity;
  String? selectDistrict;

  late String apiUrl = 'https://turkiyeapi.dev/api/v1/provinces?name=';

  bool isNumeric(String? s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  // regexp
  final emailRegExp =
      RegExp(r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$");
  final RegExp passwordUserPattern =
      RegExp(r'^(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

  // validator
  String? identificationIDValidator(String? identificationIDVal) {
    if (identificationIDVal == null || identificationIDVal.isEmpty) {
      return "Zorunlu Alan";
    } else if (identificationIDVal.length != 11) {
      return "TC Kimlik Numarası 11 haneli olmalıdır!";
    } else if (identificationIDVal.startsWith("0")) {
      return "TC Kimlik Numarası sıfır ile başlayamaz!";
    } else if (!isNumeric(identificationIDVal)) {
      return "TC Kimlik Numarası sadece rakamlardan oluşmalıdır!";
    } else {
      return null;
    }
  }

  String? emailValidator(String? emailVal) {
    if (emailVal == null || emailVal.isEmpty) {
      return "E-posta alanı boş bırakılamaz";
    } else if (!emailRegExp.hasMatch(emailVal)) {
      return "Geçersiz e-posta formatı";
    } else {
      return null;
    }
  }

  String? passwordValidator(String? passwordVal) {
    if (passwordVal == null || passwordVal.isEmpty) {
      return "Şifre alanı boş bırakılamaz";
    }

    if (!passwordUserPattern.hasMatch(passwordVal)) {
      return "Şifre en az bir büyük harf, bir küçük harf, bir rakam ve bir özel karakter içermelidir!";
    }

    return null;
  }
}
