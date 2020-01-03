import 'package:flutter/material.dart';
import 'package:works/ayuda.dart';
import 'package:works/configuracion.dart';
import 'package:works/first_page.dart';
import 'package:works/login.dart';
import 'package:works/home.dart';
import 'package:works/pago.dart';
import 'package:works/perfil.dart';
import 'package:works/publicacion.dart';
import 'package:works/registro.dart';
import 'package:works/solicitudes.dart';
import 'package:works/tarjeta.dart';
import 'package:works/tipopago.dart';
import 'package:works/src/categorias/construccion.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  final routes = {
    '/login-page': (BuildContext context) => new LoginMenu(),
    '/registro-page': (BuildContext context) => new Registro(),
    '/home-page': (BuildContext context) => new HomePage(),
    '/first-page': (BuildContext context) => new Firstpage(),
    '/perfil-page': (BuildContext context) => new ProfilePage(),
    '/solicitudes-page': (BuildContext context) => new SolicitudesPage(),
    '/pago-page': (BuildContext context) => new PagoPage(),
    '/configuracion-page': (BuildContext context) => new ConfiguracionPage(),
    '/ayuda-page': (BuildContext context) => new Ayuda(),
    '/tipopago-page': (BuildContext context) => new TipoPagoPage(),
    '/tarjeta-page': (BuildContext context) => new TarjetaPage(),
    '/publicacion-page': (BuildContext context) => new PublicacionPage(),
    '/construccion-page': (BuildContext context) => new ConstruccionPage()
  };

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WorkS',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: Firstpage(),
      routes: routes,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
