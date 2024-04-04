import 'package:flutter/material.dart';
import 'package:flutterturizm/product/enums/logregpass_enums/register_enum/register_enum.dart';
import 'package:flutterturizm/product/model/auth_model/register_model/register_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';

class RegisterEmailInputWidget extends StatelessWidget {
  const RegisterEmailInputWidget({
    super.key,
    required this.registerModelService,
  });

  final RegisterModelService registerModelService;

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
        keyboardType: TextInputType.emailAddress,
        controller: registerModelService.emailController,
        validator: registerModelService.emailValidator,
        style: GoogleFonts.nunito(
          textStyle: context.general.textTheme.labelMedium?.copyWith(
            color: Colors.black,
          ),
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: RegisterViewStrings.emailInputText.value,
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
