abstract class LiveSupportState {}

class LiveSupportInitial extends LiveSupportState {}

class LiveSupportLoading extends LiveSupportState {}

class LiveSupportSuccess extends LiveSupportState {}

class LiveSupportError extends LiveSupportState {
  final String value;

  LiveSupportError(this.value);
}
