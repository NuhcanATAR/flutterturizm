import 'package:flutter/material.dart';
import 'package:flutterturizm/product/enums/main_enums/ticket_enums/myticket_enums.dart';
import 'package:flutterturizm/product/model/main_model/profile_model/profile_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';

class EvaluationExplanationInputWidget extends StatelessWidget {
  const EvaluationExplanationInputWidget({
    super.key,
    required this.modelService,
  });

  final ProfileModelService modelService;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: context.padding.verticalMedium,
      padding: context.padding.low,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.3),
        borderRadius: const BorderRadius.all(
          Radius.circular(4),
        ),
      ),
      child: TextFormField(
        controller: modelService.evaluationExplanationController,
        style: GoogleFonts.nunito(
          textStyle: context.general.textTheme.labelMedium?.copyWith(
            color: Colors.black,
          ),
        ),
        maxLines: 5,
        minLines: 4,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: MyTicketsViewStrings
              .ticketEvaluationCreateExplanationInpuText.value,
          hintStyle: GoogleFonts.nunito(
            textStyle: context.general.textTheme.labelMedium?.copyWith(
              color: Colors.black54,
            ),
          ),
        ),
      ),
    );
  }
}
