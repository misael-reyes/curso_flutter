import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class ThemeChangerScreen extends ConsumerWidget {

  static const name = 'theme_changer_screen';

  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    // final bool isDarkmode = ref.watch( isDarkmodeProvider );
    // ahora tengo que estar al pediente de themeNotifierProvider
    final bool isDarkmode = ref.watch( themeNotifierProvider ).isDarkMode;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Changer'),
        actions: [
          IconButton(
            icon: Icon(
              isDarkmode ? Icons.dark_mode_outlined 
              : Icons.light_mode_outlined
            ),
            onPressed: () {
              /// tenemos que colocar el notifier, porque si solo leemos, el valor 
              /// que se retorna es un bool en este caso, por eso al poner notifier 
              /// hacemos referencia al provider
              // ref.read( isDarkmodeProvider.notifier).update((state) => !state);

              // ahora estamos usando themeNotifierProvider
              ref.read(themeNotifierProvider.notifier).toggleDarkmode();
            }
          )
        ],
      ),
      body: const _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  
  const _ThemeChangerView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    /// se puede colocar un read en ves de watc porque no va a cambiar
    /// el estado, pero Riverpod recomienda usar el watch, recoredemos 
    /// que el watch es para decirle que este al pendiente del provedor
    final List<Color> colors = ref.watch(colorListProvider);

    //final int selectedColor = ref.watch(selectedColorProvider);
    final int selectedColor = ref.watch(themeNotifierProvider).selectedColor;

    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: (context, index) {
        final Color color = colors[index];
        return RadioListTile(
          title: Text('Este color', style: TextStyle(color: color)),
          subtitle: Text('${color.value}'),
          activeColor: color,
          value: index,
          groupValue: selectedColor,
          onChanged: (value) {
            // ref.read(selectedColorProvider.notifier).state = index;
            ref.read(themeNotifierProvider.notifier).changeColorIndex(index);
          },
        );
      },
    );
  }
}