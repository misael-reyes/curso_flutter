import 'package:flutter/material.dart';

class PageTitle extends StatelessWidget {
  const PageTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Classify transaction', style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text(
              'Classify this transation into a particular categotry',
              maxLines: 2,
              style: TextStyle(fontSize: 16, color: Colors.white)
            )
          ],
        ),
      ),
    );
  }
}
