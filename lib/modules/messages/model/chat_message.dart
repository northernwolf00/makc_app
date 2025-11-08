class ChatMessage {
  final String sender;
  final String message;
  final String time;
  final bool isMe;

  ChatMessage({
    required this.sender,
    required this.message,
    required this.time,
    required this.isMe,
  });
}

class Conversation {
  final String name;
  final String lastMessage;
  final String time;
  final String imageUrl;
  final int unreadCount;
  final bool isOnline;
  final bool isGroup;

  Conversation({
    required this.name,
    required this.lastMessage,
    required this.time,
    required this.imageUrl,
    this.unreadCount = 0,
    this.isOnline = false,
    this.isGroup = false,
  });
}