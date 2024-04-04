import 'package:flutter/material.dart';
import 'package:flutterturizm/product/constant/color_constant.dart';
import 'package:flutterturizm/product/enums/logregpass_enums/register_enum/register_enum.dart';
import 'package:flutterturizm/product/model/auth_model/register_model/register_model.dart';
import 'package:flutterturizm/product/widget/text_widget/label_medium_text.dart';
import 'package:kartal/kartal.dart';

class RegisterGenderTypeWidget extends StatefulWidget {
  const RegisterGenderTypeWidget({
    super.key,
    required this.registerModelService,
  });
  final RegisterModelService registerModelService;

  @override
  State<RegisterGenderTypeWidget> createState() =>
      _RegisterGenderTypeWidgetState();
}

class _RegisterGenderTypeWidgetState extends State<RegisterGenderTypeWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding.verticalLow,
      child: Row(
        children: <Widget>[
          // men
          Flexible(
            fit: FlexFit.tight,
            flex: 1,
            child: Padding(
              padding: context.padding.onlyRightLow,
              child: ListTile(
                leading: Radio<GenderType>(
                  activeColor: MainAppColorConstants.blueMainColor,
                  value: GenderType.men,
                  groupValue: widget.registerModelService.genderType,
                  onChanged: (GenderType? valueGender) {
                    setState(() {
                      widget.registerModelService.genderType = valueGender;
                    });
                  },
                ),
                title: LabelMediumBlackText(
                  text: RegisterViewStrings.genderTypeMenText.value,
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          ),
          // women
          Flexible(
            fit: FlexFit.tight,
            flex: 1,
            child: Padding(
              padding: context.padding.onlyRightLow,
              child: ListTile(
                leading: Radio<GenderType>(
                  activeColor: MainAppColorConstants.blueMainColor,
                  value: GenderType.women,
                  groupValue: widget.registerModelService.genderType,
                  onChanged: (GenderType? valueGender) {
                    setState(() {
                      widget.registerModelService.genderType = valueGender;
                    });
                  },
                ),
                title: LabelMediumBlackText(
                  text: RegisterViewStrings.genderTypeWomenText.value,
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
