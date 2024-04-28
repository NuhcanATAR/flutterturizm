import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterturizm/product/bloc/mainview_bloc/profile_bloc/cubit/cubit.dart';
import 'package:flutterturizm/product/constant/color_constant.dart';
import 'package:flutterturizm/product/model/auth_model/currentuser_model/currentuser_model.dart';
import 'package:flutterturizm/product/model/main_model/profile_model/profile_model.dart';
import 'package:flutterturizm/product/utility/dynamicextension/dynamicextension.dart';
import 'package:flutterturizm/product/widget/text_widget/label_medium_text.dart';

class ProfileEditSaveButtonWidget extends StatelessWidget {
  const ProfileEditSaveButtonWidget({
    super.key,
    required this.modelService,
    required this.userModel,
    required this.identificationNumberController,
    required this.nameController,
    required this.surnameController,
    required this.dateOfBirthDay,
    required this.dateOfBirthMonth,
    required this.dateOfBirthYear,
    required this.dynamicViewExtensions,
  });

  final ProfileModelService modelService;
  final CurrentUserModel? userModel;
  final TextEditingController identificationNumberController;
  final TextEditingController nameController;
  final TextEditingController surnameController;
  final int dateOfBirthDay;
  final int dateOfBirthMonth;
  final int dateOfBirthYear;
  final DynamicViewExtensions dynamicViewExtensions;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (modelService.formProfileKey.currentState!.validate()) {
          BlocProvider.of<ProfileCubit>(context).profileEdit(
            nameController.text,
            surnameController.text,
            int.parse(
              identificationNumberController.text,
            ),
            dateOfBirthDay,
            dateOfBirthMonth,
            dateOfBirthYear,
          );
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
            text: "Güncelle",
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
