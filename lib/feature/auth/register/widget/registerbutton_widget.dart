import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterturizm/product/bloc/logregpass_bloc/register_bloc/cubit/cubit.dart';
import 'package:flutterturizm/product/bloc/logregpass_bloc/register_bloc/state/state.dart';
import 'package:flutterturizm/product/enums/logregpass_enums/register_enum/register_enum.dart';
import 'package:flutterturizm/product/widget/text_widget/label_medium_text.dart';
import 'package:kartal/kartal.dart';

import '../../../../product/constant/color_constant.dart';

class RegisterButtonWidget extends StatelessWidget {
  const RegisterButtonWidget({
    super.key,
    required this.signInUpListenerBloc,
    required this.registerUser,
    required this.maxWidth,
    required this.dynamicHeight,
  });

  final dynamic signInUpListenerBloc;
  final dynamic registerUser;
  final dynamic maxWidth;
  final dynamic dynamicHeight;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthSignInUpCubit, SignInUpMainState>(
      listener: signInUpListenerBloc,
      builder: (context, state) {
        return Padding(
          padding: context.padding.onlyBottomLow,
          child: GestureDetector(
            onTap: () {
              registerUser();
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
                  text: RegisterViewStrings.registerButtonText.value,
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
