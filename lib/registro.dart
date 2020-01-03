import 'package:flutter/material.dart';
import 'package:works/home.dart';
import 'package:works/login.dart';

class Registro extends StatelessWidget{
  static String tag = 'registro-page';

  @override
  Widget build(BuildContext context) {

    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32.0)
        ),
      ),
    );

    final name = TextFormField(
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'Nombre Usuario',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32.0)
        ),
      ),
    );

    final password = TextFormField(
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'Nueva Contraseña',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32.0)
        ),
      ),
    );

    final signinButton = Padding(
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
              Navigator.of(context).pushNamedAndRemoveUntil('/login-page', (Route<dynamic> route)=>false);
            },
            color: Colors.lightBlueAccent,
            child: Text('Registrarse', style: TextStyle(color: Colors.white))
        ),
      ),
    );

    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.only(left: 24.0, right: 24.0),
              children: <Widget>[
                name,
                SizedBox(height: 8.0),
                email,
                SizedBox(height: 8.0),
                password,
                SizedBox(height: 40.0),
                signinButton,
              ],
            )
        )
    );
  }
}