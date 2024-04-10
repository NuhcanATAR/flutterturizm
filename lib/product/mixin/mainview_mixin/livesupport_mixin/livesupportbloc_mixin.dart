import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutterturizm/feature/main/livesupport/view/messages/message_view.dart';
import 'package:flutterturizm/product/bloc/mainview_bloc/livesupport_bloc/state/livesupport_state.dart';
import 'package:flutterturizm/product/constant/color_constant.dart';
import 'package:flutterturizm/product/model/main_model/livesupport_model/livesupport_model.dart';
import 'package:flutterturizm/product/widget/text_widget/label_medium_text.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

mixin LiveSupportBlocMixin {
  LiveSupportModelService modelService = LiveSupportModelService();
  void liveSupportListenerBloc(BuildContext context, state) {
    switch (state.runtimeType) {
      case LiveSupportSuccess:
        Navigator.pop(context);
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const MessageView(),
          ),
          (Route<dynamic> route) => false,
        );
        break;
      case LiveSupportError:
        Navigator.pop(context);
        final snackBar = SnackBar(
          backgroundColor: MainAppColorConstants.blueMainColor,
          content: LabelMediumWhiteText(
            text: (state as LiveSupportError).value,
            textAlign: TextAlign.left,
          ),
          action: SnackBarAction(
            label: "Tamam",
            textColor: Colors.white,
            onPressed: () {},
          ),
          duration: const Duration(seconds: 4),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        break;
      case LiveSupportLoading:
        final alertDialog = AlertDialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: LoadingAnimationWidget.hexagonDots(
            color: Colors.white,
            size: 50,
          ),
          content: const LabelMediumWhiteText(
            text: "Canlı Desteğe Bağlanılıyor...",
            textAlign: TextAlign.center,
          ),
        );
        showDialog(context: context, builder: (context) => alertDialog);
        break;
      default:
        if (kDebugMode) {
          print("Eksik Case Durumu");
        }
    }
  }

  void liveSupportMessageListenerBloc(BuildContext context, state) {
    switch (state.runtimeType) {
      case LiveSupportSuccess:
        Navigator.pop(context);
        modelService.messageController.clear();
        break;
      case LiveSupportError:
        Navigator.pop(context);
        final snackBar = SnackBar(
          backgroundColor: MainAppColorConstants.blueMainColor,
          content: LabelMediumWhiteText(
            text: (state as LiveSupportError).value,
            textAlign: TextAlign.left,
          ),
          action: SnackBarAction(
            label: "Tamam",
            textColor: Colors.white,
            onPressed: () {},
          ),
          duration: const Duration(seconds: 4),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        break;
      case LiveSupportLoading:
        final alertDialog = AlertDialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: LoadingAnimationWidget.hexagonDots(
            color: Colors.white,
            size: 50,
          ),
          content: const LabelMediumWhiteText(
            text: "Canlı Desteğe Bağlanılıyor...",
            textAlign: TextAlign.center,
          ),
        );
        showDialog(context: context, builder: (context) => alertDialog);
        break;
      default:
        if (kDebugMode) {
          print("Eksik Case Durumu");
        }
    }
  }
}
