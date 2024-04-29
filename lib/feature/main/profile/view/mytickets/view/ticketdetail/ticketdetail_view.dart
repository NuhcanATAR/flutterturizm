import 'package:flutter/material.dart';
import 'package:flutterturizm/feature/main/profile/view/mytickets/view/ticketdetail/widget/evaluationbutton_widget.dart';
import 'package:flutterturizm/feature/main/profile/view/mytickets/view/ticketdetail/widget/qrcodecard_widget.dart';
import 'package:flutterturizm/feature/main/profile/view/mytickets/view/ticketdetail/widget/seatnumbercard_widget.dart';
import 'package:flutterturizm/feature/main/profile/view/mytickets/view/ticketdetail/widget/ticketcancelcard_widget.dart';
import 'package:flutterturizm/feature/main/profile/view/mytickets/view/ticketdetail/widget/ticketcard_widget.dart';
import 'package:flutterturizm/feature/main/profile/view/mytickets/view/ticketdetail/widget/ticketstatusbarcard_widget.dart';
import 'package:flutterturizm/product/constant/color_constant.dart';
import 'package:flutterturizm/product/model/main_model/tickets_model/myticketlist_model.dart';
import 'package:flutterturizm/product/utility/base/mainbase/profile_base/profile_base.dart';
import 'package:flutterturizm/product/widget/text_widget/label_medium_text.dart';
import 'package:kartal/kartal.dart';

class TicketDetailView extends StatefulWidget {
  const TicketDetailView({
    super.key,
    required this.myTickets,
  });

  final MyTickets myTickets;

  @override
  State<TicketDetailView> createState() => _TicketDetailViewState();
}

class _TicketDetailViewState extends ProfileBase<TicketDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: MainAppColorConstants.blueMainColor,
            size: 20,
          ),
        ),
        title: const LabelMediumMainColorText(
          text: "Bilet Detayı",
          textAlign: TextAlign.center,
        ),
      ),
      body: Padding(
        padding: context.padding.low,
        child: ListView(
          children: <Widget>[
            // ticket cancel card
            buildTicketCancelCardWidget,
            // ticket status bar card
            buildTikcetStatusBarCardWidget,
            // seat number
            buildSeatNumberCardWidget,
            // ticket card
            buildTicketCardWidget,
            // qr code
            buildQrCodeCardWidget,
            // evaluation button
            buildEvaluationButtonWidget,
          ],
        ),
      ),
    );
  }

  // ticket cancel card
  Widget get buildTicketCancelCardWidget => TicketCanceledCardWidget(
        myTickets: widget.myTickets,
      );

  // ticket status bar card
  Widget get buildTikcetStatusBarCardWidget => TicketStatusBarCardWidget(
        myTickets: widget.myTickets,
        dynamicViewExtensions: dynamicViewExtensions,
      );

  // seat number
  Widget get buildSeatNumberCardWidget => MyTicketSeatNumberCardWidget(
        myTickets: widget.myTickets,
        dynamicViewExtensions: dynamicViewExtensions,
      );

  // ticket card
  Widget get buildTicketCardWidget => MyTicketCardWidget(
        myTickets: widget.myTickets,
      );

  // qr code
  Widget get buildQrCodeCardWidget => MyTicketQrCodeCardWidget(
        myTickets: widget.myTickets,
        dynamicViewExtensions: dynamicViewExtensions,
      );

  // evaluation button
  Widget get buildEvaluationButtonWidget => EvaluationButtonWidget(
        myTickets: widget.myTickets,
        routerService: routerService,
        dynamicViewExtensions: dynamicViewExtensions,
      );
}
