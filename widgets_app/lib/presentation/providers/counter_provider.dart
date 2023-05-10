
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// En Riverpod, StateProvider es una clase que te permite crear 
/// un objeto que contiene un estado mutable, similar a la clase 
/// StatefulWidget en Flutter.
final counterProvider = StateProvider((ref) => 5);