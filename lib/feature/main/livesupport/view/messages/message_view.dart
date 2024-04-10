import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterturizm/feature/main/livesupport/view/messages/widget/messagelist_widget.dart';
import 'package:flutterturizm/feature/main/livesupport/view/messages/widget/messagesend_widget.dart';
import 'package:flutterturizm/feature/main/livesupport/view/messages/widget/titlesubtitle_widget.dart';
import 'package:flutterturizm/product/bloc/mainview_bloc/livesupport_bloc/cubit/livesupport_cubit.dart';
import 'package:flutterturizm/product/bloc/mainview_bloc/livesupport_bloc/state/livesupport_state.dart';
import 'package:flutterturizm/product/constant/color_constant.dart';
import 'package:flutterturizm/product/utility/base/mainbase/livesupport_base/livesupport_base.dart';
import 'package:flutterturizm/product/widget/text_widget/label_medium_text.dart';

class MessageView extends StatefulWidget {
  const MessageView({super.key});

  @override
  State<MessageView> createState() => _MessageViewState();
}

class _MessageViewState extends LiveSupportBase<MessageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            liveSupportExitDialog(context);
          },
          child: Icon(
            Icons.exit_to_app,
            color: MainAppColorConstants.blueMainColor,
            size: 21,
          ),
        ),
        title: const LabelMediumMainColorText(
          text: "Canlı Destek",
          textAlign: TextAlign.center,
        ),
      ),
      body: BlocConsumer<LiveSupportCubit, LiveSupportState>(
        listener: liveSupportMessageListenerBloc,
        builder: (context, state) {
          return Column(
            children: [
              // title sub title
              buildTitleSubTitleWidget,
              // message list
              buildMessageListWidget,
              // message send
              buildMessageSendWidget,
            ],
          );
        },
      ),
    );
  }

  // title sub title widget
  Widget get buildTitleSubTitleWidget =>
      const LiveSupportMessageTitleSubTitleWidget();

  // message list
  Widget get buildMessageListWidget => MessagesListWidget(
        modelService: modelService,
        dynamicViewExtensions: dynamicViewExtensions,
      );

  // message send
  Widget get buildMessageSendWidget => MessageSendWidget(
        modelService: modelService,
      );
}
