abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileEditLoading extends ProfileState {}

class ProfileEditSuccess extends ProfileState {
  final String successMessage;

  ProfileEditSuccess(this.successMessage);
}

class ProfileEditError extends ProfileState {
  final String errorMessage;

  ProfileEditError(this.errorMessage);
}
