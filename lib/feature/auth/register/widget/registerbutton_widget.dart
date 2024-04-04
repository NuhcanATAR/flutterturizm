import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterturizm/product/bloc/logregpass_bloc/register_bloc/cubit/cubit.dart';
import 'package:flutterturizm/product/bloc/logregpass_bloc/register_bloc/state/state.dart';
import 'package:flutterturizm/product/enums/logregpass_enums/register_enum/register_enum.dart';
import 'package:flutterturizm/product/mixin/logregpass_mixin/register_mixin/register_mixin.dart';
import 'package:flutterturizm/product/model/auth_model/register_model/register_model.dart';
import 'package:flutterturizm/product/utility/dynamicextension/dynamicextension.dart';
import 'package:flutterturizm/product/widget/text_widget/label_medium_text.dart';
import 'package:kartal/kartal.dart';

import '../../../../product/constant/color_constant.dart';

class RegisterButtonWidget extends StatelessWidget with RegisterMixin {
  const RegisterButtonWidget({
    super.key,
    required this.signInUpListenerBloc,
    required this.registerModelService,
    required this.dynamicViewExtensions,
  });

  final dynamic signInUpListenerBloc;
  final RegisterModelService registerModelService;
  final DynamicViewExtensions dynamicViewExtensions;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthSignInUpCubit, SignInUpMainState>(
      listener: signInUpListenerBloc,
      builder: (context, state) {
        return Padding(
          padding: context.padding.onlyBottomLow,
          child: GestureDetector(
            onTap: () {
              registerUser(
                context,
                registerModelService,
              );
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
