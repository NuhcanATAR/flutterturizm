// ignore_for_file: overridden_fields, annotate_overrides

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterturizm/product/bloc/logregpass_bloc/register_bloc/cubit/cubit.dart';
import 'package:flutterturizm/product/constant/color_constant.dart';
import 'package:flutterturizm/product/enums/logregpass_enums/register_enum/register_enum.dart';
import 'package:flutterturizm/product/extension/view_extension.dart';
import 'package:flutterturizm/product/mixin/logregpass_mixin/login_mixin/login_mixin.dart';
import 'package:flutterturizm/product/mixin/logregpass_mixin/register_mixin/register_mixin.dart';
import 'package:flutterturizm/product/model/auth_model/register_model/register_model.dart';
import 'package:flutterturizm/product/router/auth_router/register_router/register_router.dart';
import 'package:flutterturizm/product/utility/service/citydistrict_service/citydistrict_service.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:flutterturizm/product/widget/text_widget/label_medium_text.dart';

abstract class MainRegisterBase<T extends StatefulWidget> extends State<T>
    with AuthSignInUpBlocMixin, AuthSingInBlocMixin {
  // model service
  RegisterModelService registerModelService = RegisterModelService();

  // router service
  RegisterRouterService registerRouterService = RegisterRouterService();

  // view size
  double dynamicWidth(double value) => maxWidth * value;
  double dynamicHeight(double value) => maxHeight * value;

  late final maxWidth = ViewSizeModelExtension(context).mediaSize.width;
  late final maxHeight = ViewSizeModelExtension(context).mediaSize.height;

  @override
  void initState() {
    super.initState();
    getCityDistrictApi();
  }

  // get city distirct api
  void getCityDistrictApi() async {
    final serviceApi = CityDistrictService(registerModelService.apiUrl);
    try {
      final allCityDistirctsList = await serviceApi.fetchAllCityDistricts();
      setState(() {
        registerModelService.cityDistricts = allCityDistirctsList;
      });
    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
    }
  }

  // date of birth
  Future<void> selectDateOfBirth(BuildContext context) async {
    DatePicker.showDatePicker(
      context,
      showTitleActions: true,
      onConfirm: (date) {
        DateTime selectedDateTime = DateTime(
          date.year,
          date.month,
          date.day,
        );

        setState(() {
          registerModelService.dateOfBirth = selectedDateTime;
        });
      },
      currentTime: DateTime.now(),
      locale: LocaleType.tr,
    );
  }

  // user register
  void registerUser() {
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
          if (idNumber.length < 11) {
            showSnackBar(
                context, RegisterViewStrings.identificationIDErrorText.value);
          } else if (phoneNumber.length < 10) {
            showSnackBar(
                context, RegisterViewStrings.phoneNumberErrorText.value);
          } else {
            final gender =
                registerModel.genderType == GenderType.men ? "Erkek" : "Kadın";
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
        showSnackBar(context, RegisterViewStrings.registerFormErrorText.value);
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
