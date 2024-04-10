class LiveSupportChatModelService {
  final String messageText;
  final String userId;
  final String dateTime;

  LiveSupportChatModelService({
    required this.messageText,
    required this.userId,
    required this.dateTime,
  });

  factory LiveSupportChatModelService.fromMap(Map<dynamic, dynamic> map) {
    return LiveSupportChatModelService(
      messageText: map['message'] ?? 'No Message',
      userId: map['userId'] ?? 'Unknown',
      dateTime: map['hourminute'] ?? 'Unknown',
    );
  }
}
