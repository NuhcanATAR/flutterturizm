import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterturizm/product/bloc/mainview_bloc/profile_bloc/state/state.dart';
import 'package:flutterturizm/product/enums/main_enums/profile_enum/profile_enum.dart';
import 'package:flutterturizm/product/model/main_model/tickets_model/myticketlist_model.dart';
import 'package:flutterturizm/product/utility/database/mainviews_db/profile_db/profile_db.dart';
import 'package:flutterturizm/product/utility/service/api/tickets/tickets_api.dart';
import 'package:http/http.dart' as http;

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
      emit(ProfileEditSuccess(ProfileViewStrings.profileEditSuccessText.value));
    }).catchError((err) {
      emit(ProfileEditError(ProfileViewStrings.profileEditErrorText.value));
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
      emit(
        ProfileEditSuccess(
          ProfileViewStrings.profileLocationEditSuccessText.value,
        ),
      );
    }).catchError((err) {
      emit(ProfileEditError(ProfileViewStrings.profileEditErrorText.value));
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
      emit(
        ProfileEditSuccess(
          ProfileViewStrings.profilePhoneNumberEditSuccessText.value,
        ),
      );
    }).catchError((err) {
      emit(
        ProfileEditError(
          ProfileViewStrings.profileLocationEditSuccessText.value,
        ),
      );
    });
  }

  // ticket evaluation create
  Future<void> evaluationTicketCreate(
    MyTickets myTickets,
    int ratingPoint,
    String explanation,
  ) async {
    emit(ProfileEditLoading());

    try {
      final response = await http.post(
        TicketsApiUrl.postEvaluationApiUrl(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
          <String, String>{
            'ticketId': myTickets.id.toString(),
            'ratingPoint': ratingPoint.toString(),
            'explanation': explanation,
          },
        ),
      );

      if (response.statusCode == 200) {
        emit(
          ProfileEditSuccess(
            ProfileViewStrings.myTicketEvaluationCreateSuccessText.value,
          ),
        );
      } else {
        emit(
          ProfileEditError(
            ProfileViewStrings.myTicketEvaluationCreateErrorText.value,
          ),
        );
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error: $e");
      }
    }
  }
}
