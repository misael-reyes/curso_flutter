import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = 'snackbar_screen';

  const SnackbarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: const Text('Snackbars y diálogos'),
      ),
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            FilledButton.tonal(
              onPressed: (){
                // con la siguiente instrucción mostramos las licencias usadas en flutter
                showAboutDialog(
                  context: context,
                  children: [
                    const Text('Consectetur labore excepteur sunt irure est exercitation. Id reprehenderit anim dolore consectetur magna veniam duis id cupidatat sint amet. Esse velit et do fugiat. Id culpa labore adipisicing do commodo proident duis consectetur dolor elit amet. Velit minim enim et officia minim. Ad et deserunt aute sint ea aute id aute dolore. Non magna ullamco est anim.')
                  ]
                );
              }, 
              child: const Text('Licencias usadas')
            ),
            
            FilledButton.tonal(
              onPressed: () => openDialog(context), 
              child: const Text('Mostrar diálogo')
            ),
            
          ],
        ),
      ),
      
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Mostrar Snackbar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
        onPressed: () => showCustomSnackbar(context)
      ),
    );
  }
  
  void showCustomSnackbar(BuildContext context) {
    
    // ocultamos el snackbar anterior por si hay alguno
    ScaffoldMessenger.of(context).clearSnackBars();
    
    final snackbar = SnackBar(
      content: const Text('Hola mundo'),
      // cualquier accion se cerrará el snackbar
      action: SnackBarAction(label: 'Ok', onPressed: (){}),
      duration: const Duration(seconds: 2),
    );
    
    // mostramos el snakbar
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }
  
  void openDialog( BuildContext context ) {
    showDialog(
      context: context, 
      // con esto nos aseguramos que el usuario precione uno de los dos botones
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Estas seguro?'),
        content: const Text('Non id deserunt labore sint et tempor commodo pariatur excepteur do et occaecat culpa. Tempor officia elit irure ad labore sunt dolore proident qui magna anim consequat ullamco pariatur. Non veniam laborum consectetur non labore nisi cupidatat eiusmod aliqua ex ad. Pariatur incididunt reprehenderit amet ex tempor veniam aliqua consectetur sunt. Adipisicing cillum et deserunt esse ad et non consectetur reprehenderit. Cupidatat aliquip ut nisi fugiat reprehenderit aute ad id aliqua irure magna ipsum tempor anim. Et adipisicing exercitation quis incididunt irure et id ea.'),
        actions: [
          TextButton(onPressed: () => context.pop(), child: const Text('Cancelar')),
          FilledButton(onPressed: () => context.pop(), child: const Text('Aceptar'))
        ],
      )
    );
  }
}
