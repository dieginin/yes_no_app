import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/core/providers/chat_provider.dart';
import '/core/widgets/chat/my_message_bubble.dart';
import '/core/widgets/chat/received_message_bubble.dart';
import '/core/widgets/shared/message_field_box.dart';
import '/domain/entities/message.dart';

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
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: chatProvider.chatScrollController,
                itemCount: chatProvider.messageList.length,
                itemBuilder: (_, i) {
                  final message = chatProvider.messageList[i];

                  return (message.fromWho == FromWho.received) ? const ReceivedMessageBubble() : MyMessageBubble(message: message);
                },
              ),
            ),
            MessageFieldBox(onValue: chatProvider.sendMessage),
          ],
        ),
      ),
    );
  }
}
