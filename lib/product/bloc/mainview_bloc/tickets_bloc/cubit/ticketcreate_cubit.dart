import 'dart:convert';
import 'dart:ui';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterturizm/product/bloc/mainview_bloc/tickets_bloc/state/ticketcreate_state.dart';
import 'package:flutterturizm/product/enums/main_enums/ticket_enums/ticketcreate_enums.dart';
import 'package:flutterturizm/product/model/main_model/tickets_model/ticketdateslist_model.dart';
import 'package:flutterturizm/product/model/main_model/tickets_model/ticketslist_model.dart';
import 'package:flutterturizm/product/utility/service/api/tickets/tickets_api.dart';
import 'package:flutterturizm/product/utility/service/firebase/firebase_service.dart';
import 'package:http/http.dart' as http;
import 'package:pretty_qr_code/pretty_qr_code.dart';

class TicketCreateCubit extends Cubit<TicketCreateState> {
  TicketCreateCubit() : super(TicketCreateInitial());

  Future<void> ticketCreate(
    Tickets tickets,
    TicketDates ticketDates,
    int seatNumber,
    String qrCodeKey,
  ) async {
    emit(TicketCreateLoading());

    final qrCode = QrCode.fromData(
      data: qrCodeKey,
      errorCorrectLevel: QrErrorCorrectLevel.H,
    );

    final qrImage = QrImage(qrCode);

    try {
      final ByteData? qrImageBytes = await qrImage.toImageAsBytes(
        size: 125,
        format: ImageByteFormat.png,
        configuration: ImageConfiguration.empty,
      );

      final Reference storageReference = FirebaseService()
          .storageService
          .ref()
          .child('qr_codes/$qrCodeKey.png');
      await storageReference.putData(qrImageBytes!.buffer.asUint8List());
      final String downloadQrCodeUrl = await storageReference.getDownloadURL();
      final response = await http.post(
        TicketsApiUrl.getTicketCreateApiUrl(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
          <String, String>{
            'ticketID': tickets.id.toString(),
            'ticketDateID': ticketDates.id.toString(),
            'passangerID': FirebaseService().userID.toString(),
            'qrCode': downloadQrCodeUrl.toString(),
            'seatNumber': seatNumber.toString(),
            'ticketDate':
                "${ticketDates.day}.${ticketDates.month}.${ticketDates.year}",
          },
        ),
      );

      if (response.statusCode == 200) {
        emit(
          TicketCreateSuccess(downloadQrCodeUrl, tickets, ticketDates),
        );
      } else {
        emit(
          TicketCreateError(
            TicketCreateViewStrings.ticketCreateErrorText.value.toString(),
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
