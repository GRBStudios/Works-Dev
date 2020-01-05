import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
class Perfil {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<FirebaseUser> _handleSignIn() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
    await googleUser.authentication;



    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final FirebaseUser user =
        (await _auth.signInWithCredential(credential)).user;
    print("signed in " + user.displayName);
    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    // Checking if email and name is null
    assert(user.email != null);
    return user;

  }


  String id;
  String nombre;
  String apellido;
  String tipoUsuario;

  String googleToken;

  Perfil(
      {this.id,
      this.nombre,
      this.apellido,
      this.tipoUsuario,
      this.googleToken});

  Perfil.fromMap(Map snapshot, String id)
      : id = id ?? '',
        googleToken = snapshot['googleToken'] ?? '',
        nombre = snapshot['nombre'] ?? '',
        apellido = snapshot['apellido'] ?? '',
        tipoUsuario = snapshot['tipoUsuario'] ?? '';

  toJson() {
    return {
      "googleToken": googleToken,
      "nombre": nombre,
      "apellido": apellido,
      "tipoUsuario": tipoUsuario,
    };
  }
}
