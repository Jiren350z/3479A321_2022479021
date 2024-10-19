import 'package:flutter/material.dart';
import 'package:laboratorios_modulo/models/appdata.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


class PreferencesPage extends StatefulWidget {
  const PreferencesPage({super.key});

  @override
  PreferencesPageState createState() => PreferencesPageState();
}

class PreferencesPageState extends State<PreferencesPage> {
String _userName = ''; // Variable para almacenar el nombre de usuario
  int _counter = 0; // Variable para almacenar el valor del contador

  // Método para cargar las preferencias
  Future<void> loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _userName = prefs.getString('userName') ?? '';
      _counter = prefs.getInt('counter') ?? 0;
    });
  }

  // Método para guardar las preferencias
  Future<void> savePreferences() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userName', _userName);
    await prefs.setInt('counter', _counter);
  }

  // Método para actualizar el nombre de usuario
  void updateUserName(String newName) {
    setState(() {
      _userName = newName;
    });
    savePreferences(); // Guardar las preferencias cada vez que se actualice
  }

  // Método para actualizar el valor del contador
  void updateCounter(double newValue) {
    setState(() {
      _counter = newValue.toInt();
    });
    savePreferences(); // Guardar las preferencias cada vez que se actualice
  }
  @override
  void initState() {
    super.initState();
    // Registrar la acción una vez al cargar la pantalla
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AppData>().registerAction('Acceso a la pantalla de Preferencias');
    });

    loadPreferences();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Preferencia'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'User Name:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              initialValue: _userName,
              decoration: const InputDecoration(
                hintText: 'Enter your name',
              ),
              onChanged: updateUserName,
            ),
            const SizedBox(height: 20),
            const Text(
              'Contador:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Slider(
              value: _counter.toDouble(),
              min: 0,
              max: 100,
              divisions: 100,
              label: _counter.toString(),
              onChanged: updateCounter,
            ),
            const SizedBox(height: 20),
            // Mostrar el valor actual del contador
            Center(
              child: Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text('Hola $_userName', style: TextStyle(fontSize: 20)),
                      Text('Contenido vigente en Card'),
                      Text(
                        _counter.toString(),
                        style: TextStyle(fontSize: 24),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );

  }
}
