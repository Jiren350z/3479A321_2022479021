import 'package:flutter/material.dart';
import 'package:laboratorios_modulo/pages/appdata.dart';
import 'package:provider/provider.dart';


class AuditPage extends StatefulWidget {
  const AuditPage({super.key});

  @override
  AuditPageState createState() => AuditPageState();
}

class AuditPageState extends State<AuditPage> {

  @override
  void initState() {
    super.initState();
    // Registrar la acción una vez al cargar la pantalla
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AppData>().registerAction('Acceso a la pantalla de Auditoría');
    });
  }

  @override
  Widget build(BuildContext context) {
    // Obtener la lista de acciones desde AppData
    final actions = context.watch<AppData>().actions;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Auditoría'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: actions.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.access_time),
            title: Text('Acción ${index + 1}'),
            subtitle: Text(actions[index]),
          );
        },
      ),
    );
  }
}

/*
class AuditPage extends StatelessWidget {
  const AuditPage({super.key});

  @override
  Widget build(BuildContext context) {
    
    // Registrar la acción al acceder a la pantalla de auditoría
    context.read<AppData>().registerAction('Acceso a la pantalla de Auditoría');
    
    // Obtener la lista de acciones desde AppData
    final actions = context.watch<AppData>().actions;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Auditoría'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: actions.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.access_time),
            title: Text('Acción ${index + 1}'),
            subtitle: Text(actions[index]),
          );
        },
      ),
    );

    
  }
}
*/