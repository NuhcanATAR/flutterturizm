import 'package:flutter/material.dart';
import 'package:flutterturizm/product/enums/logregpass_enums/login_enum/login_enum.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';

class LoginEmailInputWidget extends StatelessWidget {
  const LoginEmailInputWidget({
    super.key,
    required this.loginModelService,
  });

  final dynamic loginModelService;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
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
        controller: loginModelService.emailController,
        validator: loginModelService.emailValidator,
        decoration: InputDecoration(
          border: InputBorder.none,
          icon: const Icon(
            Icons.email_outlined,
            color: Colors.grey,
            size: 18,
          ),
          hintText: LoginViewStrings.loginEmailInputText.value,
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
