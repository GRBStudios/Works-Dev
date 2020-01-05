import 'dart:async';
import 'package:flutter/material.dart';
import '../../locator.dart';
import '../services/api.dart';
import '../models/postModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CRUDModel extends ChangeNotifier {
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
  Future<Trabajo> getTrabajoByGoogleUser(
      Trabajo data, String googleToken) async {
    var doc = await _api.getDocumentById(googleToken);
    return Trabajo.fromMap(doc.data, doc.documentID);
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
