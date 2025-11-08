import 'package:flutter/material.dart';
import 'package:makc_app/modules/messages/views/messages_list_view.dart';


class MessagesScreen extends StatelessWidget {
  const MessagesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Set hasConversations to true to see the list view
    // final hasConversations = false;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            'Messages',
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.more_vert, color: Colors.black),
              onPressed: () {},
            ),
          ],
        ),
        body: const MessagesListView()
        // : const EmptyMessagesState(),
        );
  }
}
