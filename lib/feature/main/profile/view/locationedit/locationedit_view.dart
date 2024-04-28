import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterturizm/feature/main/profile/view/locationedit/widget/footerbutton_widget.dart';
import 'package:flutterturizm/product/bloc/mainview_bloc/profile_bloc/cubit/cubit.dart';
import 'package:flutterturizm/product/bloc/mainview_bloc/profile_bloc/state/state.dart';
import 'package:flutterturizm/product/constant/color_constant.dart';
import 'package:flutterturizm/product/model/auth_model/currentuser_model/currentuser_model.dart';
import 'package:flutterturizm/product/utility/base/mainbase/profile_base/profile_base.dart';
import 'package:kartal/kartal.dart';

import '../../../../../product/enums/logregpass_enums/register_enum/register_enum.dart';
import '../../../../../product/widget/text_widget/label_medium_text.dart';

class LocationEditView extends StatefulWidget {
  const LocationEditView({
    super.key,
    required this.userModel,
  });

  final CurrentUserModel? userModel;

  @override
  State<LocationEditView> createState() => _LocationEditViewState();
}

class _LocationEditViewState extends ProfileBase<LocationEditView> {
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
          text: "Şehir İlçe Güncelle",
          textAlign: TextAlign.center,
        ),
      ),
      body: BlocConsumer<ProfileCubit, ProfileState>(
        listener: profileEditListener,
        builder: (context, state) {
          return Form(
            key: modelService.formProfileKey,
            child: Padding(
              padding: context.padding.low,
              child: Column(
                children: <Widget>[
                  // body
                  buildBodyWidget,
                  // footer button
                  buildFooterButtonWidget,
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // body
  Widget get buildBodyWidget => Expanded(
        child: modelService.cityDistricts == null
            ? const SizedBox()
            : ListView(
                children: <Widget>[
                  // city
                  buildCityInputWidget,
                  // district
                  buildDistrictInputWidget,
                ],
              ),
      );

  // city
  Widget get buildCityInputWidget => Container(
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
          validator: (value) => value == null ? "Şehir Seçiniz!" : null,
          value: modelService.selectCity,
          hint: LabelMediumGreyText(
            text: RegisterViewStrings.cityInputText.value,
            textAlign: TextAlign.left,
          ),
          onChanged: (String? value) {
            setState(() {
              modelService.selectCity = value;
              modelService.selectDistrict = null;
            });
          },
          items: modelService.cityDistricts!.keys.map((String city) {
            return DropdownMenuItem<String>(
              value: city,
              child: LabelMediumBlackText(
                text: city,
                textAlign: TextAlign.left,
              ),
            );
          }).toList(),
        ),
      );

  // district
  Widget get buildDistrictInputWidget => Container(
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
          validator: (value) => value == null ? "İlçe Seçiniz!" : null,
          value: modelService.selectDistrict,
          onChanged: (String? value) {
            setState(() {
              modelService.selectDistrict = value;
            });
          },
          items: modelService.selectCity == null
              ? null
              : modelService.cityDistricts![modelService.selectCity!]!
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
      );

  // footer button
  Widget get buildFooterButtonWidget => FooterEditSaveButtonWidget(
        modelService: modelService,
        dynamicViewExtensions: dynamicViewExtensions,
      );
}
