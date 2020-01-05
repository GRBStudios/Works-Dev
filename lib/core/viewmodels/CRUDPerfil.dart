import 'dart:async';
import 'package:flutter/material.dart';
import 'package:works/core/models/perfilModel.dart';
import '../services/api.dart';
import '../models/perfilModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CRUDPerfil extends ChangeNotifier {
  Api _api = new Api('perfil');

  List<Perfil> perfil;

  Future<List<Perfil>> fetchPerfil() async {
    var result = await _api.getDataCollection();
    perfil = result.documents
        .map((doc) => Perfil.fromMap(doc.data, doc.documentID))
        .toList();
    return perfil;
  }

  Stream<QuerySnapshot> fetchPerfilAsStream() {
    return _api.streamDataCollection();
  }

  Future<Perfil> getPerfilById(String id) async {
    var doc = await _api.getDocumentById(id);
    return Perfil.fromMap(doc.data, doc.documentID);
  }

  Future removePerfil(String id) async {
    await _api.removeDocument(id);
    return;
  }

  Future updatePerfil(Perfil data, String id) async {
    await _api.updateDocument(data.toJson(), id);
    return;
  }

  Future addPerfil(Perfil data) async {
    var result = await _api.addDocument(data.toJson());
    return;
  }
}
