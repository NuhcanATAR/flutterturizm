import 'package:flutter/material.dart';
import 'package:flutterturizm/product/enums/main_enums/home_enum/home_enum.dart';
import 'package:flutterturizm/product/model/main_model/tickets_model/tickets_model.dart';
import 'package:flutterturizm/product/widget/text_widget/label_medium_text.dart';
import 'package:kartal/kartal.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class FilterCardEndLocationWidget extends StatefulWidget {
  const FilterCardEndLocationWidget({
    super.key,
    required this.homeModelService,
  });

  final TicketsModelService homeModelService;

  @override
  State<FilterCardEndLocationWidget> createState() =>
      _FilterCardEndLocationWidgetState();
}

class _FilterCardEndLocationWidgetState
    extends State<FilterCardEndLocationWidget> {
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
        value: widget.homeModelService.selectEndCity,
        hint: LabelMediumGreyText(
          text: HomeViewStrings.ticketFilterCardArrivalCityText.value,
          textAlign: TextAlign.left,
        ),
        onChanged: (String? value) {
          setState(() {
            widget.homeModelService.selectEndCity = value;
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
