
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

final isDarkmodeProvider = StateProvider<bool>((ref) => false);

// estado de colores inmutable
/// Usamos Provider porque será inmutable a diferencia de usar
/// un StateProvider
final colorListProvider = Provider((ref) => colorList);

final selectedColorProvider = StateProvider((ref) => 0);

// Un objeto de tipo AppTheme
// cuando el objeto es un poco más elaborado, se puede usar StateNotifierProvider
// esto es para escuchar al StateNotifier
// https://riverpod.dev/docs/providers/state_notifier_provider
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) => ThemeNotifier()
);

// Control o notifier
// StateNotifier is an observable class that stores a single immutable state.
class ThemeNotifier extends StateNotifier<AppTheme> {
  
  // STATE = Estado = new AppTheme
  // We first need to pass an initial value to the super constructor, to define the initial state of our object.
  ThemeNotifier(): super(AppTheme());

  // Aquí colocamos la lógica empresarial para el estado de nuestra app
  // los metodos abajos modificaran el estado

  void toggleDarkmode() {
    // cambiamos el estado del darkmode
    /// no puedo hacer state.isDarkmode = lo que sea porque las propiedades de AppTheme
    /// son final, puedo quitar el final pero no es recomendado, en su lugar, tengo que usar
    /// la función copyWith que implementé en la clase AppTheme
    
    state = state.copyWith(isDarkmodeCopy: !state.isDarkMode);

    // No need to call "notifyListeners" or anything similar. Calling "state ="
    // will automatically rebuild the UI when necessary.
    
  }

  void changeColorIndex( int colorIndex ) {
    //
  }

  /// assigning state to a new value will automatically notify the listeners and update the UI.
  /// Then, the object can either be listened like with StateNotifierBuilder/StateNotifierProvider 
  /// using package:flutter_state_notifier or package:riverpod.
}