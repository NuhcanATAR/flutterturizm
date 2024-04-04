import 'package:flutter/material.dart';
import 'package:flutterturizm/product/enums/logregpass_enums/register_enum/register_enum.dart';
import 'package:flutterturizm/product/model/auth_model/register_model/register_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';

class RegisterNameSurnameInputWidget extends StatelessWidget {
  const RegisterNameSurnameInputWidget({
    super.key,
    required this.registerModelService,
  });

  final RegisterModelService registerModelService;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding.verticalLow,
      child: Row(
        children: <Widget>[
          // name
          Flexible(
            fit: FlexFit.tight,
            flex: 1,
            child: Container(
              margin: context.padding.onlyRightLow,
              padding: context.padding.horizontalLow,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                borderRadius: const BorderRadius.all(
                  Radius.circular(4),
                ),
              ),
              child: TextFormField(
                controller: registerModelService.nameController,
                style: GoogleFonts.nunito(
                  textStyle: context.general.textTheme.labelMedium?.copyWith(
                    color: Colors.black,
                  ),
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: RegisterViewStrings.nameInputText.value,
                  hintStyle: GoogleFonts.nunito(
                    textStyle: context.general.textTheme.labelMedium?.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
          ),
          // surname
          Flexible(
            fit: FlexFit.tight,
            flex: 1,
            child: Container(
              margin: context.padding.onlyLeftLow,
              padding: context.padding.horizontalLow,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                borderRadius: const BorderRadius.all(
                  Radius.circular(4),
                ),
              ),
              child: TextFormField(
                controller: registerModelService.surnameController,
                style: GoogleFonts.nunito(
                  textStyle: context.general.textTheme.labelMedium?.copyWith(
                    color: Colors.black,
                  ),
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: RegisterViewStrings.surnameInputText.value,
                  hintStyle: GoogleFonts.nunito(
                    textStyle: context.general.textTheme.labelMedium?.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
