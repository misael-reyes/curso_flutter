import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {
  
  static const name = 'infinite_screen';

  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {

  List<int> imagesIds = [1,2,3,4,5];
  final ScrollController scrollController = ScrollController();
  bool isLoading = false;
  bool isMounted = true;

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() { 
      // posicion actual
      final position = scrollController.position.pixels;
      //posicion maxima que podemos exteneder el scrooll
      final positionMax = scrollController.position.maxScrollExtent;

      if ((position + 500) >= positionMax) { // llegue al tope
        // load next page 
        loadNextPage();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    isMounted = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      /// para eliminar el espacio de la parte superior donde viene el nivel de bateria, envolvemos
      /// nuestro ListView dentro de un MediaQuery.removePadding y asignamos las siguientes propiedades
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        // esto es para el espacio en blanco que deja en Ios
        removeBottom: true,
        child: RefreshIndicator(
          edgeOffset: 10,
          strokeWidth: 2, // grosor
          onRefresh: onRefresh,
          child: ListView.builder(
            controller: scrollController,
            itemCount: imagesIds.length,
            itemBuilder: (context, index) {
              /// recordar que el FadeInImage nos permite cargar una imagen de internet, pero
              /// mientras carga, podemos mostrar otra imagen como placeHolder
              return FadeInImage(
                fit: BoxFit.cover,
                width: double.infinity,
                height: 300,
                placeholder: const AssetImage('assets/images/jar-loading.gif'), 
                image: NetworkImage('https://picsum.photos/id/${imagesIds[index]}/500/300')
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        //child: const Icon(Icons.arrow_back_ios_new_outlined),
        child: isLoading ?
        FadeInRight(
          child: SpinPerfect(
            infinite: true,
            child: const Icon(Icons.refresh_rounded)
          ),
        ) :
        FadeIn(child: const Icon(Icons.arrow_back_ios_new_outlined)),
        onPressed: () => context.pop(),
      ),
    );
  }

  void addFiveImages() {
    final lastId = imagesIds.last;

    imagesIds.addAll(
      [1,2,3,4,5].map((e) => lastId + e)
    );
  }

  Future loadNextPage() async {
    if (isLoading) return;

    isLoading = true;
    // redibujamos
    setState(() {
      
    });

    await Future.delayed(const Duration(seconds: 2));

    addFiveImages();
    isLoading = false;

    if(!isMounted) return;
    setState(() {});
  }

  Future<void> onRefresh() async {
    isLoading = true;
    setState(() {});

    await Future.delayed(const Duration(seconds: 3));
    if(!isMounted) return;

    isLoading = false;
    final lastId = imagesIds.last;
    imagesIds.clear();
    imagesIds.add(lastId + 1);
    addFiveImages();

    setState(() {});
  }
}
