class CurrentUserModel {
  final String name;
  final String surname;
  final String city;
  final String district;
  final int identificationId;
  final int dateOfBirthDay;
  final int dateOfBirthMonth;
  final int dateOfBirthYear;
  final int phoneNumber;
  final String accountType;

  CurrentUserModel({
    required this.city,
    required this.district,
    required this.name,
    required this.surname,
    required this.identificationId,
    required this.dateOfBirthDay,
    required this.dateOfBirthMonth,
    required this.dateOfBirthYear,
    required this.phoneNumber,
    required this.accountType,
  });
}
