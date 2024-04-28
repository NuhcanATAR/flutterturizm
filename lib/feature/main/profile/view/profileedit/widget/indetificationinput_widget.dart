import 'package:flutter/material.dart';
import 'package:flutterturizm/product/model/main_model/profile_model/profile_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';

class IdentificationInputWidget extends StatelessWidget {
  const IdentificationInputWidget({
    super.key,
    required this.identificationController,
    required this.modelService,
  });

  final TextEditingController identificationController;
  final ProfileModelService modelService;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding.onlyBottomLow,
      child: Container(
        padding: context.padding.horizontalLow,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.3),
          borderRadius: const BorderRadius.all(
            Radius.circular(4),
          ),
        ),
        child: TextFormField(
          controller: identificationController,
          validator: modelService.identificationValidator,
          style: GoogleFonts.nunito(
            textStyle: context.general.textTheme.labelMedium?.copyWith(
              color: Colors.black,
            ),
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "TC Kimlik Numarası",
            hintStyle: GoogleFonts.nunito(
              textStyle: context.general.textTheme.labelMedium?.copyWith(
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
