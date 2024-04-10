import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterturizm/product/bloc/mainview_bloc/livesupport_bloc/state/livesupport_state.dart';
import 'package:flutterturizm/product/enums/main_enums/livesupport_enum/livesupport_enum.dart';
import 'package:flutterturizm/product/model/main_model/livesupport_model/livesupport_model.dart';
import 'package:flutterturizm/product/utility/service/firebase/firebase_service.dart';

class LiveSupportCubit extends Cubit<LiveSupportState> {
  LiveSupportCubit() : super(LiveSupportInitial());

  void startLiveSupport(
    LiveSupportModelService modelService,
  ) {
    emit(LiveSupportLoading());
    FirebaseService().databaseReference.child(FirebaseService().userID).set({
      'startedDate': ServerValue.timestamp,
      'messageStartDate':
          "${modelService.dateTime.day}.${modelService.dateTime.month}.${modelService.dateTime.year}",
    }).then((value) {
      emit(LiveSupportSuccess());
    }).catchError((err) {
      emit(
        LiveSupportError(
          LiveSupportViewStrings.startSupportErrorText.value,
        ),
      );
    });
  }

  void sendMessage(
    LiveSupportModelService modelService,
    TextEditingController messageController,
  ) {
    emit(LiveSupportLoading());
    final String messageText = modelService.messageController.text.trim();
    if (messageText.isNotEmpty) {
      modelService.messagesRef.push().set({
        'message': messageText,
        'userId': FirebaseService().userID,
        'timestamp': ServerValue.timestamp,
        'hourminute':
            "${modelService.dateTime.hour}:${modelService.dateTime.minute}",
      }).then((value) {
        emit(LiveSupportSuccess());
      }).catchError((err) {
        emit(
          LiveSupportError(
            LiveSupportViewStrings.liveSupportSendMessageErrorText.value,
          ),
        );
      });
    }
  }
}
