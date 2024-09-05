import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:logger/logger.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  //definicion logger
  var logger = Logger(
    printer: PrettyPrinter(),
  );


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
  
  //añadir, restar, reiniciar
  Widget _buildBottomNavigationBar() {
  return BottomAppBar(
    shape: const CircularNotchedRectangle(),
    notchMargin: 8.0,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        ElevatedButton(
          onPressed: _decreaseCounter,
          child: const Icon(Icons.remove)),
        ElevatedButton(
          onPressed: _incrementCounter,
          child: const Icon(Icons.add)),
        
      ],
    ),
  );
}

  @override
  Widget build(BuildContext context) {

    logger.i("Logger is working! MyHomePage is being built.");

    String skullIcon = 'assets/icons/skull.svg';
   
    return Scaffold(
      appBar: AppBar(
       
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
       
        title: Text(widget.title),
      ),

   

      body: Center(
       
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(
            skullIcon,
            semanticsLabel: 'Acme Logo',
            width: 40,
            height: 40,
            ),
            const Text(
              'Cantidad de Clicks:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      
      bottomNavigationBar: _buildBottomNavigationBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: _resetCounter,
        tooltip: 'Reiniciar',
        child: const Icon(Icons.refresh),
        
        
      ),
      
    );
  }
}