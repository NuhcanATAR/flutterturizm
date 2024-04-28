import 'package:flutter/material.dart';
import 'package:flutterturizm/product/model/main_model/profile_model/profile_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';

class NameSurnameInputWidget extends StatelessWidget {
  const NameSurnameInputWidget({
    super.key,
    required this.nameController,
    required this.surnameController,
    required this.modelService,
  });

  final TextEditingController nameController;
  final TextEditingController surnameController;
  final ProfileModelService modelService;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding.onlyBottomLow,
      child: Row(
        children: <Widget>[
          // name
          Flexible(
            fit: FlexFit.tight,
            flex: 1,
            child: Padding(
              padding: context.padding.onlyRightLow,
              child: Container(
                padding: context.padding.horizontalLow,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.3),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(4),
                  ),
                ),
                child: TextFormField(
                  controller: nameController,
                  validator: modelService.nameValidator,
                  style: GoogleFonts.nunito(
                    textStyle: context.general.textTheme.labelMedium?.copyWith(
                      color: Colors.black,
                    ),
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Ad",
                    hintStyle: GoogleFonts.nunito(
                      textStyle:
                          context.general.textTheme.labelMedium?.copyWith(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          // surname
          Flexible(
            fit: FlexFit.tight,
            flex: 1,
            child: Padding(
              padding: context.padding.onlyLeftLow,
              child: Container(
                padding: context.padding.horizontalLow,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.3),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(4),
                  ),
                ),
                child: TextFormField(
                  controller: surnameController,
                  validator: modelService.surNameValidator,
                  style: GoogleFonts.nunito(
                    textStyle: context.general.textTheme.labelMedium?.copyWith(
                      color: Colors.black,
                    ),
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Soyad",
                    hintStyle: GoogleFonts.nunito(
                      textStyle:
                          context.general.textTheme.labelMedium?.copyWith(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
