import 'package:flutter/material.dart';
import 'package:makc_app/modules/messages/model/chat_message.dart';
import 'package:makc_app/modules/messages/widgets/messages_bubble.dart';

class ChatScreen extends StatefulWidget {
  final Conversation conversation;

  const ChatScreen({Key? key, required this.conversation}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final List<ChatMessage> messages = [
    ChatMessage(
      sender: 'Culinary creators',
      message:
          'Hi there! We have an opening for the "Intro to Pottery" class this Saturday at 2 PM. Would you like to book it?',
      time: '2:30 PM',
      isMe: false,
    ),
    ChatMessage(
      sender: 'You',
      message: 'That sounds great! Yes, please book it for me.',
      time: '2:31 PM',
      isMe: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.25), // Semi-transparent white
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 4),
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios,
                    color: Colors.white, size: 18),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
        ),
        title: Row(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    widget.conversation.imageUrl,
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                  ),
                ),
                if (widget.conversation.isOnline)
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.conversation.name,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (widget.conversation.isOnline)
                  Text(
                    'Active now',
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 12,
                    ),
                  ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: messages.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Center(
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 16),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text(
                        'Today',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  );
                }
                return MessageBubble(message: messages[index - 1]);
              },
            ),
          ),
          _buildMessageInput(),
        ],
      ),
    );
  }

  Widget _buildMessageInput() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.emoji_emotions_outlined,
                color: Colors.grey.shade600),
            onPressed: () {},
          ),
          Expanded(
            child: TextField(
              controller: _messageController,
              decoration: InputDecoration(
                hintText: 'сообщение...',
                hintStyle: TextStyle(color: Colors.grey.shade400),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.attach_file, color: Colors.grey.shade600),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.send, color: Colors.blue),
            onPressed: () {
              if (_messageController.text.trim().isNotEmpty) {
                setState(() {
                  messages.add(
                    ChatMessage(
                      sender: 'You',
                      message: _messageController.text,
                      time: '2:32 PM',
                      isMe: true,
                    ),
                  );
                  _messageController.clear();
                });
              }
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }
}
