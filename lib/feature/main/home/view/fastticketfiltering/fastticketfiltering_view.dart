import 'package:flutter/material.dart';
import 'package:flutterturizm/product/constant/color_constant.dart';
import 'package:flutterturizm/product/model/main_model/tickets_model/tickets_model.dart';
import 'package:flutterturizm/product/utility/base/mainbase/tickets_base/tickets_base.dart';
import 'package:flutterturizm/product/widget/text_widget/label_medium_text.dart';

import '../../../tickets/widget/ticketlist_widget.dart';

class FastTicketFilteringView extends StatefulWidget {
  const FastTicketFilteringView({
    super.key,
    required this.modelService,
  });

  final TicketsModelService modelService;

  @override
  State<FastTicketFilteringView> createState() =>
      _FastTicketFilteringViewState();
}

class _FastTicketFilteringViewState
    extends MainTicketsBase<FastTicketFilteringView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
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
          text: "Biletler",
          textAlign: TextAlign.center,
        ),
      ),
      body: Column(
        children: <Widget>[
          buildTicketListWidget,
        ],
      ),
    );
  }

  // ticket list
  Widget get buildTicketListWidget => FilterTicketListWidget(
        modelService: widget.modelService,
        routerService: routerService,
      );
}
