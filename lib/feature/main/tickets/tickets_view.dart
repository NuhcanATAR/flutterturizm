import 'package:flutter/material.dart';
import 'package:flutterturizm/feature/main/tickets/widget/filtercard_widget.dart';
import 'package:flutterturizm/feature/main/tickets/widget/ticketlist_widget.dart';
import 'package:flutterturizm/product/utility/base/mainbase/tickets_base/tickets_base.dart';
import 'package:flutterturizm/product/widget/text_widget/label_medium_text.dart';

class TicketsView extends StatefulWidget {
  const TicketsView({super.key});

  @override
  State<TicketsView> createState() => _TicketsViewState();
}

class _TicketsViewState extends MainTicketsBase<TicketsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const LabelMediumMainColorText(
          text: "Biletler",
          textAlign: TextAlign.center,
        ),
      ),
      body: Column(
        children: <Widget>[
          // filter card
          buildFilterCardWidget,
          // ticket list
          buildTicketListWidget,
        ],
      ),
    );
  }

  // filter card
  Widget get buildFilterCardWidget => TicketFilterCardWidget(
        dynamicViewExtensions: dynamicViewExtensions,
        modelService: modelService,
        selectTicketDate: selectTicketDate,
        fetchTickets: fetchTickets,
      );

  // ticket list
  Widget get buildTicketListWidget => FilterTicketListWidget(
        modelService: modelService,
      );
}
