import 'package:flutter/material.dart';
import 'package:laboratorios_modulo/pages/about.dart';
import 'package:provider/provider.dart'; 
import 'package:laboratorios_modulo/pages/appdata.dart'; 

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  DetailPageState createState() => DetailPageState();
}

class DetailPageState extends State<DetailPage> {
  
  @override
  void initState() {
    super.initState();
    // Registrar la acción solo una vez al acceder a la pantalla de detalles
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AppData>().registerAction('Acceso a la pantalla de Detalles');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalles'),
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
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Pagina Detalles',
                  style: TextStyle(
                    fontSize: 24,
                    color: Color.fromARGB(255, 12, 12, 12),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                // Usar Consumer para escuchar el valor del contador en tiempo real
                Consumer<AppData>(
                  builder: (context, appData, child) {
                    return Text(
                      'Valor del contador: ${appData.counter}', // Mostramos el contador desde el Provider
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // futuras acciones boton 1
                  },
                  child: const Text('Botón 1'),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    // futuras acciones boton 2
                  },
                  child: const Text('Botón 2'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AboutPage()),
                    );
                  },
                  child: const Text('Ir a Sobre'),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Acción del botón
                  },
                  child: const Text('Volver'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


/*
class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {

    context.read<AppData>().registerAction('Acceso a la pantalla de Detalles');

    return Scaffold(
      appBar: AppBar(
        title: const Text('detalles'),
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
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Pagina Detalles',
                  style: TextStyle(
                    fontSize: 24,
                    color: Color.fromARGB(255, 12, 12, 12),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                // Usar Consumer para escuchar el valor del contador en tiempo real
                Consumer<AppData>(
                  builder: (context, appData, child) {
                    return Text(
                      'Valor del contador: ${appData.counter}', // Mostramos el contador desde el Provider
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // futuras acciones boton 1
                  },
                  child: const Text('Botón 1'),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    // futuras acciones boton 2
                  },
                  child: const Text('Botón 2'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AboutPage()),
                    );
                  },
                  child: const Text('Ir a Sobre'),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Acción del botón
                  },
                  child: const Text('Volver'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
*/

/*
class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('detalles'),
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
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Pagina Detalles',
                  style: TextStyle(
                    fontSize: 24,
                    color: Color.fromARGB(255, 12, 12, 12),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // futuras acciones boton 1
                  },
                  child: const Text('Botón 1'),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    // futuras acciones boton 2
                  },
                  child: const Text('Botón 2'),
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const AboutPage()),
                      );
                    },
                    child: const Text('Ir a Sobre'),
                  ),
                  const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Acción del botón
                  },
                  child: const Text('Volver'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
*/