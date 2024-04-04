import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterturizm/product/bloc/logregpass_bloc/register_bloc/state/state.dart';

import 'package:flutterturizm/product/enums/logregpass_enums/register_enum/register_enum.dart';
import 'package:flutterturizm/product/utility/database/logregpass_db/register_db/register_db.dart';
import 'package:flutterturizm/product/utility/service/firebase/firebase_service.dart';

class AuthSignInUpCubit extends Cubit<SignInUpMainState> {
  AuthSignInUpCubit() : super(AuthSignInUpInitial());

  // signInUp
  Future<void> signInUp(
    String name,
    String surname,
    String email,
    String password,
    int identificationID,
    String city,
    String district,
    int phoneNumber,
    int dateOfBirthDay,
    int dateOfBirthMonth,
    int dateOfBithYear,
    String genderType,
  ) async {
    emit(AuthSignInUpLoading());
    try {
      final UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await RegisterDB.USERS.userRef.set({
        "ID": FirebaseService().userID,
        "NAME": name,
        "SURNAME": surname,
        "EMAIL": email,
        "IDENTIFICATIONNUMBER": identificationID,
        "CITY": city,
        "DISTRICT": district,
        "PHONENUMBER": phoneNumber,
        "DATEOFBIRTH":
            "${dateOfBirthDay.toString()}.${dateOfBirthMonth.toString()}.${dateOfBithYear.toString()}",
        "GENDER": genderType,
        "AUTHTYPE": "EMAILAUTH",
      });

      final User? userAuth = userCredential.user;
      await userAuth?.sendEmailVerification();

      emit(AuthSignInUpSuccess(RegisterViewStrings.registerSuccessText.value));
    } catch (e) {
      if (e is FirebaseAuthException) {
        if (e.code == 'email-already-in-use') {
          emit(
            AuthSignInUpEmailAlReadyInUse(
              RegisterViewStrings.registerEmailAlReadyInUse.value,
            ),
          );
        } else {
          emit(
            AuthSignInUpError(RegisterViewStrings.registerErrorText.value),
          );
        }
      } else {
        emit(
          AuthSignInUpError(RegisterViewStrings.registerErrorText.value),
        );
      }
    }
  }

  // register complete
  Future<void> registerComplete(
    String name,
    String surname,
    int identificationID,
    String city,
    String district,
    int phoneNumber,
    int dateOfBirthDay,
    int dateOfBirthMonth,
    int dateOfBithYear,
    String genderType,
  ) async {
    emit(AuthSignInUpLoading());
    try {
      await RegisterDB.USERS.userRef.set({
        "ID": FirebaseService().userID,
        "NAME": name,
        "SURNAME": surname,
        "IDENTIFICATIONNUMBER": identificationID,
        "CITY": city,
        "DISTRICT": district,
        "PHONENUMBER": phoneNumber,
        "DATEOFBIRTH":
            "${dateOfBirthDay.toString()}.${dateOfBirthMonth.toString()}.${dateOfBithYear.toString()}",
        "GENDER": genderType,
        "AUTHTYPE": "GOOGLEAUTH",
      });

      emit(AuthSignInUpSuccess(RegisterViewStrings.registerSuccessText.value));
    } catch (e) {
      emit(
        AuthSignInUpError(RegisterViewStrings.registerErrorText.value),
      );
    }
  }
}
