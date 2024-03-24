import 'package:flutter/material.dart';
import 'package:flutterturizm/product/model/main_model/home_model/home_model.dart';
import 'package:flutterturizm/product/widget/text_widget/label_medium_text.dart';
import 'package:kartal/kartal.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class FilterCardStartingLocationWidget extends StatefulWidget {
  const FilterCardStartingLocationWidget({
    super.key,
    required this.homeModelService,
  });

  final HomeModelService homeModelService;

  @override
  State<FilterCardStartingLocationWidget> createState() =>
      _FilterCardStartingLocationWidgetState();
}

class _FilterCardStartingLocationWidgetState
    extends State<FilterCardStartingLocationWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: context.padding.verticalLow,
      padding: context.padding.horizontalLow,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        borderRadius: const BorderRadius.all(
          Radius.circular(4),
        ),
      ),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          border: InputBorder.none,
          icon: Icon(
            MdiIcons.bus,
            color: Colors.black,
            size: 18,
          ),
        ),
        icon: const Icon(
          Icons.arrow_drop_down,
          color: Colors.transparent,
          size: 21,
        ),
        value: widget.homeModelService.selectStartCity,
        hint: const LabelMediumGreyText(
          text: "Nerden?",
          textAlign: TextAlign.left,
        ),
        onChanged: (String? value) {
          setState(() {
            widget.homeModelService.selectStartCity = value;
          });
        },
        items: widget.homeModelService.cityDistricts!.keys.map((String city) {
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
  }
}
