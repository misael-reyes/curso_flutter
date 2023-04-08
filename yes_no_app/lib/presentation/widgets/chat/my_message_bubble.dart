import 'package:flutter/material.dart';

class MyMessageBubble extends StatelessWidget {
  final String textMessage;

  const MyMessageBubble({super.key, required this.textMessage});

  @override
  Widget build(BuildContext context) {
    // busca el tema dentro del contexto
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
              color: colors.primary, borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              textMessage,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 10)
      ],
    );
  }
}
