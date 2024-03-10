import 'package:flutter/widgets.dart';
import 'package:flutterturizm/product/constant/color_constant.dart';
import 'package:flutterturizm/product/enums/logregpass_enums/password_enum/password_enum.dart';
import 'package:flutterturizm/product/widget/text_widget/label_medium_text.dart';
import 'package:kartal/kartal.dart';

class PasswordResetEmailButtonWidget extends StatelessWidget {
  const PasswordResetEmailButtonWidget({
    super.key,
    required this.sendMail,
    required this.maxWidth,
    required this.dynamicHeight,
  });
  final dynamic sendMail;
  final dynamic maxWidth;
  final dynamic dynamicHeight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding.verticalLow,
      child: GestureDetector(
        onTap: () {
          sendMail();
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
              text: PasswordViewStrings.sendMailButtonText.value,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
