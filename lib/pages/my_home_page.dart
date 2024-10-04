import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:laboratorios_modulo/pages/details.dart';
import 'package:logger/logger.dart';
import 'package:laboratorios_modulo/pages/widget.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {

  String victoryIcon = 'assets/icons/victory.svg';
  String defeatIcon = 'assets/icons/defeat.svg';
  String resetIcon = 'assets/icons/reset.svg';
  int _counter = 0;

  //definicion logger
  var logger = Logger(
    printer: PrettyPrinter(),
    
  );


   @override
  void initState() {
    super.initState();
    // Aquí puedes registrar el estado creado
    logger.i("Estado de MyHomePage - initState");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    logger.i("Estado de MyHomePage - didChangeDependencies");
  }

  
  @override
  void didUpdateWidget(covariant MyHomePage oldWidget) {
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


  void _incrementCounter() {
    setState(() {
      
      _counter++;
    });

    //loguea el evento de aumentar
    logger.d('Contador incremetado a $_counter');
    
  }
  void _decreaseCounter(){
      setState(() {
        
        
        _counter--;

        if(_counter < 0)
        {
          _counter = 0;
        }

      });
      
    //loguea el evento de disminuir
    logger.w('Contador disminuido a $_counter');

  }

  void _resetCounter()
  {
    setState(() {
      _counter = 0;
    });

    //loguea el evento de resetear
    logger.w('Contador reseteado a $_counter');

  }

  // Obtener el icono correspondiente basado en el valor del contador
  String _getResultIcon() {
    if (_counter == 10) {
      return victoryIcon; // Icono de "Victoria"
    } else if (_counter == 5) {
      return defeatIcon; // Icono de "Comenzar nuevamente"
    } else if (_counter == 0){
      return resetIcon; // Icono de "Derrota" o intento en progreso
    } else {
      return resetIcon;
    }
  }

  // Mostrar el mensaje adecuado según el valor del contador
  String _getResultMessage() {
    if (_counter == 10) {
      return 'Victoria, has alcanzado 10 puntos';
    } else if (_counter == 5) {
      return 'Derrota, has alcanzado 5 puntos';
    } else if (_counter == 0) {
      return 'Puntaje en 0';
    } else {
      return 'Contador en: $_counter' ;
    }
  }
    Widget _buildCardContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SvgPicture.asset(
          _getResultIcon(), // Icono basado en el estado
          semanticsLabel: 'icono de resultado',
          width: 60,
          height: 60,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Text(
            _getResultMessage(), // Mensaje basado en el estado
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ), 
        Positioned.fill(
          child: Image.asset(
            'assets/images/serious_cat.jpg', // imagen de fondo
            fit: BoxFit.cover,
          ),
        ),  
            
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ElevatedButton(
              onPressed: _decreaseCounter,
              child: const Icon(Icons.remove),
            ),
            ElevatedButton(
              onPressed: _incrementCounter,
              child: const Icon(Icons.add),
            ),
            ElevatedButton(
              onPressed: _resetCounter,
              child: SvgPicture.asset(
                resetIcon,
                width: 24,
                height: 24,
              ),
            ),
            
            const SizedBox(
              height: 20.0,
            ),
            const SizedBox(height: 60.0), // Ajusta este valor para mover el botón más abajo
            // Botón "Ir a Detalles"
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DetailPage()),
                );
              },
              child: const Text('Detalles'),
            ),
            const SizedBox(
              height: 20.0,
            ),
            
          ],
        ),
        ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const WidgetPage(title: '',)),
                );
              },
              child: const Text('Widget'),
            ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    logger.i("Logger funcionando! MyHomePage esta siendo creado.");

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.all(16.0),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: _buildCardContent(),
          ),
        ),
      ),
      bottomNavigationBar: const SizedBox.shrink(), // Sin floatingActionButton
    );
  }

}
