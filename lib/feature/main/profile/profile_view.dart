import 'package:flutter/material.dart';
import 'package:flutterturizm/feature/main/profile/widget/accountmenus_widget.dart';
import 'package:flutterturizm/feature/main/profile/widget/accountsettingsmenus_widget.dart';
import 'package:flutterturizm/feature/main/profile/widget/citydistrictcard_widget.dart';
import 'package:flutterturizm/feature/main/profile/widget/profilecard_widget.dart';
import 'package:flutterturizm/feature/main/profile/widget/shareappcard_widget.dart';
import 'package:flutterturizm/feature/main/profile/widget/ticketmenus_widget.dart';
import 'package:flutterturizm/product/constant/color_constant.dart';
import 'package:flutterturizm/product/model/auth_model/currentuser_model/currentuser_model.dart';
import 'package:flutterturizm/product/utility/base/mainbase/profile_base/profile_base.dart';
import 'package:flutterturizm/product/widget/text_widget/label_medium_text.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends ProfileBase<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainAppColorConstants.backgroundColor,
      appBar: AppBar(
        backgroundColor: MainAppColorConstants.blueMainColor,
        centerTitle: true,
        title: const LabelMediumWhiteText(
          text: "Profil",
          textAlign: TextAlign.center,
        ),
      ),
      body: FutureBuilder(
        future: getUserInformation(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const SizedBox();
          }

          if (snapshot.connectionState == ConnectionState.done) {
            final CurrentUserModel? currentUserValue = snapshot.data;
            return ListView(
              children: <Widget>[
                // profile card
                buildProfileCardWidget(
                  context,
                  currentUserValue,
                ),
                // city district
                buildCityDistrictCardWidget(
                  context,
                  currentUserValue,
                ),
                // share app
                buildShareAppCardWidget,
                // account menus
                buildAccountMenusWidget(
                  context,
                  currentUserValue,
                ),
                // ticket menus
                buildTicketMenusWidget(
                  context,
                  currentUserValue,
                ),
                // account setting menus
                buildAccountSettingMenusWidget(currentUserValue!.accountType),
              ],
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }

  // profile card
  Widget buildProfileCardWidget(
    BuildContext context,
    CurrentUserModel? currentUserValue,
  ) =>
      ProfileCardWidget(
        currentUserValue: currentUserValue,
        dynamicViewExtensions: dynamicViewExtensions,
      );

  // city district
  Widget buildCityDistrictCardWidget(
    BuildContext context,
    CurrentUserModel? currentUserValue,
  ) =>
      CityDistrictCardWidget(
        currentUserValue: currentUserValue,
        dynamicViewExtensions: dynamicViewExtensions,
      );

  // share app
  Widget get buildShareAppCardWidget => const ShareAppCardWidget();

  // account menus
  Widget buildAccountMenusWidget(
    BuildContext context,
    CurrentUserModel? userModel,
  ) =>
      AccountMenusWidget(
        userModel: userModel,
        dynamicViewExtensions: dynamicViewExtensions,
        routerService: routerService,
      );

  // ticket menus
  Widget buildTicketMenusWidget(
    BuildContext context,
    CurrentUserModel? userModel,
  ) =>
      TicketMenusWidget(
        userModel: userModel,
        dynamicViewExtensions: dynamicViewExtensions,
        routerService: routerService,
      );

  // account setting menus
  Widget buildAccountSettingMenusWidget(String accountType) =>
      AccountSettingsMenusWidget(
        accountType: accountType,
        dynamicViewExtensions: dynamicViewExtensions,
        routerService: routerService,
      );
}
