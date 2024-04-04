import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterturizm/product/bloc/logregpass_bloc/login_bloc/cubit/cubit.dart';
import 'package:flutterturizm/product/bloc/logregpass_bloc/login_bloc/state/state.dart';
import 'package:flutterturizm/product/constant/color_constant.dart';
import 'package:flutterturizm/product/enums/logregpass_enums/login_enum/login_enum.dart';
import 'package:flutterturizm/product/mixin/logregpass_mixin/login_mixin/login_mixin.dart';
import 'package:flutterturizm/product/model/auth_model/login_model/login_model.dart';
import 'package:flutterturizm/product/utility/dynamicextension/dynamicextension.dart';
import 'package:flutterturizm/product/widget/text_widget/label_medium_text.dart';
import 'package:kartal/kartal.dart';

class LoginButtonWidget extends StatelessWidget with LoginMixin {
  const LoginButtonWidget({
    super.key,
    required this.signInEmailPasswordListenerBloc,
    required this.loginModelService,
    required this.dynamicViewExtensions,
  });

  final dynamic signInEmailPasswordListenerBloc;
  final LoginModelService loginModelService;
  final DynamicViewExtensions dynamicViewExtensions;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthSignInCubit, AuthSignInMainState>(
      listener: signInEmailPasswordListenerBloc,
      builder: (context, state) {
        return Padding(
          padding: context.padding.verticalLow,
          child: GestureDetector(
            onTap: () {
              loginEmailAndPasswordAuth(context, loginModelService);
            },
            child: SizedBox(
              width: dynamicViewExtensions.maxWidth(context),
              height: dynamicViewExtensions.dynamicHeight(context, 0.07),
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
