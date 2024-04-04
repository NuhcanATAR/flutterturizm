import 'package:flutter/material.dart';
import 'package:flutterturizm/feature/main/tickets/view/tickercreate/view/ticketcreatesuccess/widget/qrcodecard_widget.dart';
import 'package:flutterturizm/feature/main/tickets/view/tickercreate/view/ticketcreatesuccess/widget/ticketdetailcard_widget.dart';
import 'package:flutterturizm/feature/main/tickets/view/tickercreate/view/ticketcreatesuccess/widget/top_widget.dart';
import 'package:flutterturizm/product/model/main_model/tickets_model/ticketdateslist_model.dart';
import 'package:flutterturizm/product/model/main_model/tickets_model/ticketslist_model.dart';
import 'package:flutterturizm/product/utility/base/mainbase/tickets_base/tickets_base.dart';
import 'package:flutterturizm/product/widget/text_widget/label_medium_text.dart';
import 'package:kartal/kartal.dart';

class TicketCreateSuccessView extends StatefulWidget {
  const TicketCreateSuccessView({
    super.key,
    required this.qrCodeUrl,
    required this.ticket,
    required this.ticketDates,
  });

  final String qrCodeUrl;
  final Tickets ticket;
  final TicketDates ticketDates;

  @override
  State<TicketCreateSuccessView> createState() =>
      _TicketCreateSuccessViewState();
}

class _TicketCreateSuccessViewState
    extends MainTicketsBase<TicketCreateSuccessView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const LabelMediumMainColorText(
          text: "Bilet Oluşturuldu",
          textAlign: TextAlign.center,
        ),
      ),
      body: Padding(
        padding: context.padding.normal,
        child: ListView(
          children: <Widget>[
            // top
            buildTopWidget,
            // qr code
            buildQrCodeWidget,
            // ticket detail card
            buildTicketDetailCardWidget,
          ],
        ),
      ),
    );
  }

  // top
  Widget get buildTopWidget => TicketCreateSuccessTopWidget(
        dynamicViewExtensions: dynamicViewExtensions,
      );

  // qr code
  Widget get buildQrCodeWidget => TicketCreateSuccessQrCodeCardWidget(
        dynamicViewExtensions: dynamicViewExtensions,
        qrCodeUrl: widget.qrCodeUrl,
      );

  // ticket detail card
  Widget get buildTicketDetailCardWidget => TicketSuccessTicketDetailCardWidget(
        ticket: widget.ticket,
        ticketDates: widget.ticketDates,
      );
}
