import 'package:flutter/material.dart';
import 'package:flutterturizm/product/constant/color_constant.dart';
import 'package:flutterturizm/product/enums/logregpass_enums/register_enum/register_enum.dart';
import 'package:flutterturizm/product/model/auth_model/register_model/register_model.dart';
import 'package:flutterturizm/product/utility/dynamicextension/dynamicextension.dart';
import 'package:flutterturizm/product/widget/text_widget/label_medium_text.dart';
import 'package:kartal/kartal.dart';

class RegisterUserAgreementWidget extends StatelessWidget {
  const RegisterUserAgreementWidget({
    super.key,
    required this.dynamicViewExtensions,
    required this.registerModelService,
  });
  final DynamicViewExtensions dynamicViewExtensions;
  final RegisterModelService registerModelService;

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
                width: dynamicViewExtensions.maxWidth(context),
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
