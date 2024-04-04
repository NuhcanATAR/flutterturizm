import 'package:flutter/widgets.dart';
import 'package:flutterturizm/product/constant/color_constant.dart';
import 'package:flutterturizm/product/enums/logregpass_enums/password_enum/password_enum.dart';
import 'package:flutterturizm/product/mixin/logregpass_mixin/password_mixin/password_mixin.dart';
import 'package:flutterturizm/product/model/auth_model/password_model/password_model.dart';
import 'package:flutterturizm/product/utility/dynamicextension/dynamicextension.dart';
import 'package:flutterturizm/product/widget/text_widget/label_medium_text.dart';
import 'package:kartal/kartal.dart';

class PasswordResetEmailButtonWidget extends StatelessWidget
    with PasswordMixin {
  const PasswordResetEmailButtonWidget({
    super.key,
    required this.dynamicViewExtensions,
    required this.passwordModelService,
  });

  final DynamicViewExtensions dynamicViewExtensions;
  final PasswordModelService passwordModelService;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding.verticalLow,
      child: GestureDetector(
        onTap: () {
          sendMail(
            context,
            passwordModelService,
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
              text: PasswordViewStrings.sendMailButtonText.value,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
