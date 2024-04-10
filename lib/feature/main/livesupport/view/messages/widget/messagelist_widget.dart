import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutterturizm/feature/main/livesupport/view/messages/widget/oppositemessagecard_widget.dart';
import 'package:flutterturizm/feature/main/livesupport/view/messages/widget/usermessagecard_widget.dart';
import 'package:flutterturizm/product/model/main_model/livesupport_model/livesupport_model.dart';
import 'package:flutterturizm/product/utility/dynamicextension/dynamicextension.dart';
import 'package:flutterturizm/product/utility/service/firebase/firebase_service.dart';

import '../../../../../../product/model/main_model/livesupport_model/livesupportchat_model.dart';

class MessagesListWidget extends StatelessWidget {
  const MessagesListWidget({
    super.key,
    required this.modelService,
    required this.dynamicViewExtensions,
  });

  final LiveSupportModelService modelService;
  final DynamicViewExtensions dynamicViewExtensions;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FirebaseAnimatedList(
        query: modelService.messagesRef.orderByChild('startedDate'),
        itemBuilder: (
          BuildContext context,
          DataSnapshot snapshot,
          Animation<double> animation,
          int index,
        ) {
          if (snapshot.value is Map<dynamic, dynamic>) {
            final messageMap = snapshot.value as Map<dynamic, dynamic>;
            final message = LiveSupportChatModelService.fromMap(messageMap);
            return message.userId != FirebaseService().userID
                ? buildOppositeUserMessageCardWidget(
                    context,
                    message,
                  )
                : buildUserMessageCardWidget(
                    context,
                    message,
                  );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }

  // opposite user message card
  Widget buildOppositeUserMessageCardWidget(
    BuildContext context,
    LiveSupportChatModelService message,
  ) =>
      OppositeMessageCardWidget(
        message: message,
        dynamicViewExtensions: dynamicViewExtensions,
      );

  // user message card
  Widget buildUserMessageCardWidget(
    BuildContext context,
    LiveSupportChatModelService message,
  ) =>
      UserMessageCardWidget(
        message: message,
        dynamicViewExtensions: dynamicViewExtensions,
      );
}
