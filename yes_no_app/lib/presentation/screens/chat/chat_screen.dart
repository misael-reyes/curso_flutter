import 'package:flutter/material.dart';
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
                    itemCount: 100,
                    itemBuilder: (context, index) {
                      return (index % 2 == 0)
                          ? const HerMessageBubble()
                          : const MyMessageBubble();
                    })),
                    
            // caja de texto de mensaejes
            const MessageFieldBox()
          ],
        ),
      ),
    );
  }
}
