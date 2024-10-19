class Audit {
  final int? id; // id será nullable porque sqflite lo generará automáticamente
  final String nombreAccion;

  Audit({this.id, required this.nombreAccion});

  // Convertir un objeto Auditoria en un Map para almacenarlo en la base de datos
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombreAccion': nombreAccion,
    };
  }

  // Convertir un Map en un objeto Auditoria
  factory Audit.fromMap(Map<String, dynamic> map) {
    return Audit(
      id: map['id'],
      nombreAccion: map['nombreAccion'],
    );
  }
}