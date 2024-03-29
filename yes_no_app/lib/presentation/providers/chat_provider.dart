import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

// ChatProvider notificará cuando haya cambios
class ChatProvider extends ChangeNotifier {
  //
  /// esto es para el controlador de nuestro scroll, lo necesitaremos cuando
  /// se mande un mensaje, queremos que el scroll muestre el ultimo elemento
  /// lo ponemos en esta clase porque asi amarramo la clase ChatScreen con esta.
  /// la idea es que el chatScrollController sea notificado cada que un mensaje nuevo se
  /// envie y asi pueda mostrar el ultimo elemento
  final ScrollController chatScrollController = ScrollController();

  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();

  List<Message> messageList = [
    Message(text: 'Hola amor', fromWho: FromWho.me),
    Message(text: 'Ya regresaste del trabajo?', fromWho: FromWho.me)
  ];

  Future<void> sendMessage(String text) async {
    // validamos para que no haya mensajes vacios
    if (text.isEmpty) return;
    // el mensaje siempre va ser mio
    final newMessage = Message(text: text, fromWho: FromWho.me);

    // añadamoslo a la lista
    messageList.add(newMessage);

    // tenemos que validar si el mensaje es una pregunta para hacer la peticion
    if (text.endsWith('?')) {
      herReply();
    }

    // notifiquemos que la lista cambio su contendio
    notifyListeners();

    moveScrollToBottom();
  }

  Future<void> moveScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));
    chatScrollController.animateTo(
        // quiero que valla a lo maximo que el scroll pueda dar
        chatScrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut);
  }

  // respuesta de ella
  Future<void> herReply() async {
    final herMessage = await getYesNoAnswer.getAnswer();

    // lo agregamos a la lista de mensajes
    messageList.add(herMessage);
    // notificamos a los chismosos
    notifyListeners();
    moveScrollToBottom();
  }
}
