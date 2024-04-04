import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterturizm/product/bloc/mainview_bloc/tickets_bloc/cubit/ticket_cubit.dart';
import 'package:flutterturizm/product/bloc/mainview_bloc/tickets_bloc/cubit/ticketcreate_cubit.dart';
import 'package:flutterturizm/product/constant/color_constant.dart';
import 'package:flutterturizm/product/enums/main_enums/ticket_enums/ticketcreate_enums.dart';
import 'package:flutterturizm/product/model/main_model/tickets_model/ticketdateslist_model.dart';
import 'package:flutterturizm/product/model/main_model/tickets_model/tickets_model.dart';
import 'package:flutterturizm/product/model/main_model/tickets_model/ticketslist_model.dart';
import 'package:flutterturizm/product/widget/text_widget/label_medium_text.dart';

mixin TicketMixin {
  void ticketFilter(
    BuildContext context,
    TicketsModelService modelService,
  ) {
    context.read<TicketsCubit>().fetchTickets(
          modelService.selectStartCity.toString(),
          modelService.selectEndCity.toString(),
          modelService.ticketDate,
        );
  }

  void ticketCreate(
    BuildContext context,
    Tickets ticket,
    TicketDates ticketDates,
    TicketsModelService modelService,
  ) {
    if (modelService.seatValue == 0) {
      final snackBar = SnackBar(
        backgroundColor: MainAppColorConstants.blueMainColor,
        content: LabelMediumWhiteText(
          text: TicketCreateViewStrings.ticketSeatSelectErrorText.value,
          textAlign: TextAlign.center,
        ),
        action: SnackBarAction(
          label: "Tamam",
          textColor: Colors.white,
          onPressed: () {},
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      BlocProvider.of<TicketCreateCubit>(context).ticketCreate(
        ticket,
        ticketDates,
        modelService.seatValue,
        modelService.qrCodeKey,
      );
    }
  }
}
