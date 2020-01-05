import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:works/ui/views/addPerfilView.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = GoogleSignIn();

Future<FirebaseUser> _handleSignIn() async {
  final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
  final GoogleSignInAuthentication googleAuth = await googleUser
      .authentication;


  final AuthCredential credential = GoogleAuthProvider.getCredential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );

  final FirebaseUser user = (await _auth.signInWithCredential(credential))
      .user;
  print("signed in " + user.displayName);
  assert(!user.isAnonymous);
  assert(await user.getIdToken() != null);

  // Checking if email and name is null
  assert(user.email != null);

  return user;
}

class LoginMenu extends StatefulWidget{
  static String tag = 'login-page';
  LoginMenu({Key, key, this.title}): super(key: key);

  final String title;
  @override
  _LoginMenuState createState() => _LoginMenuState();

}

class _LoginMenuState extends State<LoginMenu>{
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    final email = TextFormField(
      validator: (value){
        if(value.isEmpty){
          return 'Por favor, ingrese un correo electrónico';
        }
        if(!EmailValidator.validate(value, true)){
            return 'Por favor, ingrese un correo válido';
        }
        return null;
      },
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      initialValue: 'arturo.pantoja@gmail.com',
      decoration: InputDecoration(
        hintText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0)
        ),
      ),
    );

    final password = TextFormField(
      validator: (value){
        if(value.isEmpty){
          return 'Por favor, ingrese una contraseña';
        }
        return null;
      },
      autofocus: false,
      initialValue: '',
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Contraseña',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32.0)
        ),
      ),
    );

    final loginButton = Padding(
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
          if (_formKey.currentState.validate()) {
            Navigator.of(context).pushNamedAndRemoveUntil(
              '/home-page', (Route<dynamic> route) => false);
            }
          },
          color: Colors.lightBlueAccent,
          child: Text('Ingresar', style: TextStyle(color: Colors.white))
        ),
      ),
    );

    final forgotLabel = FlatButton(
      child: Text(
        'Olvidó su Contraseña?',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () {},
    );



    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
      child: Form(
        key: _formKey,
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlutterLogo(size: 150),
                SizedBox(height: 50),
                email,
                SizedBox(height: 8.0),
                password,
                SizedBox(height: 24.0),
                _normalSignInButton(),
                _signInButton(),
                forgotLabel
              ],
            ),

          ],
         ),
        ),
      ),
    );
  }


  Widget _signInButton() {
    return OutlineButton(
      splashColor: Colors.grey,
      onPressed: () {
        _handleSignIn().then((FirebaseUser user){
          print('usuario - $user');
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return (AddPerfil());
              },
            ),
          );
        }).catchError((e) => print(e));
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      highlightElevation: 0,
      borderSide: BorderSide(color: Colors.grey),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(image: AssetImage("assets/google_logo.png"), height: 35.0),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Iniciar Sesión con Google',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  Widget _normalSignInButton() {
    return OutlineButton(
      splashColor: Colors.grey,
      onPressed: () {

      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      highlightElevation: 0,
      borderSide: BorderSide(color: Colors.grey),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 24.0, right: 24.0),
              child: Text(
                'Iniciar Sesión',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}