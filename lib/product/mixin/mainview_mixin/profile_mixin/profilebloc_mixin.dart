import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterturizm/feature/main/bottommenu/bottommenu_view.dart';
import 'package:flutterturizm/product/bloc/mainview_bloc/profile_bloc/cubit/cubit.dart';
import 'package:flutterturizm/product/bloc/mainview_bloc/profile_bloc/state/state.dart';
import 'package:flutterturizm/product/constant/color_constant.dart';
import 'package:flutterturizm/product/model/main_model/tickets_model/myticketlist_model.dart';
import 'package:flutterturizm/product/widget/text_widget/label_medium_text.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

mixin ProfileBlocMixin {
  // profile edit
  void profileEditListener(BuildContext context, state) {
    switch (state.runtimeType) {
      case ProfileEditSuccess:
        Navigator.pop(context);
        final snackBar = SnackBar(
          backgroundColor: MainAppColorConstants.blueMainColor,
          content: LabelMediumWhiteText(
            text: (state as ProfileEditSuccess).successMessage,
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
      case ProfileEditError:
        Navigator.pop(context);
        final snackBar = SnackBar(
          backgroundColor: MainAppColorConstants.blueMainColor,
          content: LabelMediumWhiteText(
            text: (state as ProfileEditSuccess).successMessage,
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
      case ProfileEditLoading:
        final alertDialog = AlertDialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: LoadingAnimationWidget.hexagonDots(
            color: Colors.white,
            size: 50,
          ),
          content: const LabelMediumWhiteText(
            text: "Bilgiler Alınıyor, Lütfen Bekleyiniz...",
            textAlign: TextAlign.center,
          ),
        );
        showDialog(context: context, builder: (context) => alertDialog);
        break;
      default:
        if (kDebugMode) {
          print("Eksik State Case var");
        }
    }
  }

  void evaluationCreate(
    BuildContext context,
    MyTickets myTickets,
    int ratingPoint,
    String explanation,
  ) {
    BlocProvider.of<ProfileCubit>(context).evaluationTicketCreate(
      myTickets,
      ratingPoint,
      explanation,
    );
  }

  void ticketEvaluationCreateListener(BuildContext context, state) {
    switch (state.runtimeType) {
      case ProfileEditSuccess:
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const BottomMenuView(),
          ),
          (Route<dynamic> route) => false,
        );
        final snackBar = SnackBar(
          backgroundColor: MainAppColorConstants.blueMainColor,
          content: LabelMediumWhiteText(
            text: (state as ProfileEditSuccess).successMessage,
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
      case ProfileEditError:
        Navigator.pop(context);
        final snackBar = SnackBar(
          backgroundColor: MainAppColorConstants.blueMainColor,
          content: LabelMediumWhiteText(
            text: (state as ProfileEditSuccess).successMessage,
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
      case ProfileEditLoading:
        final alertDialog = AlertDialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: LoadingAnimationWidget.hexagonDots(
            color: Colors.white,
            size: 50,
          ),
          content: const LabelMediumWhiteText(
            text: "Bilgiler Alınıyor, Lütfen Bekleyiniz...",
            textAlign: TextAlign.center,
          ),
        );
        showDialog(context: context, builder: (context) => alertDialog);
        break;
      default:
        if (kDebugMode) {
          print("Eksik State Case var");
        }
    }
  }
}
