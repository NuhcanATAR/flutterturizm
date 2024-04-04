// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterturizm/feature/auth/login/login_view.dart';
import 'package:flutterturizm/feature/auth/register/widget/dateofbirth_widget.dart';
import 'package:flutterturizm/feature/auth/register/widget/gendertype_widget.dart';
import 'package:flutterturizm/feature/auth/register/widget/identificationnumber_widget.dart';
import 'package:flutterturizm/feature/auth/register/widget/namesurname_widget.dart';
import 'package:flutterturizm/feature/auth/register/widget/phonenumber_widget.dart';
import 'package:flutterturizm/feature/auth/register/widget/useragreement_widget.dart';
import 'package:flutterturizm/product/bloc/logregpass_bloc/register_bloc/cubit/cubit.dart';
import 'package:flutterturizm/product/bloc/logregpass_bloc/register_bloc/state/state.dart';
import 'package:flutterturizm/product/constant/color_constant.dart';
import 'package:flutterturizm/product/enums/logregpass_enums/register_enum/register_enum.dart';
import 'package:flutterturizm/product/utility/base/auth_base/register_base/register_base.dart';
import 'package:flutterturizm/product/utility/service/firebase/firebase_service.dart';
import 'package:flutterturizm/product/widget/text_widget/label_medium_text.dart';
import 'package:kartal/kartal.dart';

class RegisterCompleteView extends StatefulWidget {
  const RegisterCompleteView({super.key});

  @override
  State<RegisterCompleteView> createState() => _RegisterCompleteViewState();
}

class _RegisterCompleteViewState
    extends MainRegisterBase<RegisterCompleteView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const LabelMediumMainColorText(
          text: "Gerekli Bilgileri Tamamla",
          textAlign: TextAlign.center,
        ),
        actions: [
          GestureDetector(
            onTap: () async {
              await FirebaseService().googleSignIn.signOut().then((value) {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginView(),
                  ),
                  (Route<dynamic> route) => false,
                );
              });
            },
            child: Padding(
              padding: context.padding.horizontalLow,
              child: const Icon(
                Icons.exit_to_app,
                color: Colors.redAccent,
                size: 21,
              ),
            ),
          ),
        ],
      ),
      body: BlocConsumer<AuthSignInUpCubit, SignInUpMainState>(
        listener: signInCompleteListenerBloc,
        builder: (context, state) {
          return Padding(
            padding: context.padding.low,
            child: Column(
              children: <Widget>[
                // main body
                buildMainBodyWidget,
                // footer button
                buildFooterButtonWidget,
              ],
            ),
          );
        },
      ),
    );
  }

  // main body
  Widget get buildMainBodyWidget => Expanded(
        child: Form(
          key: registerModelService.formRegisterKey,
          child: ListView(
            children: <Widget>[
              // name surname
              buildNameSurnameInputWidget,
              // identification number
              buildIdentificationNumberInputWidget,
              // city district
              buildCityDistrictInputWidget,
              // phone number
              buildPhoneNumberInputWidget,
              // date of birth
              buildDateOfBirthInputWidget,
              // gender
              buildGenderTypeWidget,

              // user agreement
              buildUserAgreementWidget,
            ],
          ),
        ),
      );

  // name surname
  Widget get buildNameSurnameInputWidget => RegisterNameSurnameInputWidget(
        registerModelService: registerModelService,
      );

  // identification number
  Widget get buildIdentificationNumberInputWidget =>
      RegiterIdentificationNumberInputWidget(
        registerModelService: registerModelService,
      );

  // city district
  Widget get buildCityDistrictInputWidget =>
      registerModelService.cityDistricts == null
          ? const SizedBox()
          : Column(
              children: <Widget>[
                // city
                Container(
                  margin: context.padding.verticalLow,
                  padding: context.padding.horizontalLow,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(4),
                    ),
                  ),
                  child: DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      icon: Icon(
                        Icons.location_on,
                        color: Colors.grey,
                        size: 18,
                      ),
                    ),
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black,
                      size: 21,
                    ),
                    value: registerModelService.selectCity,
                    hint: LabelMediumGreyText(
                      text: RegisterViewStrings.cityInputText.value,
                      textAlign: TextAlign.left,
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        registerModelService.selectCity = value;
                        registerModelService.selectDistrict = null;
                      });
                    },
                    items: registerModelService.cityDistricts!.keys
                        .map((String city) {
                      return DropdownMenuItem<String>(
                        value: city,
                        child: LabelMediumBlackText(
                          text: city,
                          textAlign: TextAlign.left,
                        ),
                      );
                    }).toList(),
                  ),
                ),
                // district
                Container(
                  margin: context.padding.verticalLow,
                  padding: context.padding.horizontalLow,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(4),
                    ),
                  ),
                  child: DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      icon: Icon(
                        Icons.location_on,
                        color: Colors.grey,
                        size: 18,
                      ),
                    ),
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black,
                      size: 21,
                    ),
                    hint: LabelMediumGreyText(
                      text: RegisterViewStrings.districtInputText.value,
                      textAlign: TextAlign.left,
                    ),
                    value: registerModelService.selectDistrict,
                    onChanged: (String? value) {
                      setState(() {
                        registerModelService.selectDistrict = value;
                      });
                    },
                    items: registerModelService.selectCity == null
                        ? null
                        : registerModelService
                            .cityDistricts![registerModelService.selectCity!]!
                            .map((String district) {
                            return DropdownMenuItem<String>(
                              value: district,
                              child: LabelMediumBlackText(
                                text: district,
                                textAlign: TextAlign.left,
                              ),
                            );
                          }).toList(),
                  ),
                ),
              ],
            );

  // phone number
  Widget get buildPhoneNumberInputWidget => RegisterPhoneNumberInputWidget(
        registerModelService: registerModelService,
      );

  // date of birth
  Widget get buildDateOfBirthInputWidget => RegisterDateOfBirthInputWidget(
        registerModelService: registerModelService,
      );

  // gender
  Widget get buildGenderTypeWidget => RegisterGenderTypeWidget(
        registerModelService: registerModelService,
      );

  // user agreement
  Widget get buildUserAgreementWidget => RegisterUserAgreementWidget(
        dynamicViewExtensions: dynamicViewExtensions,
        registerModelService: registerModelService,
      );

  // footer button
  Widget get buildFooterButtonWidget => Padding(
        padding: context.padding.verticalLow,
        child: GestureDetector(
          onTap: () {
            if (registerModelService.formRegisterKey.currentState!.validate()) {
              registerComplete();
            }
          },
          child: SizedBox(
            width: dynamicViewExtensions.maxWidth(context),
            height: dynamicViewExtensions.dynamicHeight(context, 0.07),
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: MainAppColorConstants.blueMainColor,
                borderRadius: const BorderRadius.all(
                  Radius.circular(4),
                ),
              ),
              child: const LabelMediumWhiteText(
                text: "Kayıtı Tamamla",
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      );
}
