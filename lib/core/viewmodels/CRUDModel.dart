import 'dart:async';
import 'package:flutter/material.dart';
import '../../locator.dart';
import '../services/api.dart';
import '../models/postModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';



class CRUDModel extends ChangeNotifier {
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

  Api _api = locator<Api>();

  List<Trabajo> trabajos;

  Future<List<Trabajo>> fetchTrabajos() async {
    var result = await _api.getDataCollection();
    trabajos = result.documents
        .map((doc) => Trabajo.fromMap(doc.data, doc.documentID))
        .toList();
    return trabajos;
  }

  /*Future<List<Trabajo>> fetchTrabajosByGoogleId(String googleToken) async {
    Query query = await _api.ref.orderBy('titulo').where(field)

    var result = await _api.getDataCollection();
    trabajos = result.documents
        .map((doc) => Trabajo.fromMap(doc.data, doc.documentID))
        .toList();
    return trabajos;
  }*/


  Stream<QuerySnapshot> fetchTrabajosByGoogleId(String googleToken) {

    return _api.ref.where('googleToken', isEqualTo: googleToken).snapshots();
  }

  Stream<QuerySnapshot> fetchTrabajosAsStream() {
    return _api.streamDataCollection();
  }

  Future<Trabajo> getTrabajoById(String id) async {
    var doc = await _api.getDocumentById(id);
    return Trabajo.fromMap(doc.data, doc.documentID);
  }

  Future removeTrabajo(String id) async {
    await _api.removeDocument(id);
    return;
  }

  Future updateTrabajo(Trabajo data, String id) async {
    await _api.updateDocument(data.toJson(), id);
    return;
  }

  Future addTrabajo(Trabajo data) async {
    var result = await _api.addDocument(data.toJson());
    return;
  }
}
