import 'package:fl_components/theme/app_theme.dart';
import 'package:flutter/material.dart';

class ListViewBuilderScreen extends StatefulWidget {
  const ListViewBuilderScreen({Key? key}) : super(key: key);

  @override
  State<ListViewBuilderScreen> createState() => _ListViewBuilderScreenState();
}

class _ListViewBuilderScreenState extends State<ListViewBuilderScreen> {
  //

  final List<int> imagesIds = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  final ScrollController scrollController = ScrollController();
  bool isLoading = false;

  // cuando el state se crea por primera vez
  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      //print('${scrollController.position.pixels}, ${scrollController.position.maxScrollExtent}');
      if ((scrollController.position.pixels + 500) >=
          scrollController.position.maxScrollExtent) {
        //add5();
        fetchData();
      }
    });
  }

  void add5() {
    final lastId = imagesIds.last;
    imagesIds.addAll([1, 2, 3, 4, 5].map((e) => lastId + e));
    // actualizamos el listview
    setState(() {});
  }

  // usamos un feature para simular que traemos la infomracion de internet
  Future fetchData() async {
    if (isLoading) return;

    isLoading = true;
    setState(() {});

    await Future.delayed(const Duration(seconds: 3));

    add5();
    isLoading = false;
    setState(() {});

    if ((scrollController.position.pixels + 100) <=
        scrollController.position.maxScrollExtent) return;

    // esto es para mostrar un poco de la siguiente imagen despues de pausar el progress
    scrollController.animateTo(scrollController.position.pixels + 120,
        duration: const Duration(milliseconds: 300),
        curve: Curves.fastOutSlowIn);
  }

  @override
  Widget build(BuildContext context) {
    //
    // le mediaquery nos sirve para darnos informacion sobre el dispositivo
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: Stack(
          // envolvemos el listview.builder dentro de un stack porque queremos poner un widget ensima de otro
          children: [
            ListView.builder(
              // esto es para eliminar lo blanco de abajo de scroll
              physics: const BouncingScrollPhysics(),
              // controlador para obtener la ubicacion de las imagenes
              controller: scrollController,
              itemCount: imagesIds.length,
              itemBuilder: (BuildContext context, int index) {
                return FadeInImage(
                    width: double.infinity,
                    height: 300,
                    // toma todo el espacio que tiene la imagen
                    fit: BoxFit.cover,
                    // al cargar la imagen
                    placeholder: const AssetImage('assets/loading.gif'),
                    image: NetworkImage(
                        'https://picsum.photos/500/300?image=${imagesIds[index]}'));
              },
            ),
            // el positioned nos permite poner un widget en la posicion que queremos
            // no es permitirdo un if con {} porque estamos dentro de un widget
            if (isLoading)
              Positioned(
                  bottom: 40,
                  left: size.width * 0.42,
                  child: const LoadingIcon())
          ],
        ),
      ),
    );
  }
}

class LoadingIcon extends StatelessWidget {
  const LoadingIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 60,
      width: 60,

      /// recordar qque el color y decoration no pueden ir juntos, tenemos que poner el color
      /// dentro del boxdecoration
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9), shape: BoxShape.circle),
      child: const CircularProgressIndicator(color: AppTheme.colorPrimary),
    );
  }
}
