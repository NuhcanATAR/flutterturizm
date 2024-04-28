import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterturizm/product/bloc/mainview_bloc/profile_bloc/state/state.dart';
import 'package:flutterturizm/product/utility/database/mainviews_db/profile_db/profile_db.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  // profile edit
  Future<void> profileEdit(
    String name,
    String surname,
    int identification,
    int dateOfBirthDay,
    int dateOfBirthMonth,
    int dateOfBirthYear,
  ) async {
    emit(ProfileEditLoading());
    await ProfileDB.USERS.userRef.update({
      "NAME": name,
      "SURNAME": surname,
      "IDENTIFICATIONNUMBER": identification,
      "DATEOFBIRTHDAY": dateOfBirthDay,
      "DATEOFBIRTHMONTH": dateOfBirthMonth,
      "DATEOFBIRTHYEAR": dateOfBirthYear,
    }).then((value) {
      emit(ProfileEditSuccess('Güncellendi'));
    }).catchError((err) {
      emit(ProfileEditError('Hata oluştu daha sona tekrar deneyiniz.'));
    });
  }

  // location edit
  Future<void> locationEdit(
    String city,
    String district,
  ) async {
    emit(ProfileEditLoading());

    await ProfileDB.USERS.userRef.update({
      "CITY": city,
      "DISTRICT": district,
    }).then((value) {
      emit(ProfileEditSuccess('Güncellendi'));
    }).catchError((err) {
      emit(ProfileEditError('Hata oluştu'));
    });
  }

  // phone number edit
  Future<void> phoneNumberEdit(
    int phoneNumber,
  ) async {
    emit(ProfileEditLoading());
    await ProfileDB.USERS.userRef.update({
      "PHONENUMBER": phoneNumber,
    }).then((value) {
      emit(ProfileEditSuccess('Güncellendi'));
    }).catchError((err) {
      emit(ProfileEditError('Hata'));
    });
  }
}
