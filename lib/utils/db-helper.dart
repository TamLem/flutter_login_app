import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';
import '../models/notes.dart';


class DbHelper {
 
  DbHelper._(); //Creates a single instance 
  Database database;
  static DbHelper dbHelper;


  factory DbHelper() {
		if (dbHelper == null) {
			dbHelper = DbHelper._(); // This is executed only once, singleton object
		}
		return dbHelper;
	}

   Future<Database> getDatabase() async {
    if(database == null) {
       database = await openDatabase(
        join(await getDatabasesPath(), 'notes.db'),
        onCreate: (db, version) {
          return db.execute("CREATE TABLE notes(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, noteText TEXT)");
        },
        version: 1,
        );
      return database;
    }
    return database;
  } 

   Future<void> insertNote (Note note) async {
    final Database db = await getDatabase();
    await db.insert('notes', note.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

   Future<List<Note>> getNotes() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> maps = await db.query('notes');
    return List.generate(maps.length, (i) { 
        return Note( 
          title: maps[i]['title'],
          noteText: maps[i]['noteText'],
      );
    }
    );
  }

 /*  final note = Notes(title:'Study', noteText:'Finish flutter today');
  await insertNote(note);

  print(await getNotes()); */

}

