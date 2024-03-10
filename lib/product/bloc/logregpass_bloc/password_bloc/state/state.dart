abstract class AuthPasswordResetMainState {}

class AuthPasswordInitial extends AuthPasswordResetMainState {}

class AuthPasswordLoading extends AuthPasswordResetMainState {}

class SendMailSuccess extends AuthPasswordResetMainState {
  final String message;

  SendMailSuccess(this.message);
}

class SendMailError extends AuthPasswordResetMainState {
  final String errorMessage;

  SendMailError(this.errorMessage);
}
