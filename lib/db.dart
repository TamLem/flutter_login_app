import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:login/model.dart';
import 'package:path/path.dart';

class DatabaseHelper { 

  static DatabaseHelper _databaseHelper;    // Singleton DatabaseHelper
	static Database _database;                // Singleton Database

  String usersTable  = 'users_table';
  String id = 'id';
  String email = 'email';
  String password = 'password';
  String birthDate  = 'birth-date';

  DatabaseHelper._createInstance(); // Named constructor to create instance of DatabaseHelper
  
  factory DatabaseHelper() {

		if (_databaseHelper == null) {
			_databaseHelper = DatabaseHelper._createInstance(); // This is executed only once, singleton object
		}
		return _databaseHelper;
	}

  Future<Database> get database async {

		if (_database == null) {
			_database = await initializeDatabase();
		}
		return _database;
	}

  Future<Database> initializeDatabase() async {
      // Get the directory path for both Android and iOS to store database.
      Directory directory = await getApplicationDocumentsDirectory();
      String path = directory.path + 'users.db';

      // Open/create the database at a given path
      var usersDatabase = await openDatabase(path, version: 1, onCreate: _createDb);
      return usersDatabase;
    }

    
  void _createDb(Database db, int newVersion) async {

        await db.execute('CREATE TABLE $usersTable($id INTEGER PRIMARY KEY AUTOINCREMENT, $email TEXT, '
				'$password TEXT,  $birthDate TEXT)');
	}
      }

   Future<List<Map<String, dynamic>>> getusersMap () async {
    Database db = await initializeDatabase() ;
    var result = await db.query(usersTable);
    return result;
  }

  Future<int> insertUser(User user) async {
    Database db = await initializeDatabase() ;
    var result = await db.insert(usersTable, user.toMap());
    return result;
  }

   Future getUsers() async {

		var userMap = await getusersMap(); // Get 'Map List' from database

	/* 	List<Note> noteList = List<Note>();
		// For loop to create a 'Note List' from a 'Map List'
		for (int i = 0; i < count; i++) {
			noteList.add(Note.fromMapObject(noteMapList[i]));
		} */

    var user  = User.fromMapObject(userMap[0]);

		return user;
	}


 /*  var user  = new User(1, "tam@gmail.com", "sdsdsdsds", "644644");

  var insert  = insertUser(user); */


}