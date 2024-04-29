import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:flutterturizm/product/bloc/logregpass_bloc/register_bloc/cubit/cubit.dart';
import 'package:flutterturizm/product/enums/logregpass_enums/register_enum/register_enum.dart';
import 'package:flutterturizm/product/mixin/logregpass_mixin/login_mixin/loginbloc_mixin.dart';
import 'package:flutterturizm/product/mixin/logregpass_mixin/register_mixin/register_mixin.dart';
import 'package:flutterturizm/product/mixin/logregpass_mixin/register_mixin/registerbloc_mixin.dart';
import 'package:flutterturizm/product/model/auth_model/register_model/register_model.dart';
import 'package:flutterturizm/product/model/connection_model/connection_model.dart';
import 'package:flutterturizm/product/router/auth_router/register_router/register_router.dart';
import 'package:flutterturizm/product/utility/dynamicextension/dynamicextension.dart';
import 'package:flutterturizm/product/utility/service/citydistrict_service/citydistrict_service.dart';

abstract class MainRegisterBase<T extends StatefulWidget> extends State<T>
    with AuthSignInUpBlocMixin, AuthSingInBlocMixin, RegisterMixin {
  // router service
  RegisterRouterService registerRouterService = RegisterRouterService();

  // view size
  DynamicViewExtensions dynamicViewExtensions = DynamicViewExtensions();

  @override
  void initState() {
    super.initState();
    getCityDistrictApi();
    ConnectionControlModel().checkConnection(context);
  }

  // get city distirct api
  Future<void> getCityDistrictApi() async {
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
  void selectDateOfBirth(BuildContext context) {
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
          registerModelService.dateOfBirth = selectedDateTime;
        });
      },
      currentTime: DateTime.now(),
      locale: LocaleType.tr,
    );
  }

  void registerComplete() {
    if (registerModelService.formRegisterKey.currentState!.validate()) {
      final registerModel = registerModelService;

      if (registerModel.formRegisterKey.currentState!.validate()) {
        final name = registerModel.nameController.text;
        final surname = registerModel.surnameController.text;
        final idNumber = registerModel.identificationNumberController.text;
        final phoneNumber = registerModel.phoneNumberController.text;

        if (name.isNotEmpty &&
            surname.isNotEmpty &&
            idNumber.isNotEmpty &&
            phoneNumber.isNotEmpty) {
          final gender =
              registerModel.genderType == GenderType.men ? "Erkek" : "Kadın";
          BlocProvider.of<AuthSignInUpCubit>(context).registerComplete(
            name,
            surname,
            int.parse(idNumber),
            registerModel.selectCity.toString(),
            registerModel.selectDistrict.toString(),
            int.parse(phoneNumber),
            registerModel.dateOfBirth.day,
            registerModel.dateOfBirth.month,
            registerModel.dateOfBirth.year,
            gender,
          );
        } else {
          showSnackBar(
            context,
            RegisterViewStrings.registerFormErrorText.value,
          );
        }
      }
    }
  }
}
