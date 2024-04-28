import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterturizm/feature/main/profile/view/mytickets/view/evaluationcreate/widget/explanation_widget.dart';
import 'package:flutterturizm/feature/main/profile/view/mytickets/view/evaluationcreate/widget/ratingbar_widget.dart';
import 'package:flutterturizm/product/bloc/mainview_bloc/profile_bloc/cubit/cubit.dart';
import 'package:flutterturizm/product/bloc/mainview_bloc/profile_bloc/state/state.dart';
import 'package:flutterturizm/product/constant/color_constant.dart';
import 'package:flutterturizm/product/enums/main_enums/ticket_enums/myticket_enums.dart';
import 'package:flutterturizm/product/model/main_model/tickets_model/myticketlist_model.dart';
import 'package:flutterturizm/product/utility/base/mainbase/profile_base/profile_base.dart';
import 'package:flutterturizm/product/widget/text_widget/label_medium_text.dart';
import 'package:kartal/kartal.dart';

class EvaluationCreateView extends StatefulWidget {
  const EvaluationCreateView({
    super.key,
    required this.myTickets,
  });

  final MyTickets myTickets;

  @override
  State<EvaluationCreateView> createState() => _EvaluationCreateViewState();
}

class _EvaluationCreateViewState extends ProfileBase<EvaluationCreateView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainAppColorConstants.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: MainAppColorConstants.blueMainColor,
            size: 20,
          ),
        ),
        title: const LabelMediumMainColorText(
          text: "Yolculuğu Değerlendir",
          textAlign: TextAlign.center,
        ),
      ),
      body: BlocConsumer<ProfileCubit, ProfileState>(
        listener: ticketEvaluationCreateListener,
        builder: (context, state) {
          return Padding(
            padding: context.padding.normal,
            child: ListView(
              children: <Widget>[
                // rating widget
                buildRatingWidget,
                // explanation input
                buildExplanationInputWidget,
                // save button
                buildSaveButtonWidget,
              ],
            ),
          );
        },
      ),
    );
  }

  // rating widget
  Widget get buildRatingWidget => EvaluationRatingBarWidget(
        dynamicViewExtensions: dynamicViewExtensions,
        modelService: modelService,
      );

  // explanation input
  Widget get buildExplanationInputWidget => EvaluationExplanationInputWidget(
        modelService: modelService,
      );

  // save button
  Widget get buildSaveButtonWidget => Padding(
        padding: context.padding.verticalLow,
        child: GestureDetector(
          onTap: () {
            evaluationCreate(
              context,
              widget.myTickets,
              modelService.ratingPointValue.toInt(),
              modelService.evaluationExplanationController.text,
            );
          },
          child: SizedBox(
            width: dynamicViewExtensions.maxWidth(context),
            height: dynamicViewExtensions.dynamicHeight(
              context,
              0.07,
            ),
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: MainAppColorConstants.blueMainColor,
                borderRadius: const BorderRadius.all(
                  Radius.circular(4),
                ),
              ),
              child: LabelMediumWhiteBoldText(
                text: MyTicketsViewStrings.ticketEvaluationSendButtonText.value,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      );
}
