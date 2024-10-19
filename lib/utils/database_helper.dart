import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:laboratorios_modulo/models/auditclass.dart'; // Ajusta la ruta si es necesario

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  DatabaseHelper._internal();

  factory DatabaseHelper() {
    return _instance;
  }

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final path = join(await getDatabasesPath(), 'auditoria.db');

    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE auditoria(id INTEGER PRIMARY KEY AUTOINCREMENT, nombreAccion TEXT)',
        );
      },
    );
  }

  Future<void> insertAuditoria(Audit auditoria) async {
    final db = await database;

    await db.insert(
      'auditoria',
      auditoria.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Audit>> getAuditorias() async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.query('auditoria');

    return List.generate(maps.length, (i) {
      return Audit.fromMap(maps[i]);
    });
  }
}