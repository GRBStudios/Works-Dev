import 'package:flutter/material.dart';

class TarjetaPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TarjetaState();
  }
}

class TarjetaState extends State<TarjetaPage>{

  DateTime selectedDate = DateTime.now();

  Future<Null> selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2019, 04),
        lastDate: DateTime(2030)
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Agregar Tarjeta "),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20),
          children: <Widget>[
            TextField(decoration: InputDecoration(prefixIcon: Icon(Icons.credit_card), labelText: "Número de Tarjeta")),
            Row(
              children: <Widget>[
                Flexible(child: TextField(decoration: InputDecoration(hintText: "MM/YY"))),
                SizedBox(width: 40),
                Flexible(child: TextField(decoration: InputDecoration(hintText: "CVV"))),
              ],
            ),
            TextField(decoration: InputDecoration(prefixIcon: Icon(Icons.flag), labelText: "Ciudad")),
            TextField(decoration: InputDecoration(prefixIcon: Icon(Icons.confirmation_number), labelText: "Codigo Postal")),
          ],
        ),
      ),
    );
  }
}