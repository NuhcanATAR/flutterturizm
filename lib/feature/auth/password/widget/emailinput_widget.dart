import 'package:flutter/material.dart';
import 'package:flutterturizm/product/enums/logregpass_enums/password_enum/password_enum.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';

class PasswordEmailInputWidget extends StatelessWidget {
  const PasswordEmailInputWidget({
    super.key,
    required this.passwordModelService,
  });

  final dynamic passwordModelService;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: context.padding.horizontalLow,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        borderRadius: const BorderRadius.all(
          Radius.circular(4),
        ),
      ),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        style: GoogleFonts.nunito(
          textStyle: context.general.textTheme.labelMedium?.copyWith(
            color: Colors.black,
          ),
        ),
        controller: passwordModelService.emailController,
        validator: passwordModelService.emailValidator,
        decoration: InputDecoration(
          border: InputBorder.none,
          icon: const Icon(
            Icons.email_outlined,
            color: Colors.grey,
            size: 18,
          ),
          hintText: PasswordViewStrings.emailInputText.value,
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
