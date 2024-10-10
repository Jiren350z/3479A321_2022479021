import 'package:flutter/material.dart';

class AuditPage extends StatelessWidget {
  const AuditPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Auditoría'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          ListTile(
            leading: Icon(Icons.access_time),
            title: Text('Acceso 1: 10:00 AM'),
            subtitle: Text('Descripción del acceso realizado.'),
          ),
          ListTile(
            leading: Icon(Icons.access_time),
            title: Text('Acceso 2: 11:30 AM'),
            subtitle: Text('Descripción del acceso realizado.'),
          ),
          // Agrega más ListTile para otros accesos.
        ],
      ),
    );
  }
}