import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class AppData extends ChangeNotifier {
  int _counter = 0;
  List<String> actions = [];
  // Logger instance
  var logger = Logger(printer: PrettyPrinter());

  int get counter => _counter;

// Metodo para registrar acciones
  void registerAction(String action) {
    actions.add(action);
    logger.i('Acción registrada: $action');
      WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });
  }

  void incrementCounter() {
    _counter++;
    logger.d('Contador incrementado a $_counter');
    notifyListeners();  
  }

  void decreaseCounter() {
    _counter--;
    if (_counter < 0) {
      _counter = 0;
    }
    logger.w('Contador disminuido a $_counter');
    notifyListeners();  
  }

  void resetCounter() {
    _counter = 0;
    logger.w('Contador reseteado a $_counter');
    notifyListeners();  
  }
}

/*
class AppData extends ChangeNotifier {
  int _counter = 0;
  List<String> actions = [];

  int get counter => _counter;

  // metodo para incrementar el contador
  void increment() {
    _counter++;
    actions.add("Incremented to $_counter");
    notifyListeners(); // Notifica a los listeners que hubo un cambio
  }

  // metodo para disminuir el contador
  void decrement() {
    if (_counter > 0) {
      _counter--;
      actions.add("Decremented to $_counter");
    } else {
      actions.add("Counter already at 0");
    }
    notifyListeners();
  }

  // Método para resetear el contador
  void reset() {
    _counter = 0;
    actions.add("Counter reset to 0");
    notifyListeners();
  }
  
}
*/