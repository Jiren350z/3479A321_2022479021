import 'package:flutter/material.dart';
import 'package:laboratorios_modulo/pages/appdata.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';


class WidgetPage extends StatefulWidget {
  
  const WidgetPage({super.key, required this.title});

  final String title;

  @override
  State<WidgetPage> createState() => _WidgetPageState();
}


class _WidgetPageState extends State<WidgetPage> {


    //definicion logger
  var logger = Logger(
    printer: PrettyPrinter(),
    
  );

 @override
  void initState() {
    super.initState();
    // Aquí puedes registrar el estado creado
    logger.i("Estado de MyHomePage - initState");
    context.read<AppData>().registerAction('Acceso a la pantalla de Widgets');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    logger.i("Estado de MyHomePage - didChangeDependencies");
  }

  @override
  void didUpdateWidget(covariant WidgetPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    logger.i("Estado de MyHomePage - didUpdateWidget");
  }

  @override
  void deactivate() {
    logger.w("Estado de MyHomePage - deactivate");
    super.deactivate();
  }

  @override
  void dispose() {
    logger.w("Estado de MyHomePage - dispose");
    super.dispose();
  }

  @override
  void reassemble() {
    super.reassemble();
    logger.i("Estado de MyHomePage - reassemble (Hot Reload)");
  }

  
  @override
  Widget build(BuildContext context) {
   // Registrar la acción al acceder a la pantalla de Widgets
    
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('widget'),
      ),
      body: Stack(
        children: <Widget>[
          // imagen que cubre toda la pantalla
          Positioned.fill(
            child: Image.asset(
              'assets/images/dogs.jpg', // imagen de fondo
              fit: BoxFit.cover,
            ),
          ),
          // contenido sobre la imagen
 
        ],
      ),
    );
  }
}