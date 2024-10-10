import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'pages/my_home_page.dart'; //nueva ruta del my home page

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

   static final logger = Logger(
    printer: PrettyPrinter(),
  );
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    logger.i("Logger is working! MyApp is being built.");

    return MaterialApp(
      title: 'Hola mundo',
      theme: ThemeData(
        
        fontFamily: "Fonts",
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 21, 194, 38)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Laboratorio_6'),
    );
  }
}
