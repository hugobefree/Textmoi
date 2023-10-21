import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:testmoi/common/api/APi_function.dart';
import 'package:testmoi/common/models/model.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.internal();
  factory DatabaseHelper() => _instance;

  static Database? _db;

  DatabaseHelper.internal();

  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await initDb();
    return _db!;
  }

  Future<Database> initDb() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, "My_Base.db");
    var ourDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return ourDb;
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE Users (
        id INTEGER PRIMARY KEY,
        gender TEXT,
        name TEXT,
        location TEXT,
        email TEXT,
        phone TEXT,
        cell TEXT,
        nat TEXT
      )
    ''');
  }

  Future<int> insertUser(UserModel user) async {
    final db = await this.db;
    return await db.insert(
      'Users',
      {
        'gender': user.gender,
        'name': user.name,
        'email': user.email,
        'phone': user.phone,
        
      },
    );
  }

  Future<List<UserModel>> getAllUsers() async {
    final db = await this.db;
    final List<Map<String, dynamic>> maps = await db.query('Users');
    return List.generate(maps.length, (i) {
      return UserModel(
        gender: maps[i]['gender'],
        name: maps[i]['name'],
        email: maps[i]['email'],
        phone: maps[i]['phone'],
        birthday: '', picture: '', street: '', city: '', state: '', country: '', favorite: true,
      );
    });
  }

static Future<void> insertUsersFromAPI() async {
  final db = await _instance.db;
  List<UserModel> users = await requette();
  print('Données de l\'API récupérées : $users');
  for (var user in users) {
    await _instance.insertUser(user);
  }
  print('Données de l\'API ajoutées à la base de données.');
}

}
