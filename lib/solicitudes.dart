import 'package:flutter/material.dart';

class SolicitudesPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SolicitudesState();
  }
}

class SolicitudesState extends State<SolicitudesPage>{
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Solicitudes'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                text: 'Activas',
              ),
              Tab(
                text: 'Concretadas',
              ),
              Tab(
                text: 'Fallidas',
              )
            ],
          ),
        ),
      ),
    );
  }
}
