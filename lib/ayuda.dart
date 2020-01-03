import 'package:flutter/material.dart';

class Ayuda extends StatelessWidget{
  static String tag = 'ayuda-page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ayuda"),
      )
    );
  }
}