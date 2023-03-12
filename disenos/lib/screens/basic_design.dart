import 'package:flutter/material.dart';

class BasicDesignScreen extends StatelessWidget {
  const BasicDesignScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        // Imagen
        const Image(image: AssetImage('assets/paisaje.jpg')),
        // titulo
        const Title(),
        // menu de iconos
        const Menu(),
        // descripción
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: const Text('Amet do enim Lorem et magna. Anim occaecat sunt ad qui consectetur pariatur ipsum quis exercitation nisi mollit. Enim adipisicing laboris quis id incididunt. Culpa do minim in eiusmod qui fugiat pariatur fugiat eu ut mollit Lorem exercitation sit. Magna velit eiusmod in eu eiusmod tempor irure laboris cupidatat adipisicing in pariatur tempor cupidatat. Velit ad aliqua nostrud culpa esse sint. Fugiat consectetur do eiusmod et aliqua velit nulla ut mollit tempor dolore magna do do.')
        )
      ],
    ));
  }
}

class Title extends StatelessWidget {
  const Title({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      padding: const EdgeInsets.only(left: 10, right: 20, top: 5, bottom: 5),
      //color: Colors.green,
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('Oeschinen Lake Campground', style: TextStyle(fontWeight: FontWeight.bold)),
              Text('Kandersteg Switzerland', style: TextStyle(color: Colors.black45))
            ],
          ),
          Expanded(child: Container()),
          const Icon(Icons.star, color: Colors.red),
          const Text('41')
        ],
      ),
    );
  }
}

class Menu extends StatelessWidget {
  const Menu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
      //color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          CustomButton(icon: Icons.call, text: 'CALL'),
          CustomButton(icon: Icons.send, text: 'ROUTE'),
          CustomButton(icon: Icons.share, text: 'SHARE')
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  // propiedades
  final IconData icon;
  final String text;

  const CustomButton({Key? key, required this.icon, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.blue), 
        Text(text, style: const TextStyle(color: Colors.blue))
      ],
    );
  }
}
