abstract class AuthSignInMainState {}

class AuthSignInInitialState extends AuthSignInMainState {}

class AuthSignInLoadingState extends AuthSignInMainState {}

class AuthSignInSuccessState extends AuthSignInMainState {}

class AuthSignInErrorState extends AuthSignInMainState {
  final String errorMessage;

  AuthSignInErrorState(this.errorMessage);
}

class AuthSingInEmailVerified extends AuthSignInMainState {
  final String errorMessage;

  AuthSingInEmailVerified(this.errorMessage);
}

class AuthSingInGoogleAuthSuccess extends AuthSignInMainState {}

class AuthSignInGoogleAuthLoading extends AuthSignInMainState {}

class AuthSignInGoogleAuthError extends AuthSignInMainState {
  final String errorMessage;

  AuthSignInGoogleAuthError(this.errorMessage);
}
