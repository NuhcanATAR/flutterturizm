import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterturizm/feature/main/profile/view/phonenumberedit/widget/phonenumberinput_widget.dart';
import 'package:flutterturizm/feature/main/profile/view/phonenumberedit/widget/savebutton_widget.dart';
import 'package:flutterturizm/product/bloc/mainview_bloc/profile_bloc/cubit/cubit.dart';
import 'package:flutterturizm/product/bloc/mainview_bloc/profile_bloc/state/state.dart';
import 'package:flutterturizm/product/constant/color_constant.dart';
import 'package:flutterturizm/product/model/auth_model/currentuser_model/currentuser_model.dart';
import 'package:flutterturizm/product/utility/base/mainbase/profile_base/profile_base.dart';
import 'package:flutterturizm/product/widget/text_widget/label_medium_text.dart';
import 'package:kartal/kartal.dart';

class PhoneNumberEditView extends StatefulWidget {
  const PhoneNumberEditView({
    super.key,
    required this.userModel,
  });

  final CurrentUserModel? userModel;

  @override
  State<PhoneNumberEditView> createState() => _PhoneNumberEditViewState();
}

class _PhoneNumberEditViewState extends ProfileBase<PhoneNumberEditView> {
  late TextEditingController phoneNumberController = TextEditingController(
    text: widget.userModel!.phoneNumber.toString(),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainAppColorConstants.backgroundColor,
      appBar: AppBar(
        backgroundColor: MainAppColorConstants.backgroundColor,
        centerTitle: true,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: MainAppColorConstants.blueMainColor,
            size: 21,
          ),
        ),
        title: const LabelMediumMainColorText(
          text: "Telefon Numarasını Düzenle",
          textAlign: TextAlign.center,
        ),
      ),
      body: buildBodyWidget,
    );
  }

  Widget get buildBodyWidget => BlocConsumer<ProfileCubit, ProfileState>(
        listener: profileEditListener,
        builder: (context, state) {
          return Form(
            key: modelService.formProfileKey,
            child: Padding(
              padding: context.padding.low,
              child: ListView(
                children: <Widget>[
                  // phone number
                  buildPhoneNumberInputWidget,
                  // save
                  buildSaveButtonWidget,
                ],
              ),
            ),
          );
        },
      );

  // phone number
  Widget get buildPhoneNumberInputWidget => PhoneNumberInputWidget(
        phoneNumberController: phoneNumberController,
        modelService: modelService,
      );

  // save button
  Widget get buildSaveButtonWidget => SavePhoneNumberButtonWidget(
        modelService: modelService,
        dynamicViewExtensions: dynamicViewExtensions,
        phoneNumberController: phoneNumberController,
      );
}
