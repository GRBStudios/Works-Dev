import 'package:flutter/material.dart';

class ConstruccionPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ConstruccionState();
  }
}

class ConstruccionState extends State<ConstruccionPage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Trabajadores del Área de Construcción"),
      ),
      body: Center(
        child: Text('oli'),
      ),
    );
  }
}