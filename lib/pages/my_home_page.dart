import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:laboratorios_modulo/pages/details.dart';
import 'package:laboratorios_modulo/pages/about.dart';
import 'package:laboratorios_modulo/pages/widget.dart';
import 'package:logger/logger.dart';
//import 'package:laboratorios_modulo/pages/widget.dart';
import 'package:laboratorios_modulo/pages/audit.dart';
import 'package:laboratorios_modulo/models/appdata.dart';
import 'package:laboratorios_modulo/pages/preferences.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  String userName = '';
  int counter = 0;

   // Método para cargar las preferencias
  Future<void> loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      userName = prefs.getString('userName') ?? '';
      counter = prefs.getInt('counter') ?? 0;
    });
  }

  // Obtener el icono correspondiente basado en el valor del contador
  String _getResultIcon(BuildContext context) {
    
    //final int counter = context.watch<AppData>().counter; // Escuchar cambios en el contador

    
    if (counter == 10) {
      return victoryIcon; // Icono de "Victoria"
    } else if (counter == 5) {
      return defeatIcon; // Icono de "Comenzar nuevamente"
    } else if (counter == 0) {
      return resetIcon; // Icono de "Derrota" o intento en progreso
    } else {
      return resetIcon;
    }
  }

  // Mostrar el mensaje adecuado según el valor del contador
  String _getResultMessage(BuildContext context) {
  
    //final int counter = context.watch<AppData>().counter; // Escuchar cambios en el contador

    if (counter == 10) {
      return 'Victoria, has alcanzado 10 puntos';
    } else if (counter == 5) {
      return 'Derrota, has alcanzado 5 puntos';
    } else if (counter == 0) {
      return 'Puntaje en 0';
    } else {
      return 'Contador en: $counter';
    }
  }
  //definicion logger
  var logger = Logger(
    printer: PrettyPrinter(),
    
  );


   @override
  void initState() {
    super.initState();
    // Aquí puedes registrar el estado creado
    logger.i("Estado de MyHomePage - initState");
    context.read<AppData>().registerAction('Acceso a la pantalla Principal');
    loadPreferences();
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

  Widget _buildCardContent(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SvgPicture.asset(
          _getResultIcon(context), // Icono basado en el estado
          semanticsLabel: 'icono de resultado',
          width: 60,
          height: 60,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Text(
            _getResultMessage(context), // Mensaje basado en el estado
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ), 
        /*
          Positioned.fill(
          child: Image.asset(
            'assets/images/serious_cat.jpg', // imagen de fondo
            fit: BoxFit.cover,
          ),
        ),
        */
        /* 
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            /*
            ElevatedButton(
              onPressed: context.read<AppData>().decreaseCounter,
              child: const Icon(Icons.remove),
            ),
            ElevatedButton(
              onPressed: context.read<AppData>().incrementCounter,
              child: const Icon(Icons.add),
            ),
            ElevatedButton(
              onPressed: context.read<AppData>().resetCounter,
              child: SvgPicture.asset(
                resetIcon,
                width: 24,
                height: 24,
              ),
            ),
            */
            /*
            const SizedBox(height: 20.0),
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
            */
          ],
        ),
        */
        /*
        ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const WidgetPage(title: '',)),
                );
              },
              child: const Text('Widget'),
            ),
            */
      ],
    );
  }

   Drawer buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.green,
            ),
            child: Text(
              'Menú Principal',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          ListTile(
            title: const Text('Contador'),
            onTap: () {
              Navigator.pop(context); // Cierra el Drawer
              // Agrega la funcionalidad que desees
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Aumentando')),
              );
            },
          ),
          ListTile(
            title: const Text('Detalles'),
            onTap: () {
              Navigator.pop(context); // Cierra el Drawer
              // Agrega la funcionalidad que desees
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DetailPage()),
                );
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Ingresando a Detalles')),
              );
            },
          ),
          ListTile(
            title: const Text('Sobre'),
            onTap: () {
              Navigator.pop(context); // Cierra el Drawer
              // Agrega la funcionalidad que desees
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AboutPage()),
              );              
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Ingresando a Sobre')),
              );
            },
          ),
          ListTile(
            title: const Text('Auditoria'),
            onTap: () {
              Navigator.pop(context); // Cierra el Drawer
              // Agrega la funcionalidad que desees
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AuditPage()),
              );              
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Ingresando a Auditoria')),
              );
            },
          ),
          ListTile(
            title: const Text('Preferencias'),
            onTap: () {
              Navigator.pop(context); // Cierra el Drawer
              // Agrega la funcionalidad que desees
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PreferencesPage()),
              );              
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Ingresando a Preferencias')),
              );
            },
          ),
          ListTile(
            title: const Text('Widget'),
            onTap: () {
              Navigator.pop(context); // Cierra el Drawer
              // Agrega la funcionalidad que desees
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const WidgetPage(title: '',)),
              );              
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Ingresando al Widget')),
              );
            },
          ),                   
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {


    /*
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      drawer: buildDrawer(context),
      body: Center(
        child: Card(
          margin: const EdgeInsets.all(16.0),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: _buildCardContent(context),
          ),
        ),
      ),
      bottomNavigationBar: const SizedBox.shrink(), // Sin floatingActionButton
    );
    */
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      drawer: buildDrawer(context),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              userName.isNotEmpty ? 'Hola $userName' : 'Hola Invitado',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: _buildCardContent(context), // Aquí llamas a la función
                /*
                child: Column(
                  children: [
                    const Text('Contador:', style: TextStyle(fontSize: 18)),
                    Text(
                      counter.toString(),
                      style: const TextStyle(fontSize: 24),
                    ),
                  ],
                ),
                */
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (counter > 0) counter--;
                    });
                    saveCounter(); 
                  },
                  child: const Icon(Icons.remove),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      counter++;
                    });
                    saveCounter(); 
                  },
                  child: const Icon(Icons.add),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      counter = 0;
                    });
                    saveCounter(); 
                  },
                  child: const Icon(Icons.refresh),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PreferencesPage()),
                ).then((_) {
                  loadPreferences(); // Recargar preferencias después de editar
                });
              },
              child: const Text('Abrir Preferencias'),
            ),
          ],
        ),
      ),
    );
  }

    Future<void> saveCounter() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('counter', counter);
  }
}

