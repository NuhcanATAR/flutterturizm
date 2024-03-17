class CurrentUserModel {
  final String uid;
  final String email;
  final String password;

  CurrentUserModel(
      {required this.uid, required this.email, this.password = ''});
}
