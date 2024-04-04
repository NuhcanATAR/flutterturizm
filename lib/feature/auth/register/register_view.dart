import 'package:flutter/material.dart';
import 'package:flutterturizm/feature/auth/register/widget/dateofbirth_widget.dart';
import 'package:flutterturizm/feature/auth/register/widget/email_widget.dart';
import 'package:flutterturizm/feature/auth/register/widget/emaillogingoogleloginbutton_widget.dart';
import 'package:flutterturizm/feature/auth/register/widget/gendertype_widget.dart';
import 'package:flutterturizm/feature/auth/register/widget/identificationnumber_widget.dart';
import 'package:flutterturizm/feature/auth/register/widget/namesurname_widget.dart';
import 'package:flutterturizm/feature/auth/register/widget/password_widget.dart';
import 'package:flutterturizm/feature/auth/register/widget/passwordagain_widget.dart';
import 'package:flutterturizm/feature/auth/register/widget/phonenumber_widget.dart';
import 'package:flutterturizm/feature/auth/register/widget/registerbutton_widget.dart';
import 'package:flutterturizm/feature/auth/register/widget/titlesubtitle_widget.dart';
import 'package:flutterturizm/feature/auth/register/widget/useragreement_widget.dart';
import 'package:flutterturizm/product/constant/color_constant.dart';
import 'package:flutterturizm/product/enums/logregpass_enums/register_enum/register_enum.dart';
import 'package:flutterturizm/product/utility/base/auth_base/register_base/register_base.dart';
import 'package:flutterturizm/product/widget/text_widget/label_medium_text.dart';
import 'package:kartal/kartal.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends MainRegisterBase<RegisterView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: MainAppColorConstants.blueMainColor,
            size: 18,
          ),
        ),
        title: const LabelMediumMainColorText(
          text: "Kayıt Ol",
          textAlign: TextAlign.center,
        ),
      ),
      body: Form(
        key: registerModelService.formRegisterKey,
        child: Padding(
          padding: context.padding.low,
          child: Center(
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                // email login & google login
                buildEmailLoginGoogleLoginButtonsWidget,
                // title & sub title
                buildTitleSubTitleWidget,
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
                // email
                buildEmailInputWidget,
                // password
                buildPasswordInputWidget,
                // password again
                buildPasswordAgainInputWidget,
                // user agreement
                buildUserAgreementWidget,
                // register button
                buildRegisterButtonWidget,
              ],
            ),
          ),
        ),
      ),
    );
  }

  // email login & google login
  Widget get buildEmailLoginGoogleLoginButtonsWidget =>
      EmailLoginGoogleLoginButtonsWidget(
        registerRouterService: registerRouterService,
        signInGoogleAuthListenerBloc: signInGoogleAuthListenerBloc,
      );

  // title & sub title
  Widget get buildTitleSubTitleWidget => RegisterTitleSubTitleWidget(
        dynamicViewExtensions: dynamicViewExtensions,
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

  // email
  Widget get buildEmailInputWidget => RegisterEmailInputWidget(
        registerModelService: registerModelService,
      );

  // password
  Widget get buildPasswordInputWidget => RegisterPasswordInputWidget(
        registerModelService: registerModelService,
      );

  // password again
  Widget get buildPasswordAgainInputWidget => RegisterPasswordAgainInputWidget(
        registerModelService: registerModelService,
      );

  // user agreement
  Widget get buildUserAgreementWidget => RegisterUserAgreementWidget(
        dynamicViewExtensions: dynamicViewExtensions,
        registerModelService: registerModelService,
      );

  // register button
  Widget get buildRegisterButtonWidget => RegisterButtonWidget(
        signInUpListenerBloc: signInUpListenerBloc,
        registerModelService: registerModelService,
        dynamicViewExtensions: dynamicViewExtensions,
      );
}
