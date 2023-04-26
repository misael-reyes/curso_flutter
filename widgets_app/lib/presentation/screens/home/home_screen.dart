import 'package:flutter/material.dart';
import 'package:widgets_app/config/menu/menu_items.dart';

class HomeScreen extends StatelessWidget {
  
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter + Material 3'),
      ),
      body: const _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: appMenuItems.length,
      itemBuilder: (context, index) {
        
        final menuItem = appMenuItems[index];
        
        return _CustomListTitle(menuItem: menuItem);
      }
    );
  }
}

class _CustomListTitle extends StatelessWidget {
  
  const _CustomListTitle({
    required this.menuItem,
  });

  final MenuItem menuItem;

  @override
  Widget build(BuildContext context) {
    
    // accedemos al theme de nuestra aplicación
    final colors = Theme.of(context).colorScheme;
    
    return ListTile(
      // leading: icono antes del texto
      leading: Icon(menuItem.icon, color: colors.primary),
      // trailing: icono que va al final
      trailing: Icon(Icons.arrow_forward_ios_rounded, color: colors.primary),
      title: Text(menuItem.title),
      subtitle: Text(menuItem.subTitle),
      onTap: () {
        // TODO: Navegar a otra pantalla
      },
    );
  }
}