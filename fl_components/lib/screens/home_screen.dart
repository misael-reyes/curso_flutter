import 'package:fl_components/router/app_routes.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final menuOptions = AppRoutes.menuOptions;

    return Scaffold(
      appBar: AppBar(
        title: const Text('componentes en flutter'),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) => ListTile(
          leading: Icon(
            menuOptions[index].icon,
            color: Colors.pink,
          ),
          title: Text(menuOptions[index].name),
          subtitle: const Text('es el subtitle'),
          onTap: () {
            /// el context se podria decir que sirve como una memoria de como
            /// esta construida nuestra aplicación, ya que conoce el árbol de
            /// widgeds que estan construidas hasta ese momento
            ///
            /// esta es una de las formas que tenemos para la navegación
            ///
            /// la ventaja de hacer esta forma la navegacion, es que podemos
            /// personalizar la transicion, podemos tener el control absoluto
            /// de como se pasa de un punto a otro

            // final route = MaterialPageRoute(
            //     builder: (context) => const Listview1Screen());

            // // pushRelaceent destruye el stack de screen que teniamos antes
            // // Navigator.pushReplacement(context, route);
            // Navigator.push(context, route);

            /// ahora veamos otra forma de hacer la navegacion que es como
            /// que la mas facil y la que todos prefieren
            Navigator.pushNamed(context, menuOptions[index].route);
          },
        ),
        separatorBuilder: (_, __) => const Divider(),
        itemCount: menuOptions.length,
      ),
    );
  }
}
