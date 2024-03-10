abstract class SignInUpMainState {}

class AuthSignInUpInitial extends SignInUpMainState {}

class AuthSignInUpLoading extends SignInUpMainState {}

class AuthSignInUpSuccess extends SignInUpMainState {
  final String errorMessage;

  AuthSignInUpSuccess(this.errorMessage);
}

class AuthSignInUpError extends SignInUpMainState {
  final String errorMessage;

  AuthSignInUpError(this.errorMessage);
}

class AuthSignInUpEmailAlReadyInUse extends SignInUpMainState {
  final String errorMessage;

  AuthSignInUpEmailAlReadyInUse(this.errorMessage);
}
