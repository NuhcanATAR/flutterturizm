import 'package:flutter/material.dart';
import 'package:flutterturizm/product/constant/color_constant.dart';
import 'package:flutterturizm/product/enums/logregpass_enums/register_enum/register_enum.dart';
import 'package:flutterturizm/product/widget/text_widget/label_medium_text.dart';
import 'package:kartal/kartal.dart';

class RegisterUserAgreementWidget extends StatelessWidget {
  const RegisterUserAgreementWidget({
    super.key,
    required this.maxWidth,
    required this.registerModelService,
  });
  final dynamic maxWidth;
  final dynamic registerModelService;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding.verticalLow,
      child: FormField(
        builder: (fieldStatus) {
          return Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Checkbox(
                    activeColor: MainAppColorConstants.blueMainColor,
                    value: registerModelService.isAgreementCheckStatus,
                    onChanged: (value) {
                      registerModelService.isAgreementCheckStatus = value!;
                      fieldStatus.didChange(value);
                    },
                  ),
                  Expanded(
                    child: LabelMediumBlackText(
                      text: RegisterViewStrings.userAgreementText.value,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
              // error message
              SizedBox(
                width: maxWidth,
                child: LabelMediumRedText(
                  text: fieldStatus.errorText ?? '',
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          );
        },
        validator: (value) {
          if (!registerModelService.isAgreementCheckStatus) {
            return RegisterViewStrings.userAgreementErrorText.value;
          }
          return null;
        },
      ),
    );
  }
}
