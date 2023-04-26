import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  
  static const name = 'buttons_screen';
  
  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons Screen'),
      ),
      body: const _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_back_ios_new_rounded),
        onPressed: (){
          // lo que queremos es regresar a la pantalla anterior
          // podemos hacer lo siguiente porque estamos usando el paquete goRouter que
          /// le da funcionalidad a nuestro context
          context.pop();
        }
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {
    
    final colors = Theme.of(context).colorScheme;
    
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        /// el wrap es similar a una fila, solo que cuando
        /// no haya más espacio en la fila, creara otro
        child: Wrap(
          spacing: 10,
          alignment: WrapAlignment.center,
          children: [
            
            ElevatedButton(onPressed: (){}, child: const Text('Elevated')),
            
            const ElevatedButton(onPressed: null, child: Text('Elevated Disabled')),
            
            ElevatedButton.icon(
              onPressed: (){}, 
              icon: const Icon(Icons.access_alarm_outlined),
              label: const Text('Elevated Icon')
            ),
            
            FilledButton(onPressed: (){}, child: const Text('Filled')),
            
            FilledButton.icon(
              onPressed: () {}, 
              icon: const Icon(Icons.electric_bike),
              label: const Text('Filled Icon'),
            ),
            
            OutlinedButton(onPressed: (){}, child: const Text('Outline')),
            
            OutlinedButton.icon(
              onPressed: (){}, 
              icon: const Icon(Icons.car_rental_sharp), 
              label: const Text('Outline Icon')
            ),
            
            TextButton(onPressed: (){}, child: const Text('Text')),
            
            TextButton.icon(
              onPressed: (){}, 
              icon: const Icon(Icons.face_3_sharp), 
              label: const Text('Text Icon')
            ),
            
            IconButton(onPressed: (){}, icon: const Icon(Icons.u_turn_left_outlined)),
            
            IconButton(
              onPressed: () {}, 
              icon: const Icon(Icons.u_turn_left_outlined),
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(colors.primary),
                iconColor: const MaterialStatePropertyAll(Colors.white)
              ),
            )
            
          ],
        ),
      ),
    );
  }
}