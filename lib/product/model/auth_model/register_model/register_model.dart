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
}
