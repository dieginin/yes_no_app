import 'package:flutter/material.dart';

import '/core/widgets/chat/my_message_bubble.dart';
import '/core/widgets/chat/received_message_bubble.dart';
import '/core/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4),
          child: CircleAvatar(
            backgroundImage: NetworkImage('https://yt3.googleusercontent.com/oYV9Vadrvu358rHuTlbNr9pYeSEvB_WDURIsddDdRKmladE0_EBYwexo6iqzbSzEXT1TNY-E=s900-c-k-c0x00ffffff-no-rj'),
          ),
        ),
        title: const Text('Mi amor ❤'),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 100,
                itemBuilder: (_, i) {
                  return (i % 2 == 0) ? const ReceivedMessageBubble() : const MyMessageBubble();
                },
              ),
            ),
            const MessageFieldBox(),
          ],
        ),
      ),
    );
  }
}
