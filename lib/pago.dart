import 'package:flutter/material.dart';


class PagoPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return PagoState();
  }
}

class PagoState extends State<PagoPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Pago"),
        ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: ListView(
          padding: EdgeInsets.only(left: 20),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 26),
              child: Text(
                "Metodos de Pago",
                style: TextStyle(color: Colors.grey),
              ),
            ),
            Row(
              children: <Widget>[
                Icon(Icons.payment),
                SizedBox(
                  width: 10,
                ),
                Text("Efectivo")
              ],
            ),
            SizedBox(height: 20,),
            GestureDetector(
              onTap: () {Navigator.pushNamed(context, '/tipopago-page');},
              child: Text("Agregar Metodo de Pago",
              style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

