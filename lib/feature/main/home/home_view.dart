import 'package:flutter/material.dart';
import 'package:flutterturizm/feature/main/home/widget/advertsslider_widget.dart';
import 'package:flutterturizm/feature/main/home/widget/ticketfiltercard_widget.dart';
import 'package:flutterturizm/product/constant/color_constant.dart';
import 'package:flutterturizm/product/enums/main_enums/home_enum/home_enum.dart';
import 'package:flutterturizm/product/utility/base/mainbase/home_base/home_base.dart';
import 'package:flutterturizm/product/widget/text_widget/body_medium_text.dart';
import 'package:flutterturizm/product/widget/text_widget/label_medium_text.dart';
import 'package:kartal/kartal.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends MainHomeBase<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainAppColorConstants.backgroundColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        titleSpacing: 15,
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
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 3),
                              child: LabelMediumWhiteText(
                                text: HomeViewStrings.appBarWelcomeText.value
                                    .toString(),
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
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // ticket filter card
            buildTicketFilterCardWidget,
            // adverts slider
            buildAdvertsSliderWidget,
            // last tickets received cards
            buildLastTicketsReceivedCardsWidget,
          ],
        ),
      ),
    );
  }

  // ticket filter card
  Widget get buildTicketFilterCardWidget => HomeTicketFilterCardWidget(
        homeModelService: homeModelService,
        dynamicViewExtensions: dynamicViewExtensions,
      );

  // adverts slider
  Widget get buildAdvertsSliderWidget => AdvertsSliderWidget(
        dynamicViewExtensions: dynamicViewExtensions,
        responseAdverts: responseAdverts,
      );

  // last tickets received cards
  Widget get buildLastTicketsReceivedCardsWidget => const SizedBox();
}
