// list of Notes
// flotting button
// popup input field
// edit and delete buttons
// detail view of Notes

import 'package:flutter/material.dart';
import 'add-note.dart';
import '../utils/db-helper.dart';
import '../models/notes.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  runApp(NotesList());
}

class NotesList extends StatelessWidget {
 
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
            primaryColor: Colors.blue,
            buttonTheme: ButtonThemeData(
            buttonColor: Color(0xff00adb5),
            )),
        home: Scaffold (
          appBar: AppBar( title: Center( child: Text('Notes'))),
          body: Notes ()
          )
        );
  }
}

class Notes extends StatefulWidget {
  @override
  _NotesState createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  var dbWorker =  new DbHelper();
  List<Note> notes;

 /*  final noteTitle = 'Title';
  final noteText =  'Text'; */
  @override
  Widget build(BuildContext context) {

    if (notes==null) {
      notes = List<Note>();
      getNotes();
    }
   
    return Scaffold(
          body: Container(
            child: ListView.builder(  //insert an expandabel list eidget here, that get data from a database
                itemCount: notes.length,
                itemBuilder: (context, index) {
                  final note = notes[index];
                  return ListTile(
                          leading: Icon(Icons.note),
                          title: Text('${note.title}'),
                          subtitle: Text('${note.noteText}'),
                          trailing: GestureDetector(
                                    behavior: HitTestBehavior.translucent,
                                    onTap: () {},
                                    child: Container(
                                      width: 48,
                                      height: 48,
                                      padding: EdgeInsets.symmetric(vertical: 4.0),
                                      alignment: Alignment.center,
                                      child: Icon(Icons.more_vert),
                                    )
                            ),
                        );
                  }     
              ),     
          ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => AddNote() ));      },
                child: Icon(Icons.add),
                backgroundColor: Colors.green,
        ),
      );
  }

  void getNotes() async {
     await dbWorker.getNotes().then((notes) {
      setState(() {
        this.notes=notes;
      });
      });
     
  }

} 