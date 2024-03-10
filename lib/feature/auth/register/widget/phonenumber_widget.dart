// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutterturizm/product/enums/logregpass_enums/register_enum/register_enum.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:kartal/kartal.dart';

class RegisterPhoneNumberInputWidget extends StatelessWidget {
  const RegisterPhoneNumberInputWidget({
    super.key,
    required this.registerModelService,
  });
  final dynamic registerModelService;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: context.padding.verticalLow,
        padding: context.padding.horizontalLow,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.2),
          borderRadius: const BorderRadius.all(
            Radius.circular(4),
          ),
        ),
        child: IntlPhoneField(
          controller: registerModelService.phoneNumberController,
          style: GoogleFonts.nunito(
            textStyle: context.general.textTheme.labelMedium?.copyWith(
              color: Colors.black,
            ),
          ),
          dropdownIcon: const Icon(
            Icons.call,
            color: Colors.grey,
            size: 18,
          ),
          searchText: "Ülke Arayın",
          decoration: InputDecoration(
            hintText: RegisterViewStrings.phoneNumberInputText.value,
            hintStyle: GoogleFonts.nunito(
              textStyle: context.general.textTheme.labelMedium?.copyWith(
                color: Colors.grey,
              ),
            ),
            border: InputBorder.none,
            counterText: '',
          ),
          initialCountryCode: 'TR',
        ));
  }
}
