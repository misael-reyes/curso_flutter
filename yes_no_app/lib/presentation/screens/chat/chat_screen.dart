import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // truco, cada que el widget sea un screen, es mejor retornar un scaffold
    return Scaffold(
      appBar: AppBar(
        // espacio antes del titulo
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://cachedimages.podchaser.com/256x256/aHR0cHM6Ly9jcmVhdG9yLWltYWdlcy5wb2RjaGFzZXIuY29tLzFiNWYxZjRjODc4MzE2NzlmZWI5NDcyZjg5ZDEwMGJlLmpwZWc%3D/aHR0cHM6Ly93d3cucG9kY2hhc2VyLmNvbS9pbWFnZXMvbWlzc2luZy1pbWFnZS5wbmc%3D'),
          ),
        ),
        title: const Text('Megan Fox ❤️'),
        centerTitle: true,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// referencia a nuestro provider
    /// aqui esta la documentación para hecharle un ojo
    /// https://pub.dev/packages/provider
    /// (esto quiere decir que este widget esa escuchando los cambios de ChatProvider)
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            // el expanded permite al widget hijo epandirse a todo el espacio disponible
            Expanded(

                /// el ListView.builder crea el list view cuando se va a mostrar en la pantalla,
                /// si el item aun no esta en la pantalla no se crea
                child: ListView.builder(
                    itemCount: chatProvider.messageList.length,
                    itemBuilder: (context, index) {
                      final message = chatProvider.messageList[index];
                      return ( message.fromWho == FromWho.me )
                          ? MyMessageBubble(message: message)
                          : HerMessageBubble(message: message);
                    })),

            // caja de texto de mensaejes
            MessageFieldBox(
              // hay dos formas de hacer lo mismo
              //onValue: (value) => chatProvider.sendMessage(value)
              // esto se puede hacer porque los parametros son los mismos, mismo nombre y posición
              onValue: chatProvider.sendMessage
            )
          ],
        ),
      ),
    );
  }
}
