import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/counter_provider.dart';

// tengo que heredar de ConsumerWidget para usar el provider de riverpod
class CounterScreen extends ConsumerWidget {

  static const name = 'counter_screen';

  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    // con watch le decimos que este pendiente de nuestro counterProvider
    final int clickCounter = ref.watch( counterProvider );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Screen'),
      ),
      body: Center(
        child: Text('Valor: $clickCounter', style: Theme.of(context).textTheme.titleLarge),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}