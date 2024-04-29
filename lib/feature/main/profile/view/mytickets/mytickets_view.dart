import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutterturizm/feature/main/profile/view/mytickets/widget/canceledticketslist_widget.dart';
import 'package:flutterturizm/feature/main/profile/view/mytickets/widget/journeycompletedticketslist_widget.dart';
import 'package:flutterturizm/feature/main/profile/view/mytickets/widget/newticketslist_widget.dart';
import 'package:flutterturizm/feature/main/profile/view/mytickets/widget/onthejourneyticketslist_widget.dart';
import 'package:flutterturizm/product/constant/color_constant.dart';
import 'package:flutterturizm/product/enums/main_enums/profile_enum/profile_enum.dart';
import 'package:flutterturizm/product/model/auth_model/currentuser_model/currentuser_model.dart';
import 'package:flutterturizm/product/utility/base/mainbase/profile_base/profile_base.dart';
import 'package:flutterturizm/product/widget/text_widget/label_medium_text.dart';

class MyTicketsView extends StatefulWidget {
  const MyTicketsView({
    super.key,
    required this.userModel,
  });

  final CurrentUserModel? userModel;

  @override
  State<MyTicketsView> createState() => _MyTicketsViewState();
}

class _MyTicketsViewState extends ProfileBase<MyTicketsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: MainAppColorConstants.blueMainColor,
            size: 21,
          ),
        ),
        title: const LabelMediumMainColorText(
          text: "Biletlerim",
          textAlign: TextAlign.center,
        ),
      ),
      body: ContainedTabBarView(
        tabs: [
          LabelMediumMainColorText(
            text: ProfileViewStrings.myTicketsListTabbarText1.value,
            textAlign: TextAlign.center,
          ),
          LabelMediumMainColorText(
            text: ProfileViewStrings.myTicketsListTabbarText2.value,
            textAlign: TextAlign.center,
          ),
          LabelMediumMainColorText(
            text: ProfileViewStrings.myTicketsListTabbarText3.value,
            textAlign: TextAlign.center,
          ),
          LabelMediumMainColorText(
            text: ProfileViewStrings.myTicketsListTabbarText4.value,
            textAlign: TextAlign.center,
          ),
        ],
        tabBarProperties: TabBarProperties(
          indicatorColor: MainAppColorConstants.blueMainColor,
        ),
        views: [
          // new tickets
          NewTicketsListWidget(
            routerService: routerService,
          ),
          // cancaled ticket
          CanceledTicketsListWidget(
            routerService: routerService,
          ),
          // on the journey ticket
          OnTheJourneyTicketsListWidget(
            routerService: routerService,
          ),
          // journey completed ticket
          JourneyCompletedTicketsListWidget(
            routerService: routerService,
          ),
        ],
      ),
    );
  }
}
