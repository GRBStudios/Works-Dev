import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TipoPagoPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TipoPagoState();
  }
}

class TipoPagoState extends State<TipoPagoPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Agregar Metodo de Pago"),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: ListView(
          padding: EdgeInsets.only(left: 20),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 40),
              child: Row(
                children: <Widget>[
                  Icon(Icons.payment),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(onTap: () {Navigator.pushNamed(context, "/tarjeta-page");},
                    child: Text("Tarjeta de Credito o Debito"),),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}