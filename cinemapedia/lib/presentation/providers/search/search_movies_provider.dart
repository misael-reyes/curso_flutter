
import 'package:flutter_riverpod/flutter_riverpod.dart';

// we need a provider to store the status of the query
final searchQueryProvider = StateProvider<String>((ref) => '');