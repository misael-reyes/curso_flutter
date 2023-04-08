import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  final ValueChanged<String> onValue;

  const MessageFieldBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
    //

    // esto es para matener el focus (teclado) cuando precionamos el enter o la palomita
    final FocusNode focusNode = FocusNode();

    final textController = TextEditingController();

    final outlineInputBorder = UnderlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(40));

    final inputDecoration = InputDecoration(
      hintText: 'End your message with a "?"',
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      filled: true,
      suffixIcon: IconButton(
        icon: const Icon(Icons.send),
        onPressed: () {
          final textValue = textController.value.text;
          textController.clear();
          // llamamos al método que tenemos en nuestro padre
          onValue(textValue);
        },
      ),
    );

    return TextFormField(
      // esto es para que al dar clic fuera del teclado se oculte
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      focusNode: focusNode,
      controller: textController,
      // aplicamos estilos
      decoration: inputDecoration,
      // esto se ejecutará cuando presionamos enter
      onFieldSubmitted: (value) {
        // limipiamos el imput
        textController.clear();
        // mantenemos el focus
        focusNode.requestFocus();
        onValue(value);
      },
    );
  }
}
