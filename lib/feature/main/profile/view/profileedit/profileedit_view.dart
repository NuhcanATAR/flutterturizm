import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:flutterturizm/feature/main/profile/view/profileedit/widget/indetificationinput_widget.dart';
import 'package:flutterturizm/feature/main/profile/view/profileedit/widget/namesurnameinput_widget.dart';
import 'package:flutterturizm/feature/main/profile/view/profileedit/widget/savebutton_widget.dart';
import 'package:flutterturizm/product/bloc/mainview_bloc/profile_bloc/cubit/cubit.dart';
import 'package:flutterturizm/product/bloc/mainview_bloc/profile_bloc/state/state.dart';
import 'package:flutterturizm/product/constant/color_constant.dart';
import 'package:flutterturizm/product/model/auth_model/currentuser_model/currentuser_model.dart';
import 'package:flutterturizm/product/utility/base/mainbase/profile_base/profile_base.dart';
import 'package:flutterturizm/product/widget/text_widget/label_medium_text.dart';
import 'package:kartal/kartal.dart';

class ProfileEditView extends StatefulWidget {
  const ProfileEditView({
    super.key,
    required this.userModel,
  });

  final CurrentUserModel? userModel;

  @override
  State<ProfileEditView> createState() => _ProfileEditViewState();
}

class _ProfileEditViewState extends ProfileBase<ProfileEditView> {
  late TextEditingController identificationNumberController =
      TextEditingController(
    text: widget.userModel!.identificationId.toString(),
  );

  late TextEditingController nameController = TextEditingController(
    text: widget.userModel!.name,
  );

  late TextEditingController surnameController = TextEditingController(
    text: widget.userModel!.surname,
  );
  late int dateOfBirthDay = widget.userModel!.dateOfBirthDay;
  late int dateOfBirthMonth = widget.userModel!.dateOfBirthMonth;
  late int dateOfBirthYear = widget.userModel!.dateOfBirthYear;

  late DateTime dateTime =
      DateTime(dateOfBirthYear, dateOfBirthMonth, dateOfBirthDay);
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
          text: "Profil",
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
                  // identification number
                  buildIdentificationNumberInputWidget,
                  // name surname
                  buildNameSurnameInputWidget,
                  // date of birth
                  buildDateOfBirthWidget,
                  // save
                  buildSaveButtonWidget,
                ],
              ),
            ),
          );
        },
      );

  Widget get buildIdentificationNumberInputWidget => IdentificationInputWidget(
        identificationController: identificationNumberController,
        modelService: modelService,
      );

  // name surname
  Widget get buildNameSurnameInputWidget => NameSurnameInputWidget(
        nameController: nameController,
        surnameController: surnameController,
        modelService: modelService,
      );

  // date of birth
  Widget get buildDateOfBirthWidget => Padding(
        padding: context.padding.onlyBottomNormal,
        child: Container(
          padding: context.padding.normal,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.3),
            borderRadius: const BorderRadius.all(
              Radius.circular(4),
            ),
          ),
          child: GestureDetector(
            onTap: () {
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
                    dateTime = selectedDateTime;
                    dateOfBirthDay = dateTime.day;
                    dateOfBirthMonth = dateTime.month;
                    dateOfBirthYear = dateTime.year;
                  });
                },
                currentTime: DateTime.now(),
                locale: LocaleType.tr,
              );
            },
            child: Row(
              children: <Widget>[
                const Icon(
                  Icons.date_range,
                  color: Colors.black,
                  size: 21,
                ),
                Expanded(
                  child: Padding(
                    padding: context.padding.horizontalLow,
                    child: LabelMediumBlackText(
                      text:
                          "${dateOfBirthDay.toInt()}.${dateOfBirthMonth.toInt()}.${dateOfBirthYear.toInt()}",
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  // save
  Widget get buildSaveButtonWidget => ProfileEditSaveButtonWidget(
        modelService: modelService,
        userModel: widget.userModel,
        identificationNumberController: identificationNumberController,
        nameController: nameController,
        surnameController: surnameController,
        dateOfBirthDay: dateOfBirthDay,
        dateOfBirthMonth: dateOfBirthMonth,
        dateOfBirthYear: dateOfBirthYear,
        dynamicViewExtensions: dynamicViewExtensions,
      );
}
