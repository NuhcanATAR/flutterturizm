import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterturizm/product/bloc/mainview_bloc/profile_bloc/cubit/cubit.dart';
import 'package:flutterturizm/product/constant/color_constant.dart';
import 'package:flutterturizm/product/model/main_model/profile_model/profile_model.dart';
import 'package:flutterturizm/product/utility/dynamicextension/dynamicextension.dart';
import 'package:flutterturizm/product/widget/text_widget/label_medium_text.dart';

class FooterEditSaveButtonWidget extends StatelessWidget {
  const FooterEditSaveButtonWidget({
    super.key,
    required this.modelService,
    required this.dynamicViewExtensions,
  });

  final ProfileModelService modelService;
  final DynamicViewExtensions dynamicViewExtensions;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (modelService.formProfileKey.currentState!.validate()) {
          BlocProvider.of<ProfileCubit>(context).locationEdit(
            modelService.selectCity.toString(),
            modelService.selectDistrict.toString(),
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
