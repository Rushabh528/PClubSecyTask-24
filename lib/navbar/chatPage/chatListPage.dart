// chatListPage.dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:secytask/helpers/appbar.dart';
import 'globals.dart';
import 'chatPage.dart';

class chatListPage extends StatefulWidget {
  chatListPage({super.key});

  @override
  State<chatListPage> createState() => _chatListPageState();
}

class _chatListPageState extends State<chatListPage> {
  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar0(title: 'Chats'),
      body: chatConversations.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.chat,
                    size: 30,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Purchase an item to start a conversation',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: chatConversations.length,
              itemBuilder: (context, index) {
                final conversation =
                    chatConversations[chatConversations.length - 1 - index];
                return Column(
                  children: [
                    ListTile(
                      title: Text(conversation.sellerName),
                      subtitle: Text(conversation.lastMessage),
                      trailing: Text(DateFormat('hh:mm a')
                          .format(conversation.lastMessageTime)),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => chatPage(
                              sellerName: conversation.sellerName,
                              sellerContactDetails:
                                  conversation.sellerContactDetails,
                            ),
                          ),
                        );
                      },
                    ),
                    Divider(color: Colors.grey),
                  ],
                );
              },
            ),
    );
  }
}

class ChatConversation {
  final String sellerName;
  final String sellerContactDetails;
  final String lastMessage;
  final DateTime lastMessageTime;

  ChatConversation({
    required this.sellerName,
    required this.sellerContactDetails,
    required this.lastMessage,
    required this.lastMessageTime,
  });
}
