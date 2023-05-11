import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/counter_provider.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

// tengo que heredar de ConsumerWidget para usar el provider de riverpod
class CounterScreen extends ConsumerWidget {

  static const name = 'counter_screen';

  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    // con watch le decimos que este pendiente de nuestro counterProvider
    final int clickCounter = ref.watch( counterProvider );

    final bool isDarkmode = ref.watch( isDarkmodeProvider );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Screen'),
        actions: [
          IconButton(
            icon: Icon(
              isDarkmode ? Icons.light_mode_outlined 
              : Icons.dark_mode_outlined
            ),
            onPressed: () {
              /// tenemos que colocar el notifier, porque si solo leemos, el valor 
              /// que se retorna es un bool en este caso, por eso al poner notifier 
              /// hacemos referencia al provider
              ref.read(isDarkmodeProvider.notifier).state = !isDarkmode;
            }
          )
        ],
      ),
      body: Center(
        child: Text('Valor: $clickCounter', style: Theme.of(context).textTheme.titleLarge),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // asi cambiamos el valor del contador
          // ref.read(counterProvider.notifier).state ++;
          // tambien lo podemos hacer de la siguiente manera
          ref.read(counterProvider.notifier).update((state) => state + 1);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}