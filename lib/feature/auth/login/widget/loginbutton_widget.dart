import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterturizm/product/bloc/logregpass_bloc/login_bloc/cubit/cubit.dart';
import 'package:flutterturizm/product/bloc/logregpass_bloc/login_bloc/state/state.dart';
import 'package:flutterturizm/product/constant/color_constant.dart';
import 'package:flutterturizm/product/enums/logregpass_enums/login_enum/login_enum.dart';
import 'package:flutterturizm/product/widget/text_widget/label_medium_text.dart';
import 'package:kartal/kartal.dart';

class LoginButtonWidget extends StatelessWidget {
  const LoginButtonWidget({
    super.key,
    required this.signInEmailPasswordListenerBloc,
    required this.loginEmailAndPasswordAuth,
    required this.maxWidth,
    required this.dynamicHeight,
  });

  final dynamic signInEmailPasswordListenerBloc;
  final dynamic loginEmailAndPasswordAuth;
  final dynamic maxWidth;
  final dynamic dynamicHeight;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthSignInCubit, AuthSignInMainState>(
      listener: signInEmailPasswordListenerBloc,
      builder: (context, state) {
        return Padding(
          padding: context.padding.verticalLow,
          child: GestureDetector(
            onTap: () {
              loginEmailAndPasswordAuth();
            },
            child: SizedBox(
              width: maxWidth,
              height: dynamicHeight(0.07),
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: MainAppColorConstants.blueMainColor,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(4),
                  ),
                ),
                child: LabelMediumWhiteText(
                  text: LoginViewStrings.loginButtonText.value,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
