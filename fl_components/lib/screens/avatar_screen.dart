import 'package:flutter/material.dart';

class AvatarScreen extends StatelessWidget {
  const AvatarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Misael Reyes'),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: CircleAvatar(
              backgroundColor: Colors.orange[900],
              child: const Text('MR'),
            ),
          ),
        ],
      ),
      body: const Center(
        child: CircleAvatar(
          backgroundImage: NetworkImage(
              'https://3.bp.blogspot.com/-3bnXxHDDvLE/UnvzqdF4d9I/AAAAAAAAb3U/GFwKkqPMbvU/s1600/comic-iron+man.jpg'),
          maxRadius: 110,
        ),
      ),
    );
  }
}
