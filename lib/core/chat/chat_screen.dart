import 'package:flutter/material.dart';

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
      body: const Center(
        child: Text('ChatScreen'),
      ),
    );
  }
}
