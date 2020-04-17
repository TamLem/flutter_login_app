import 'package:flutter/material.dart';
import 'screens/signup.dart';
import 'screens/login.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:ThemeData(
            primaryColor: Colors.blue,
            buttonTheme: ButtonThemeData(
            buttonColor: Color(0xff00adb5),
            )),
      home: Home(), 

    );
  
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar( title: Center(child: Text('Demo App'))),
            body:  Container(
              padding: EdgeInsets.fromLTRB(0,40,0,0),
              child: Center( 
                      child: Column( 
                        children: <Widget>[
                            Container(
                              child: Text('Welcome to Demo App', style: TextStyle( fontSize: 24), ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0,100,0,0),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget> [
                                RaisedButton(
                                  child: Text('Log in!'),
                                  onPressed:() {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                                  }),
                                RaisedButton(
                                  child: Text('Sign Up!'),
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
                                  })
                              ]
                            )
                            
                ],),
            ),
            )
            
          );    
  }
}