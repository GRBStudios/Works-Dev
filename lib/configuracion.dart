import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:works/first_page.dart';

class ConfiguracionPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ConfiguracionState();
  }
}

class ConfiguracionState extends State<ConfiguracionPage> {

  @override
  Widget build(BuildContext context) {
    final signOut = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        borderRadius: BorderRadius.circular(30.0),
        shadowColor: Colors.lightBlueAccent.shade100,
        elevation: 5.0,
        child: MaterialButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)
            ),
            minWidth: 200.0,
            height: 42.0,
            onPressed: () {
              signOutGoogle();
            },
            color: Colors.lightGreen,
            child: Text('Cerrar Sesión', style: TextStyle(color: Colors.black))
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Configuración"),
        backgroundColor: Colors.lightGreen,
      ),
      body: signOut,
    );
  }

  void signOutGoogle() async {
    FirebaseAuth.instance.signOut().whenComplete(() {
      GoogleSignIn().signOut().whenComplete(() {
        print('Se cerró sesión segun esta wea');
        Navigator.of(context).pushNamed('/first-page');
      }).catchError((err) {
        print(err);
      });
    }).catchError((e) {
      print(e);
    });
  }
}