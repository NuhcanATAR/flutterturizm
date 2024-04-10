import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterturizm/product/bloc/mainview_bloc/livesupport_bloc/cubit/livesupport_cubit.dart';
import 'package:flutterturizm/product/constant/color_constant.dart';
import 'package:flutterturizm/product/enums/main_enums/livesupport_enum/livesupport_enum.dart';
import 'package:flutterturizm/product/model/main_model/livesupport_model/livesupport_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';

class MessageSendWidget extends StatelessWidget {
  const MessageSendWidget({
    super.key,
    required this.modelService,
  });

  final LiveSupportModelService modelService;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          // message input
          buildMessageInputWidget(context),
          // message send button
          buildMessageSendButtonWidget(context),
        ],
      ),
    );
  }

  // message input
  Widget buildMessageInputWidget(BuildContext context) => Expanded(
        child: Container(
          padding: context.padding.horizontalLow,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
              width: 1,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(4),
            ),
          ),
          child: TextFormField(
            controller: modelService.messageController,
            style: GoogleFonts.nunito(
              textStyle: context.general.textTheme.bodyMedium?.copyWith(
                color: Colors.black,
              ),
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: LiveSupportViewStrings.liveSupportMessageInput.value,
              hintStyle: GoogleFonts.nunito(
                textStyle: context.general.textTheme.bodyMedium?.copyWith(
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ),
      );

  // message send button
  Widget buildMessageSendButtonWidget(BuildContext context) => Padding(
        padding: context.padding.horizontalLow,
        child: ElevatedButton(
          style: ButtonStyle(
            padding: MaterialStateProperty.all(
              context.padding.verticalNormal,
            ),
            backgroundColor: MaterialStateColor.resolveWith(
              (states) => MainAppColorConstants.blueMainColor,
            ),
          ),
          onPressed: () {
            if (modelService.messageController.text.isNotEmpty) {
              BlocProvider.of<LiveSupportCubit>(context).sendMessage(
                modelService,
                modelService.messageController,
              );
            }
            return;
          },
          child: const Icon(
            Icons.send,
            color: Colors.white,
            size: 20,
          ),
        ),
      );
}
