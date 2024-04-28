import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterturizm/feature/main/livesupport/widget/img_widget.dart';
import 'package:flutterturizm/feature/main/livesupport/widget/startbutton_widget.dart';
import 'package:flutterturizm/feature/main/livesupport/widget/titlesubtitle_widget.dart';
import 'package:flutterturizm/product/bloc/mainview_bloc/livesupport_bloc/cubit/livesupport_cubit.dart';
import 'package:flutterturizm/product/bloc/mainview_bloc/livesupport_bloc/state/livesupport_state.dart';
import 'package:flutterturizm/product/constant/color_constant.dart';
import 'package:flutterturizm/product/utility/base/mainbase/livesupport_base/livesupport_base.dart';
import 'package:flutterturizm/product/widget/text_widget/label_medium_text.dart';
import 'package:kartal/kartal.dart';

class LiveSupportView extends StatefulWidget {
  const LiveSupportView({super.key});

  @override
  State<LiveSupportView> createState() => _LiveSupportViewState();
}

class _LiveSupportViewState extends LiveSupportBase<LiveSupportView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: MainAppColorConstants.blueMainColor,
        elevation: 0,
        centerTitle: true,
        title: const LabelMediumWhiteText(
          text: "Canlı Destek",
          textAlign: TextAlign.center,
        ),
      ),
      body: Padding(
        padding: context.padding.low,
        child: BlocConsumer<LiveSupportCubit, LiveSupportState>(
          listener: liveSupportListenerBloc,
          builder: (context, state) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  // img
                  buildImgWidget,
                  // title sub title
                  buildTitleSubTitleWidget,
                  // start button
                  buildStartButtonWidget,
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  // img
  Widget get buildImgWidget => const ImgWidget();

  // title sub title
  Widget get buildTitleSubTitleWidget => const LiveSupportTitleSubTitleWidget();

  // start button
  Widget get buildStartButtonWidget => LiveSupportStartButtonWidget(
        modelService: modelService,
        dynamicViewExtensions: dynamicViewExtensions,
      );
}
