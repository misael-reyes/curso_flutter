import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  
  static const name = 'progress_screen';

  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress Indicator'),
      ),
      body: const _ProgressView(),
    );
  }
}

class _ProgressView extends StatelessWidget {
  
  const _ProgressView();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: const [
          
          SizedBox(height: 30),
          Text('Circular progress indicator'),
          SizedBox(height: 10),
          CircularProgressIndicator(strokeWidth: 2, backgroundColor: Colors.black45),
          SizedBox(height: 20),
          Text('Circular y lienar controlado'),
          SizedBox(height: 10),
          _ControlledProgressIndicator()
          
        ],
      ),
    );
  }
}

class _ControlledProgressIndicator extends StatelessWidget {
  
  const _ControlledProgressIndicator();

  @override
  Widget build(BuildContext context) {
    /// StreamBuilder permite construir la interfaz de usuario en función
    /// de los datos que llegan a través de un stream
    return StreamBuilder(
      // creamos un stream que emitira información cada cierto tiempo
      stream: Stream.periodic(const Duration(milliseconds: 300), (value) {
        // esta funcion se ejecutará cada que llegue un dato al stream
        return (value * 2) / 100;
        // con takeWhile le indicamos cuando parar con una condición
        /// en esta caso la condición es que el valor emitido en el stream
        /// sea menor que 100
      }).takeWhile((value) => value < 100),
      builder: (context, snapshot) {
        
        // snapshot.data contiene el valor que nos envia el stream
        final progressValue = snapshot.data ?? 0;
        
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // el valor de value tiene que ir de 0 a 1
              CircularProgressIndicator(value: progressValue, strokeWidth: 2, backgroundColor: Colors.black45),
              const SizedBox(width: 20),
              /// con el Expanded deciemos: toma todo el espacio que el padre te esta dando
              /// si colocamos solo el LinearProgressIndicator, nos marca un error porque
              /// dicho widget necesita saber el espacio que tien para renderizar, cosa queel
              /// Row no proporcioan, por eso lo envolvemos dentro de Expanded
              Expanded(
                child: LinearProgressIndicator(value: progressValue)
              )
              
            ],
          ),
        );
      }
    );
  }
}
