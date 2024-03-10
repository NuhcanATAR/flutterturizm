import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterturizm/product/bloc/logregpass_bloc/login_bloc/cubit/cubit.dart';
import 'package:flutterturizm/product/bloc/logregpass_bloc/login_bloc/state/state.dart';
import 'package:flutterturizm/product/constant/color_constant.dart';
import 'package:flutterturizm/product/constant/icon_constant.dart';
import 'package:flutterturizm/product/enums/logregpass_enums/register_enum/register_enum.dart';
import 'package:flutterturizm/product/widget/text_widget/label_medium_text.dart';
import 'package:kartal/kartal.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class EmailLoginGoogleLoginButtonsWidget extends StatelessWidget {
  const EmailLoginGoogleLoginButtonsWidget({
    super.key,
    required this.registerRouterService,
    required this.signInGoogleAuthListenerBloc,
  });

  final dynamic registerRouterService;
  final dynamic signInGoogleAuthListenerBloc;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding.verticalLow,
      child: Row(
        children: <Widget>[
          // email login button
          Flexible(
            fit: FlexFit.tight,
            flex: 1,
            child: GestureDetector(
              onTap: () {
                registerRouterService.loginViewNavigatorRouter(context);
              },
              child: Container(
                margin: context.padding.onlyRightLow,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: MainAppColorConstants.blueMainColor,
                    width: 0.7,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(4),
                  ),
                ),
                padding: context.padding.low,
                child: Row(
                  children: <Widget>[
                    Icon(
                      MdiIcons.account,
                      color: MainAppColorConstants.blueMainColor,
                      size: 25,
                    ),
                    Expanded(
                      child: LabelMediumMainColorText(
                        text: RegisterViewStrings.emailLoginBtnText.value,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // google login button
          Flexible(
            fit: FlexFit.tight,
            flex: 1,
            child: BlocConsumer<AuthSignInCubit, AuthSignInMainState>(
              listener: signInGoogleAuthListenerBloc,
              builder: (context, state) {
                return GestureDetector(
                  onTap: () {
                    BlocProvider.of<AuthSignInCubit>(context)
                        .signInWithGoogle();
                  },
                  child: Container(
                    margin: context.padding.onlyLeftLow,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: MainAppColorConstants.blueMainColor,
                        width: 0.7,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(4),
                      ),
                    ),
                    padding: context.padding.low,
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          width: 25,
                          height: 25,
                          child: AppLogRegPassIconConstants.googleMailcon.toImg,
                        ),
                        Expanded(
                          child: LabelMediumBlackText(
                            text: RegisterViewStrings.googleLoginBtnText.value,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
