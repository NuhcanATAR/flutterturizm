import 'package:flutter/material.dart';
import 'package:flutterturizm/product/enums/logregpass_enums/login_enum/login_enum.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';

class LoginPasswordInputWidget extends StatefulWidget {
  const LoginPasswordInputWidget({
    super.key,
    required this.loginModelService,
  });

  final dynamic loginModelService;

  @override
  State<LoginPasswordInputWidget> createState() =>
      _LoginPasswordInputWidgetState();
}

class _LoginPasswordInputWidgetState extends State<LoginPasswordInputWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: context.padding.horizontalLow,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        borderRadius: const BorderRadius.all(
          Radius.circular(4),
        ),
      ),
      child: TextFormField(
        keyboardType: TextInputType.visiblePassword,
        obscureText: widget.loginModelService.isPasswordHideStatus,
        style: GoogleFonts.nunito(
          textStyle: context.general.textTheme.labelMedium?.copyWith(
            color: Colors.black,
          ),
        ),
        controller: widget.loginModelService.passwordController,
        decoration: InputDecoration(
          border: InputBorder.none,
          icon: const Icon(
            Icons.password_outlined,
            color: Colors.grey,
            size: 18,
          ),
          hintText: LoginViewStrings.loginPasswordInputText.value,
          hintStyle: GoogleFonts.nunito(
            textStyle: context.general.textTheme.labelMedium?.copyWith(
              color: Colors.grey,
            ),
          ),
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                widget.loginModelService.isPasswordHideStatus =
                    !widget.loginModelService.isPasswordHideStatus;
              });
            },
            icon: Icon(
              widget.loginModelService.isPasswordHideStatus
                  ? Icons.visibility
                  : Icons.visibility_off,
              color: Colors.grey,
              size: 18,
            ),
          ),
        ),
      ),
    );
  }
}
