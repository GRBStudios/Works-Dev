import 'package:flutter/material.dart';
import 'package:works/core/models/postModel.dart';
import 'package:provider/provider.dart';
import '../../core/viewmodels/CRUDModel.dart';

class AddTrabajo extends StatefulWidget {
  @override
  _AddTrabajoState createState() => _AddTrabajoState();
}

class _AddTrabajoState extends State<AddTrabajo> {
  final _formKey = GlobalKey<FormState>();
  String productType = 'Construcción';
  String titulo;

  String descripcion;

  @override
  Widget build(BuildContext context) {
    var productProvider = Provider.of<CRUDModel>(context);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Añadir Post'),
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                  autofocus: true,
                  textCapitalization: TextCapitalization.sentences,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Titulo del Problema',
                    fillColor: Colors.grey[300],
                    filled: true,
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Por favor, ingrese el título del problema';
                    }
                    return null;
                  },
                  onSaved: (value) => titulo = value),
              SizedBox(
                height: 16,
              ),
              TextFormField(
                  textCapitalization: TextCapitalization.sentences,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Por favor, describa su problema';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.text,
                  autofocus: false,
                  initialValue: '',
                  maxLines: 12,
                  decoration: InputDecoration(
                    hintText: "Escribe aquí tu problema",
                    border: OutlineInputBorder(),
                  ),
                  onSaved: (value) => descripcion = value),
              DropdownButton<String>(
                value: productType,
                onChanged: (String newValue) {
                  setState(() {
                    productType = newValue;
                  });
                },
                items: <String>[
                  'Construcción',
                  'Electricidad',
                  'Albañileria',
                  'Gasfitería',
                  'Electronica'
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              RaisedButton(
                splashColor: Colors.red,
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    await productProvider.addTrabajo(Trabajo(
                        titulo: titulo,
                        descripcion: descripcion,
                        categoria: productType.toLowerCase()));
                    Navigator.pop(context);
                  }
                },
                child:
                    Text('Añadir Post', style: TextStyle(color: Colors.white)),
                color: Colors.blue,
              )
            ],
          ),
        ),
      ),
    );
  }
}
