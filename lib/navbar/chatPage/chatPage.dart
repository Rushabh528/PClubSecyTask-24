import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class chatPage extends StatefulWidget {
  final String sellerName;
  final String sellerContactDetails;

  chatPage(
      {super.key,
      required this.sellerName,
      required this.sellerContactDetails});

  @override
  _chatPageState createState() => _chatPageState();
}

class _chatPageState extends State<chatPage> {
  final List<ChatMessage> _messages = [];
  final TextEditingController _controller = TextEditingController();

  void _sendMessage(String message) {
    if (message.isEmpty) return;
    setState(() {
      _messages.add(ChatMessage(
        sender: 'User',
        message: message,
        timestamp: DateTime.now(),
      ));
      _messages.add(ChatMessage(
        sender: widget.sellerName,
        message: 'Seller response to "$message"',
        timestamp: DateTime.now(),
      ));
    });
    _controller.clear();
  }

  Future<void> urlLauncher(String uri) async {
    try {
      final url = Uri.parse(uri);
      await launchUrl(url);
    } catch (e) {
      print("Error launching URL: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat with ${widget.sellerName}'),
        actions: [
          IconButton(
              onPressed: () {
                urlLauncher(
                    "https://www.google.com/maps/dir//26.5104409,80.2266097/@26.5107991,80.2262428,17.95z/data=!4m2!4m1!3e2?entry=ttu");
              },
              icon: Icon(Icons.location_on_outlined))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                final isUserMessage = message.sender == 'User';
                return Align(
                  alignment: isUserMessage
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    decoration: BoxDecoration(
                      color: isUserMessage
                          ? Color(0xff990011).withOpacity(0.3)
                          : Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: isUserMessage
                          ? CrossAxisAlignment.end
                          : CrossAxisAlignment.start,
                      children: [
                        Text(
                          message.message,
                        ),
                        Text(
                          DateFormat('hh:mm a').format(message.timestamp),
                          style: TextStyle(
                              fontSize: 10, color: Colors.grey.shade700),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      labelText: 'Type your message',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () => _sendMessage(_controller.text),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatMessage {
  final String sender;
  final String message;
  final DateTime timestamp;

  ChatMessage(
      {required this.sender, required this.message, required this.timestamp});
}
