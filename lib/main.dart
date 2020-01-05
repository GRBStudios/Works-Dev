import 'package:flutter/material.dart';
import 'package:works/ayuda.dart';
import 'package:works/configuracion.dart';
import 'package:works/first_page.dart';
import 'package:works/locator.dart';
import 'package:works/login.dart';
import 'package:works/ui/views/homeView.dart';
import 'package:works/pago.dart';
import 'package:works/perfil.dart';
import 'package:works/publicacion.dart';
import 'package:works/registro.dart';
import 'package:works/solicitudes.dart';
import 'package:works/tarjeta.dart';
import 'package:works/tipopago.dart';
import 'package:works/src/categorias/construccion.dart';
import 'package:provider/provider.dart';
import './ui/router.dart';
import './locator.dart';
import './core/viewmodels/CRUDModel.dart';
import './core/viewmodels/CRUDPerfil.dart';

  final routes = {
    '/login-page': (BuildContext context) => new LoginMenu(),
    '/registro-page': (BuildContext context) => new Registro(),
    '/home-page': (BuildContext context) => new HomeView(),
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

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(builder: (_) => locator<CRUDModel>()),
        ChangeNotifierProvider(builder: (_) => locator<CRUDPerfil>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        title: 'WorkS',
        theme: ThemeData(),
        onGenerateRoute: Router.generateRoute,
        routes: routes,
      ),
    );
  }
}