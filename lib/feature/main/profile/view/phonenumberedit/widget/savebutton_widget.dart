import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterturizm/product/bloc/mainview_bloc/profile_bloc/cubit/cubit.dart';
import 'package:flutterturizm/product/constant/color_constant.dart';
import 'package:flutterturizm/product/model/main_model/profile_model/profile_model.dart';
import 'package:flutterturizm/product/utility/dynamicextension/dynamicextension.dart';
import 'package:flutterturizm/product/widget/text_widget/label_medium_text.dart';

class SavePhoneNumberButtonWidget extends StatelessWidget {
  const SavePhoneNumberButtonWidget({
    super.key,
    required this.modelService,
    required this.dynamicViewExtensions,
    required this.phoneNumberController,
  });

  final ProfileModelService modelService;
  final DynamicViewExtensions dynamicViewExtensions;
  final TextEditingController phoneNumberController;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (modelService.formProfileKey.currentState!.validate()) {
          BlocProvider.of<ProfileCubit>(context).phoneNumberEdit(
            int.parse(
              phoneNumberController.text,
            ),
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
