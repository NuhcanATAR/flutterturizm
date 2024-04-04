import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterturizm/feature/main/tickets/view/tickercreate/widget/footerbutton_widget.dart';
import 'package:flutterturizm/feature/main/tickets/view/tickercreate/widget/seatselectcard_widget.dart';
import 'package:flutterturizm/feature/main/tickets/view/tickercreate/widget/ticketdetailinfocard_widget.dart';
import 'package:flutterturizm/product/bloc/mainview_bloc/tickets_bloc/cubit/ticketcreate_cubit.dart';
import 'package:flutterturizm/product/bloc/mainview_bloc/tickets_bloc/state/ticketcreate_state.dart';
import 'package:flutterturizm/product/constant/color_constant.dart';
import 'package:flutterturizm/product/model/main_model/tickets_model/ticketdateslist_model.dart';
import 'package:flutterturizm/product/model/main_model/tickets_model/ticketslist_model.dart';
import 'package:flutterturizm/product/utility/base/mainbase/tickets_base/tickets_base.dart';
import 'package:flutterturizm/product/widget/text_widget/body_medium_text.dart';
import 'package:flutterturizm/product/widget/text_widget/label_medium_text.dart';
import 'package:flutterturizm/product/widget/widget/topappbar_widget.dart';
import 'package:kartal/kartal.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class TicketCreateView extends StatefulWidget {
  const TicketCreateView({
    super.key,
    required this.ticket,
    required this.ticketDates,
  });

  final Tickets ticket;
  final TicketDates ticketDates;

  @override
  State<TicketCreateView> createState() => _TicketCreateViewState();
}

class _TicketCreateViewState extends MainTicketsBase<TicketCreateView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainAppColorConstants.backgroundColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        titleSpacing: 15,
        automaticallyImplyLeading: false,
        toolbarHeight: dynamicViewExtensions.dynamicHeight(context, 0.1),
        title: Row(
          children: <Widget>[
            SizedBox(
              width: 40,
              height: 40,
              child: Container(
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(4),
                  ),
                ),
                child: Icon(
                  MdiIcons.accountCircleOutline,
                  color: Colors.grey,
                  size: 30,
                ),
              ),
            ),
            // name surname
            Expanded(
              child: Padding(
                padding: context.padding.horizontalLow,
                child: FutureBuilder(
                  future: getUserInformation(),
                  builder: (BuildContext context, snapshot) {
                    if (snapshot.hasError) {
                      return const SizedBox();
                    }

                    if (snapshot.connectionState == ConnectionState.done) {
                      final currentUserValue = snapshot.data;
                      return Column(
                        children: <Widget>[
                          // welcome
                          SizedBox(
                            width: dynamicViewExtensions.maxWidth(context),
                            child: const Padding(
                              padding: EdgeInsets.only(bottom: 3),
                              child: LabelMediumWhiteText(
                                text: "Hoşgeldiniz 👋",
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),
                          // name surname
                          SizedBox(
                            width: dynamicViewExtensions.maxWidth(context),
                            child: Padding(
                              padding: context.padding.onlyBottomLow,
                              child: BodyMediumWhiteBoldText(
                                text:
                                    "${currentUserValue!.name} ${currentUserValue.surname} ",
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),
                        ],
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: context.padding.horizontalNormal,
            child: GestureDetector(
              onTap: () {},
              child: const Icon(
                Icons.notifications_outlined,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ],
      ),
      body: BlocConsumer<TicketCreateCubit, TicketCreateState>(
        listener: ticketCreateListenerBloc,
        builder: (context, state) {
          return Column(
            children: <Widget>[
              // top
              buildTopWidget,
              // body
              buildBodyWidget,
              // footer
              buildFooterWidget,
            ],
          );
        },
      ),
    );
  }

  // top
  Widget get buildTopWidget => TopAppBarWidget(
        ticket: widget.ticket,
      );

  // body
  Widget get buildBodyWidget => Expanded(
        flex: 3,
        child: Padding(
          padding: context.padding.low,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                // ticket detail information
                buildTicketDetailInformationCardWidget,
                // seat select card
                buildSeatSelectCardWidget,
              ],
            ),
          ),
        ),
      );

  // ticket detail information
  Widget get buildTicketDetailInformationCardWidget =>
      TicketDetailInformationCardWidget(
        ticket: widget.ticket,
        ticketDates: widget.ticketDates,
        dynamicViewExtensions: dynamicViewExtensions,
      );

  // seat select card
  Widget get buildSeatSelectCardWidget => SeatSelectCardWidget(
        ticketDates: widget.ticketDates,
        modelService: modelService,
      );

  // footer
  Widget get buildFooterWidget => TicketCreateFooterButtonWidget(
        dynamicViewExtensions: dynamicViewExtensions,
        ticket: widget.ticket,
        ticketDates: widget.ticketDates,
        modelService: modelService,
      );
}
