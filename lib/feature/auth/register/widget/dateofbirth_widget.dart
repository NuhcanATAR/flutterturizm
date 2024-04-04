import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:flutterturizm/product/enums/logregpass_enums/register_enum/register_enum.dart';
import 'package:flutterturizm/product/model/auth_model/register_model/register_model.dart';
import 'package:flutterturizm/product/widget/text_widget/label_medium_text.dart';
import 'package:kartal/kartal.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class RegisterDateOfBirthInputWidget extends StatefulWidget {
  const RegisterDateOfBirthInputWidget({
    super.key,
    required this.registerModelService,
  });
  final RegisterModelService registerModelService;

  @override
  State<RegisterDateOfBirthInputWidget> createState() =>
      _RegisterDateOfBirthInputWidgetState();
}

class _RegisterDateOfBirthInputWidgetState
    extends State<RegisterDateOfBirthInputWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        DatePicker.showDatePicker(
          context,
          showTitleActions: true,
          onConfirm: (date) {
            final DateTime selectedDateTime = DateTime(
              date.year,
              date.month,
              date.day,
            );

            setState(() {
              widget.registerModelService.dateOfBirth = selectedDateTime;
            });
          },
          currentTime: DateTime.now(),
          locale: LocaleType.tr,
        );
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
                      "${RegisterViewStrings.dateOfBirthInputText.value}:   ${widget.registerModelService.dateOfBirth.day}.${widget.registerModelService.dateOfBirth.month}.${widget.registerModelService.dateOfBirth.year}",
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
