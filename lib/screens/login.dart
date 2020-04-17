import 'package:flutter/material.dart';
import 'home.dart';


class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            primaryColor: Colors.blue,
            buttonTheme: ButtonThemeData(
            buttonColor: Color(0xff00adb5),
            )),
        home: Scaffold (
          appBar: AppBar( title: Center( child: Text('Welcome!'))),
          body: LoginForm ())
        );
  }
}

class LoginForm extends StatefulWidget{
  
  @override 
  LoginFormState createState() => LoginFormState();
  
}

class LoginFormState extends State<LoginForm> {

 var myController = TextEditingController();
   
   @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    myController.dispose();
    super.dispose();
  }

  Widget build (BuildContext context){
    final _formKey = GlobalKey<FormState>();
    

    return Form(
      key: _formKey,
      child: Center(
        child: Container (
            width: MediaQuery.of(context).copyWith().size.width / 1.5,
            height: MediaQuery.of(context).copyWith().size.height / 1,
            
                child: SingleChildScrollView( 
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              
              Padding(padding: const EdgeInsets.symmetric(vertical: 16.0)),
              
              Center(child: Text('Log in', style: Theme.of(context).textTheme.title,)),

              Padding(padding: const EdgeInsets.symmetric(vertical: 16.0)),

              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Email"
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter an email';
                  }
                  if (!(value.contains('@') && value.contains('.'))) {
                    return 'Please enter a valid email';
                  }
                  return null;
                  },
                  onSaved: (String value) {
                  },
              ),


              Padding(padding: const EdgeInsets.symmetric(vertical: 16.0)),

              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Password"
                ),
                obscureText: true,
                validator: (value) {
                  if (value.length < 6) {
                    return 'Password should contain at least 6 characters';
                  }
                  return null;
                  },
                  onSaved: (String value) {
                  },
              ),


              Padding(padding: const EdgeInsets.symmetric(vertical: 16.0)),
              
              Center(child: RaisedButton (
                onPressed: () {
                  if (_formKey.currentState.validate()) {

                      _formKey.currentState.save();
                   
                      Navigator.push(context, MaterialPageRoute(builder: (context) => NotesList()));
                    
                  }
                },
                child: Text('Log in!')
              ))
              
            ],
          )),
        ),
      )
    );
  }

}
