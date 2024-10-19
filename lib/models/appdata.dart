import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class AppData extends ChangeNotifier {
  //int _counter = 0;
  List<String> actions = [];
  // Logger instance
  var logger = Logger(printer: PrettyPrinter());

  //int get counter => _counter;

// Metodo para registrar acciones
  void registerAction(String action) {
    actions.add(action);
    logger.i('Acción registrada: $action');
      WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });
  }
  /*
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
  */
}

