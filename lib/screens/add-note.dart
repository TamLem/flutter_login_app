import 'package:flutter/material.dart';
import 'home.dart';
import '../models/notes.dart';
import '../utils/db-helper.dart';


class AddNote extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
            primaryColor: Colors.blue,
            buttonTheme: ButtonThemeData(
            buttonColor: Color(0xff00adb5),
            )),
      home: Scaffold(
        appBar: AppBar(title: Center(child: Text('Add Note'))),
        body: AddNoteBody(),
      ),
    );
  }
}

class AddNoteBody extends StatefulWidget {
  @override
  _AddNoteBodyState createState() => _AddNoteBodyState();
}

class _AddNoteBodyState extends State<AddNoteBody> {
  final dbWorker = DbHelper();
  final _formKey = GlobalKey<FormState>();
  //Open Database connection
  
  insertNote(note) async {
   await dbWorker.insertNote(note);
  }
  var note = new Note();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 60.0),
        width: MediaQuery.of(context).copyWith().size.width / 1.2,
        height: MediaQuery.of(context).copyWith().size.height / 1,
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget> [
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Title"
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                    },
                  onSaved: (String value) {
                    note.title = value;
                  },
                ),

                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Enter your note here'
                  ),
                  maxLines: 3,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                    },  
                  onSaved: (String value) {
                    note.noteText = value;
                  },    
                ),
                
                Padding(padding: const EdgeInsets.symmetric(vertical: 20.0)),

                RaisedButton(
                  child: Text('Save'),
                  onPressed: () {
                    _formKey.currentState.save();
                    print(note);
                    insertNote(note);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => NotesList()));
                  }
                )


              ]
            ),
          )

        ),
      ),
    );
    
  }
  
}