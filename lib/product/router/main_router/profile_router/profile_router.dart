// ignore_for_file: use_build_context_synchronously
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterturizm/feature/auth/login/login_view.dart';
import 'package:flutterturizm/feature/auth/register/register_view.dart';
import 'package:flutterturizm/feature/main/profile/view/locationedit/locationedit_view.dart';
import 'package:flutterturizm/feature/main/profile/view/mytickets/mytickets_view.dart';
import 'package:flutterturizm/feature/main/profile/view/mytickets/view/evaluationcreate/evaluationcreate_view.dart';
import 'package:flutterturizm/feature/main/profile/view/mytickets/view/ticketdetail/ticketdetail_view.dart';
import 'package:flutterturizm/feature/main/profile/view/phonenumberedit/phonenumberedit_view.dart';
import 'package:flutterturizm/feature/main/profile/view/profileedit/profileedit_view.dart';
import 'package:flutterturizm/product/constant/color_constant.dart';
import 'package:flutterturizm/product/enums/main_enums/profile_enum/profile_enum.dart';
import 'package:flutterturizm/product/model/auth_model/currentuser_model/currentuser_model.dart';
import 'package:flutterturizm/product/model/main_model/tickets_model/myticketlist_model.dart';
import 'package:flutterturizm/product/widget/text_widget/label_medium_text.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfileRouterService {
  // profile edit view router
  void profileEditViewNavigatorRouter(
    BuildContext context,
    CurrentUserModel? userModel,
  ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProfileEditView(
          userModel: userModel,
        ),
      ),
    );
  }

  // location edit view router
  void locationEditViewNavigatorRouter(
    BuildContext context,
    CurrentUserModel? userModel,
  ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LocationEditView(
          userModel: userModel,
        ),
      ),
    );
  }

  // phone number edit view router
  void phoneNumberEditViewNavigatorRouter(
    BuildContext context,
    CurrentUserModel? userModel,
  ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PhoneNumberEditView(
          userModel: userModel,
        ),
      ),
    );
  }

  // my tickets view router
  void myTicketsViewNavigatorRouter(
    BuildContext context,
    CurrentUserModel? userModel,
  ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MyTicketsView(
          userModel: userModel,
        ),
      ),
    );
  }

  // my ticket detail view router
  void myTicketDetailViewNavigatorRouter(
    BuildContext context,
    MyTickets myTickets,
  ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TicketDetailView(
          myTickets: myTickets,
        ),
      ),
    );
  }

  // new account view router
  void newAccountViewNavigatorRouter(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const RegisterView(),
      ),
    );
  }

  // exit account view router
  void exitAccountViewNavigatorRouter(
    BuildContext context,
    String accountType,
  ) {
    final AlertDialog alertDialog = AlertDialog(
      title: const Icon(
        Icons.exit_to_app,
        color: Colors.redAccent,
        size: 40,
      ),
      content: LabelMediumBlackText(
        text: ProfileViewStrings.exitDialogTitleText.value,
        textAlign: TextAlign.center,
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateColor.resolveWith(
              (states) => MainAppColorConstants.blueMainColor,
            ),
          ),
          child: const LabelMediumWhiteText(
            text: "Vazgeç",
            textAlign: TextAlign.center,
          ),
        ),
        ElevatedButton(
          onPressed: () async {
            Navigator.pop(context);
            if (accountType == "EMAILAUTH") {
              await FirebaseAuth.instance.signOut().then((value) {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginView(),
                  ),
                  (Route<dynamic> route) => false,
                );
              });
            } else if (accountType == "GOOGLEAUTH") {
              await GoogleSignIn().signOut().then((value) {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginView(),
                  ),
                  (route) => false,
                );
              });
            }
            return;
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateColor.resolveWith(
              (states) => Colors.redAccent,
            ),
          ),
          child: const LabelMediumWhiteText(
            text: "Çıkış Yap",
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
    showDialog(context: context, builder: (context) => alertDialog);
  }

  // evaluation create view router
  void evaluationCreateViewNavigatorRouter(
      BuildContext context, MyTickets myTickets) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EvaluationCreateView(
          myTickets: myTickets,
        ),
      ),
    );
  }
}
