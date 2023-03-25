import 'package:flutter/material.dart';

import '/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final chatScrollController = ScrollController();
  final List<Message> messageList = [
    Message(text: 'Hola amor!', fromWho: FromWho.me),
    Message(text: 'Ya regresaste del trabajo?', fromWho: FromWho.me),
  ];

  Future moveScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));

    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent,
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 300),
    );
  }

  Future sendMessage(String text) async {
    text = text.trim();

    if (text.isEmpty) return;

    final newMessage = Message(text: text, fromWho: FromWho.me);

    messageList.add(newMessage);

    notifyListeners();

    moveScrollToBottom();
  }
}
