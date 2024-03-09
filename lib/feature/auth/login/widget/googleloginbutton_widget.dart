import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterturizm/product/bloc/logregpass_bloc/login_bloc/cubit/cubit.dart';
import 'package:flutterturizm/product/bloc/logregpass_bloc/login_bloc/state/state.dart';
import 'package:flutterturizm/product/constant/icon_constant.dart';
import 'package:flutterturizm/product/enums/logregpass_enums/login_enum/login_enum.dart';
import 'package:flutterturizm/product/widget/text_widget/label_medium_text.dart';
import 'package:kartal/kartal.dart';

class LoginGoogleLoginButtonWidget extends StatelessWidget {
  const LoginGoogleLoginButtonWidget({
    super.key,
    required this.signInGoogleAuthListenerBloc,
    required this.googleLoginButton,
    required this.maxWidth,
    required this.dynamicHeight,
  });

  final dynamic signInGoogleAuthListenerBloc;
  final dynamic googleLoginButton;
  final dynamic maxWidth;
  final dynamic dynamicHeight;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthSignInCubit, AuthSignInMainState>(
      listener: signInGoogleAuthListenerBloc,
      builder: (context, state) {
        return Padding(
          padding: context.padding.verticalLow,
          child: GestureDetector(
            onTap: () {
              googleLoginButton();
            },
            child: SizedBox(
              width: maxWidth,
              height: dynamicHeight(0.07),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(4),
                  ),
                ),
                padding: context.padding.horizontalLow,
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 30,
                      height: 30,
                      child: AppLogRegPassIconConstants.googleMailcon.toImg,
                    ),
                    Expanded(
                      child: LabelMediumBlackText(
                        text: LoginViewStrings.loginGoogleAuthButtonText.value,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
