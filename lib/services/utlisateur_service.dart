import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';
import '../models/utilisateur.dart';

class DatabaseService {
  static final DatabaseService _instance = DatabaseService._internal();

  factory DatabaseService() => _instance;

  DatabaseService._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final path = join(await getDatabasesPath(), 'immobilier.db');
    return await openDatabase(
      path,
      version: 3, 
      onCreate: _createTables,
      onUpgrade: _onUpgrade,
    );
  }

  Future<void> _createTables(Database db, int version) async {
    await db.execute('''
      CREATE TABLE utilisateur (
        idUtilisateur INTEGER PRIMARY KEY AUTOINCREMENT,
        nom TEXT NOT NULL,
        prenom TEXT NOT NULL,
        email TEXT NOT NULL UNIQUE,
        mot_de_passe TEXT NOT NULL,
        role TEXT NOT NULL,
        status TEXT NOT NULL,
        tel TEXT NOT NULL  // New field for tel (telephone)
      )
    ''');
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2) {
      await db.execute('''
        ALTER TABLE utilisateur ADD COLUMN status TEXT NOT NULL DEFAULT 'inactive'
      ''');
    }
    if (oldVersion < 3) {
      await db.execute('''
        ALTER TABLE utilisateur ADD COLUMN tel TEXT NOT NULL DEFAULT ''  // Add tel column if upgrading to version 3
      ''');
    }
  }

  Future<void> insertUtilisateur(Utilisateur utilisateur) async {
    final db = await database;
    await db.insert('utilisateur', utilisateur.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Utilisateur>> getUtilisateurs() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('utilisateur');
    return maps.map((map) => Utilisateur.fromMap(map)).toList();
  }

  Future<void> updateUtilisateur(Utilisateur utilisateur) async {
    final db = await database;
    await db.update(
      'utilisateur',
      utilisateur.toMap(),
      where: 'id = ?',
      whereArgs: [utilisateur.id],
    );
  }

  Future<void> deleteUtilisateur(int id) async {
    final db = await database;
    await db.delete('utilisateur', where: 'id = ?', whereArgs: [id]);
  }
}
