import 'package:flutter/material.dart';
import 'package:flutterturizm/product/enums/logregpass_enums/register_enum/register_enum.dart';
import 'package:flutterturizm/product/widget/text_widget/label_medium_text.dart';
import 'package:kartal/kartal.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class RegisterDateOfBirthInputWidget extends StatelessWidget {
  const RegisterDateOfBirthInputWidget({
    super.key,
    required this.registerModelService,
    required this.selectDateOfBirth,
  });
  final dynamic registerModelService;
  final dynamic selectDateOfBirth;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        selectDateOfBirth(context);
      },
      child: Container(
        margin: context.padding.verticalLow,
        padding: context.padding.normal,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.2),
          borderRadius: const BorderRadius.all(
            Radius.circular(4),
          ),
        ),
        child: Row(
          children: <Widget>[
            Icon(
              MdiIcons.calendar,
              color: Colors.grey,
              size: 20,
            ),
            Expanded(
              child: Padding(
                padding: context.padding.horizontalLow,
                child: LabelMediumBlackText(
                  text:
                      "${RegisterViewStrings.dateOfBirthInputText.value}:   ${registerModelService.dateOfBirth.day}.${registerModelService.dateOfBirth.month}.${registerModelService.dateOfBirth.year}",
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
