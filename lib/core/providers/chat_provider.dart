import 'package:flutter/material.dart';

import '/config/helpers/get_yes_no_answer.dart';
import '/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final chatScrollController = ScrollController();
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();
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

  Future responseMessage() async {
    final responseMessage = await getYesNoAnswer.getAnswer();
    messageList.add(responseMessage);

    notifyListeners();
    moveScrollToBottom();
  }

  Future sendMessage(String text) async {
    text = text.trim();

    if (text.isEmpty) return;

    final newMessage = Message(text: text, fromWho: FromWho.me);
    messageList.add(newMessage);

    if (text.endsWith('?')) responseMessage();

    notifyListeners();
    moveScrollToBottom();
  }
}
