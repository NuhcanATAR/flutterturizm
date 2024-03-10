import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterturizm/product/bloc/logregpass_bloc/password_bloc/state/state.dart';
import 'package:flutterturizm/product/enums/logregpass_enums/password_enum/password_enum.dart';
import 'package:flutterturizm/product/utility/service/firebase/firebase_service.dart';

class AuthPasswordCubit extends Cubit<AuthPasswordResetMainState> {
  AuthPasswordCubit() : super(AuthPasswordInitial());

  // send reset mail
  Future<void> sendResetEmail(String email) async {
    emit(AuthPasswordLoading());
    try {
      await FirebaseService().authService.sendPasswordResetEmail(
            email: email,
          );
      emit(SendMailSuccess(PasswordViewStrings.sendMailSuccessText.value));
    } catch (e) {
      emit(SendMailError(PasswordViewStrings.sendMailErrorText.value));
    }
  }
}
