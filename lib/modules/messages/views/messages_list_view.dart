import 'package:flutter/material.dart';
import 'package:makc_app/modules/messages/model/chat_message.dart';
import 'package:makc_app/modules/messages/views/chating_screen.dart';
import 'package:makc_app/modules/messages/widgets/conersation_cart.dart';

class MessagesListView extends StatelessWidget {
  const MessagesListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final conversations = [
      Conversation(
        name: 'Al\'s Boxing',
        lastMessage: 'See you there!',
        time: '10:45 AM',
        imageUrl: 'https://images.unsplash.com/photo-1549719386-74dfcbf7dbed?w=400',
        unreadCount: 2,
      ),
      Conversation(
        name: 'Culinary creators',
        lastMessage: 'Great! The invoice is attached',
        time: '10:20 AM',
        imageUrl: 'https://images.unsplash.com/photo-1556910103-1c02745aae4d?w=400',
        isOnline: true,
      ),
      Conversation(
        name: 'Music Academy',
        lastMessage: 'Thank you!',
        time: 'Yesterday',
        imageUrl: 'https://images.unsplash.com/photo-1511379938547-c1f69419868d?w=400',
      ),
      Conversation(
        name: 'Al\'s Boxing',
        lastMessage: 'Let me know your goals for this week!',
        time: 'Mon',
        imageUrl: 'https://images.unsplash.com/photo-1568602471122-7832951cc4c5?w=400',
        isGroup: true,
      ),
    ];

    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: conversations.length,
      itemBuilder: (context, index) {
        return ConversationCard(
          conversation: conversations[index],
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChatScreen(
                  conversation: conversations[index],
                ),
              ),
            );
          },
        );
      },
    );
  }
}