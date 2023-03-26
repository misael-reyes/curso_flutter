// es un proveedor de informacion

import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:qr_reader/models/scan_model.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  static Database? _database;
  static final DBProvider db = DBProvider._();

  // esto es un constructor privado
  DBProvider._();

  // singleton
  Future<Database> get database async {
    if (_database != null) return _database!;
    // creamos la base de datos
    _database = await initDB();
    return _database!;
  }

  Future<Database> initDB() async {
    // Path de donde almacenaremos la base de datos
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = p.join(documentsDirectory.path, 'ScansDB.db');
    print('path: $path');

    // crear base de datos
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      // esto cuando se crea la bae de
      // aqui podemos crear mas tablas si las necesitamos
      await db.execute('''
				CREATE TABLE Scans(
					id INTEGER PRIMARY KEY,
					tipo TEXT,
					valor TEXT
				)						
			''');
    });
  }

  // esta es una forma
  Future<int> nuevoScanRaw(ScanModel nuevoScan) async {
    //destrucutramos los datos
    final id = nuevoScan.id;
    final tipo = nuevoScan.tipo;
    final valor = nuevoScan.valor;

    // referencia a la base de datos
    final db = await database;

    final res = await db.rawInsert('''
      INSERT INTO Scans(id, tipo, valor)
        VALUES($id, $tipo, $valor)
    ''');

    return res;
  }

  // esta es otra forma de insertar
  Future<int> nuevoScan(ScanModel nuevoScan) async {
    // referencia a la base de datos
    final db = await database;
    
    final res = await db.insert('Scans', nuevoScan.toJson());

    // el res es el id del ultimo registro insertado
    return res;
  }

  Future<ScanModel?> getScanById(int id) async {
    final db = await database;
    final res = await db.query('Scans', where: 'id = ?', whereArgs: [id]);
    return res.isNotEmpty ? ScanModel.fromJson(res.first) : null;
  }

  Future<List<ScanModel>> getAllScan() async {
    final db = await database;
    final res = await db.query('Scans');
    return res.isNotEmpty ? res.map((s) => ScanModel.fromJson(s)).toList() : [];
  }

  Future<List<ScanModel>> getScanByType(String type) async {
    final db = await database;
    final res = await db.query('Scans', where: 'type = ?', whereArgs: [type]);
    return res.isNotEmpty ? res.map((s) => ScanModel.fromJson(s)).toList() : [];
  }
}
