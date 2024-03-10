import 'package:flutter/material.dart';
import 'package:flutterturizm/product/enums/logregpass_enums/register_enum/register_enum.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';

class RegiterIdentificationNumberInputWidget extends StatelessWidget {
  const RegiterIdentificationNumberInputWidget({
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
      child: TextFormField(
        keyboardType: TextInputType.number,
        controller: registerModelService.identificationNumberController,
        style: GoogleFonts.nunito(
          textStyle: context.general.textTheme.labelMedium?.copyWith(
            color: Colors.black,
          ),
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: RegisterViewStrings.identificationNumberInputText.value,
          hintStyle: GoogleFonts.nunito(
            textStyle: context.general.textTheme.labelMedium?.copyWith(
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
