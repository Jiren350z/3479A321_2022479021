import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'pages/my_home_page.dart'; //nueva ruta del my home page
import 'package:laboratorios_modulo/pages/appdata.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

    static final logger = Logger(
    printer: PrettyPrinter(),
  );

  @override
  Widget build(BuildContext context) {

    logger.i("Logger is working! MyApp is being built.");

    return ChangeNotifierProvider<AppData>(
      create: (context) => AppData(),
      child: MaterialApp(
        title: 'My App',
        theme: ThemeData(
          fontFamily: "Fonts",
          colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 21, 194, 38)),
        ),
        home: const MyHomePage(title: 'Laboratorio_6'),
      ),
    );    
  }
}
