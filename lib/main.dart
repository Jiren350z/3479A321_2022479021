import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:logger/logger.dart';

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
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        fontFamily: "Fonts",
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 21, 194, 38)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Laboratorio_2'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  // Define logger
  var logger = Logger(
    printer: PrettyPrinter(),
  );


  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });

    // Log the increment event
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
      
    // Log the decrement event
    logger.w('Contador disminuido a $_counter');

  }

  void _resetCounter()
  {
    setState(() {
      _counter = 0;
    });

    // Log the decrement event
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
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),

   

      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
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
      

       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
