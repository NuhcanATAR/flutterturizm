import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutterturizm/feature/main/tickets/view/tickercreate/view/ticketcreatesuccess/ticketcreatesuccess_view.dart';
import 'package:flutterturizm/product/bloc/mainview_bloc/tickets_bloc/state/ticketcreate_state.dart';
import 'package:flutterturizm/product/constant/color_constant.dart';
import 'package:flutterturizm/product/widget/text_widget/label_medium_text.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

mixin TicketCreateBlocMixin {
  void ticketCreateListenerBloc(BuildContext context, state) {
    switch (state.runtimeType) {
      case TicketCreateSuccess:
        Navigator.pop(context);
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => TicketCreateSuccessView(
              qrCodeUrl: (state as TicketCreateSuccess).qrCodeUrl,
              ticket: state.tickets,
              ticketDates: state.ticketDates,
            ),
          ),
          (Route<dynamic> route) => false,
        );
        break;
      case TicketCreateError:
        Navigator.pop(context);
        final snackBar = SnackBar(
          backgroundColor: MainAppColorConstants.blueMainColor,
          content: LabelMediumWhiteText(
            text: (state as TicketCreateError).value,
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
      case TicketCreateLoading:
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
