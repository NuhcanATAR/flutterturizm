import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterturizm/product/bloc/mainview_bloc/livesupport_bloc/cubit/livesupport_cubit.dart';
import 'package:flutterturizm/product/constant/color_constant.dart';
import 'package:flutterturizm/product/enums/main_enums/livesupport_enum/livesupport_enum.dart';
import 'package:flutterturizm/product/model/main_model/livesupport_model/livesupport_model.dart';
import 'package:flutterturizm/product/utility/dynamicextension/dynamicextension.dart';
import 'package:flutterturizm/product/widget/text_widget/label_medium_text.dart';
import 'package:kartal/kartal.dart';

class LiveSupportStartButtonWidget extends StatelessWidget {
  const LiveSupportStartButtonWidget({
    super.key,
    required this.modelService,
    required this.dynamicViewExtensions,
  });

  final LiveSupportModelService modelService;
  final DynamicViewExtensions dynamicViewExtensions;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding.medium,
      child: GestureDetector(
        onTap: () {
          BlocProvider.of<LiveSupportCubit>(context).startLiveSupport(
            modelService,
          );
        },
        child: SizedBox(
          width: dynamicViewExtensions.maxWidth(context),
          height: dynamicViewExtensions.dynamicHeight(
            context,
            0.06,
          ),
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: MainAppColorConstants.blueMainColor,
              borderRadius: const BorderRadius.all(
                Radius.circular(4),
              ),
            ),
            child: LabelMediumWhiteText(
              text: LiveSupportViewStrings.startSupportButtonText.value,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
