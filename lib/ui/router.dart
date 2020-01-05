import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:works/src/categorias/construccion.dart';
import 'package:works/ui/views/homeView.dart';
import 'package:works/ui/views/introScreen.dart';
import 'package:works/login.dart';
import './views/postAdd.dart';
import './views/postDetails.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => IntroScreen());
      case '/postAdd':
        return MaterialPageRoute(builder: (_) => AddTrabajo());
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginMenu());
      case '/homeView':
        return MaterialPageRoute(builder: (_) => HomeView());
      case '/postDetails':
        return MaterialPageRoute(builder: (_) => TrabajoDetails());
      case '/construccionPage':
        return MaterialPageRoute(builder: (_) => ConstruccionPage());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
