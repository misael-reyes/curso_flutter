import 'package:disenos/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// necesitamos de un stack ya que nos permite colocar widgets en sima de nuestro
      /// background que será otro widget, en si, stack nos permite colocar widgets en
      /// sima de otros widgets
      body: Stack(
        children: const [
          // background
          Background()
        ],
      )
    );
  }
}