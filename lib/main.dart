import 'package:flutter/material.dart';
import 'dart:async';
import 'package:login/model.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
 User user = User( 1, '', '', '');


 var myController = TextEditingController();
   
   @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    myController.dispose();
    super.dispose();
  }

  DateTime _dateTime;
  Widget build (BuildContext context){
    final _formKey = GlobalKey<FormState>();
    

    return Form(
      key: _formKey,
      child: SingleChildScrollView( 
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[


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
                      user.email = value;
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
                      user.password = value;
              },
          ),


          Padding(padding: const EdgeInsets.symmetric(vertical: 16.0)),

          TextFormField(
            controller: myController,
            decoration: const InputDecoration(
              labelText: "Birth Date"
            ),
            onTap: () {
                showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1920),
                  lastDate: DateTime(2021)
                ).then ( (date) {_dateTime = date; 
                    myController.text = "${_dateTime.day.toString()}-${_dateTime.month.toString().padLeft(2,'0')}-${_dateTime.year.toString().padLeft(2,'0')}"; });
            },
            validator: (value) {
              if (value.isEmpty) {
                return 'Please select date';
              }
              return null;
              },
              onSaved: (String value) {
                      user.birthDate = value;
              },
          ),

          
          Padding(padding: const EdgeInsets.symmetric(vertical: 16.0)),
          
          Center(child: RaisedButton (
            onPressed: () {
              if (_formKey.currentState.validate()) {

                  _formKey.currentState.save();
               
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => WelcomePage( user: this.user )));
                
              }
            },
            child: Text('Sign Up!')
          ))
          
        ],
      ))
    );
  }

}

class WelcomePage extends StatelessWidget {

  User user;
  WelcomePage({this.user});
  
  @override 
  Widget build (BuildContext context) {
    return Scaffold (
        appBar: AppBar(
          title: Center(child:Text('Registration Succesful')),
        ),
        body: Center(
          child: Text(user.email + " has registered Succesfully", style: TextStyle(fontSize: 22)))
    );
  }
}

