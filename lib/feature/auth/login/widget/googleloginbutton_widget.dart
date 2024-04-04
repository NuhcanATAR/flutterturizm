import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterturizm/product/bloc/logregpass_bloc/login_bloc/cubit/cubit.dart';
import 'package:flutterturizm/product/bloc/logregpass_bloc/login_bloc/state/state.dart';
import 'package:flutterturizm/product/constant/icon_constant.dart';
import 'package:flutterturizm/product/enums/logregpass_enums/login_enum/login_enum.dart';
import 'package:flutterturizm/product/mixin/logregpass_mixin/login_mixin/login_mixin.dart';
import 'package:flutterturizm/product/utility/dynamicextension/dynamicextension.dart';
import 'package:flutterturizm/product/widget/text_widget/label_medium_text.dart';
import 'package:kartal/kartal.dart';

class LoginGoogleLoginButtonWidget extends StatelessWidget with LoginMixin {
  const LoginGoogleLoginButtonWidget({
    super.key,
    required this.signInGoogleAuthListenerBloc,
    required this.dynamicViewExtensions,
  });

  final dynamic signInGoogleAuthListenerBloc;

  final DynamicViewExtensions dynamicViewExtensions;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthSignInCubit, AuthSignInMainState>(
      listener: signInGoogleAuthListenerBloc,
      builder: (context, state) {
        return Padding(
          padding: context.padding.verticalLow,
          child: GestureDetector(
            onTap: () {
              googleLoginButton(context);
            },
            child: SizedBox(
              width: dynamicViewExtensions.maxWidth(context),
              height: dynamicViewExtensions.dynamicHeight(context, 0.07),
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
