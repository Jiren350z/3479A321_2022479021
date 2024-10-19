import 'package:flutter/material.dart';
//import 'package:laboratorios_modulo/models/appdata.dart';
//import 'package:provider/provider.dart';
import 'package:laboratorios_modulo/utils/database_helper.dart'; 
import 'package:laboratorios_modulo/models/auditclass.dart'; 

class AuditPage extends StatefulWidget {
  const AuditPage({super.key});

  @override
  AuditPageState createState() => AuditPageState();
}

class AuditPageState extends State<AuditPage> {

  final DatabaseHelper _dbHelper = DatabaseHelper();
  List<Audit> _audits = [];

  @override
  void initState() {
    super.initState();
    _loadAudits(); // Cargar auditorías al iniciar la pantalla
    /*
    // Registrar la acción una vez al cargar la pantalla
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AppData>().registerAction('Acceso a la pantalla de Auditoría');
    });
    */
  }
  Future<void> _loadAudits() async {
    final audits = await _dbHelper.getAuditorias();
    setState(() {
      _audits = audits;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Obtener la lista de acciones desde AppData
    //final actions = context.watch<AppData>().actions;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Auditoría'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: _audits.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.access_time),
            title: Text('Acción ${index + 1}'),
            subtitle: Text(_audits[index].nombreAccion),
        /*
        padding: const EdgeInsets.all(16.0),
        itemCount: actions.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.access_time),
            title: Text('Acción ${index + 1}'),
            subtitle: Text(actions[index]),
            */
          );
        },
      ),
    );
  }
}

