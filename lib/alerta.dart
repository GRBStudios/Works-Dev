import 'package:flutter/material.dart';

class Alerta extends StatelessWidget {
  static String tag = 'alerta-page';

  TextEditingController _textFieldController = TextEditingController();

  _displayDialog(BuildContext context) async {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TextField in AlertDialog'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Show Alert Dialog'),
          color: Colors.red,
          onPressed: () => _displayDialog(context),
        ),
      ),
    );
  }
}