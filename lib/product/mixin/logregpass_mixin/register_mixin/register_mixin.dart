import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterturizm/product/bloc/logregpass_bloc/register_bloc/cubit/cubit.dart';
import 'package:flutterturizm/product/constant/color_constant.dart';
import 'package:flutterturizm/product/enums/logregpass_enums/register_enum/register_enum.dart';
import 'package:flutterturizm/product/model/auth_model/register_model/register_model.dart';
import 'package:flutterturizm/product/widget/text_widget/label_medium_text.dart';

mixin RegisterMixin {
  // user register
  void registerUser(
    BuildContext context,
    RegisterModelService registerModelService,
  ) {
    if (registerModelService.formRegisterKey.currentState!.validate()) {
      final registerModel = registerModelService;

      if (registerModel.formRegisterKey.currentState!.validate()) {
        final name = registerModel.nameController.text;
        final surname = registerModel.surnameController.text;
        final idNumber = registerModel.identificationNumberController.text;
        final phoneNumber = registerModel.phoneNumberController.text;
        final email = registerModel.emailController.text;
        final password = registerModel.passwordController.text;
        final passwordAgain = registerModel.passwordAgainController.text;

        if (name.isNotEmpty &&
            surname.isNotEmpty &&
            idNumber.isNotEmpty &&
            phoneNumber.isNotEmpty &&
            email.isNotEmpty &&
            password.isNotEmpty &&
            passwordAgain.isNotEmpty) {
          if (password == passwordAgain) {
            if (phoneNumber.length < 10) {
              showSnackBar(
                context,
                RegisterViewStrings.phoneNumberErrorText.value,
              );
            } else {
              final gender = registerModel.genderType == GenderType.men
                  ? "Erkek"
                  : "Kadın";
              BlocProvider.of<AuthSignInUpCubit>(context).signInUp(
                name,
                surname,
                email,
                password,
                int.parse(idNumber),
                registerModel.selectCity.toString(),
                registerModel.selectDistrict.toString(),
                int.parse(phoneNumber),
                registerModel.dateOfBirth.day,
                registerModel.dateOfBirth.month,
                registerModel.dateOfBirth.year,
                gender,
              );
            }
          } else {
            showSnackBar(context, RegisterViewStrings.passwordErrorText.value);
          }
        } else {
          showSnackBar(
            context,
            RegisterViewStrings.registerFormErrorText.value,
          );
        }
      }
    }
  }

  void showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(
      backgroundColor: MainAppColorConstants.blueMainColor,
      content: LabelMediumWhiteText(
        text: message,
        textAlign: TextAlign.left,
      ),
      action: SnackBarAction(
        onPressed: () {},
        label: "Tamam",
        textColor: Colors.white,
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
