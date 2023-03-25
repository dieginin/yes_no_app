import 'package:flutter/material.dart';

import '/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final List<Message> messageList = [
    Message(text: 'Hola amor!', fromWho: FromWho.me),
    Message(text: 'Ya regresaste del trabajo?', fromWho: FromWho.me),
  ];

  Future sendMessage(String text) async {
    // TODO implementar metodo
  }
}
