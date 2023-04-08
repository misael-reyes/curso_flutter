import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

// ChatProvider notificará cuando haya cambios
class ChatProvider extends ChangeNotifier {
  List<Message> messageList = [
    Message(text: 'Hola amor', fromWho: FromWho.me),
    Message(text: 'Ya regresaste del trabajo?', fromWho: FromWho.me)
  ];

  Future<void> sendMessage(String text) async {
    // el mensaje siempre va ser mio
    final newMessage = Message(text: text, fromWho: FromWho.me);

    // añadamoslo a la lista
    messageList.add(newMessage);

    // notifiquemos que la lista cambio su contendio
    notifyListeners();
  }
}
