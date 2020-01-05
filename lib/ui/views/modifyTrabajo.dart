import 'package:flutter/material.dart';
import 'package:works/core/models/postModel.dart';
import 'package:works/core/viewmodels/CRUDModel.dart';
import 'package:provider/provider.dart';

class ModifyTrabajo extends StatefulWidget {
  final Trabajo trabajo;

  ModifyTrabajo({@required this.trabajo});

  @override
  _ModifyTrabajoState createState() => _ModifyTrabajoState();
}

class _ModifyTrabajoState extends State<ModifyTrabajo> {
  final _formKey = GlobalKey<FormState>();

  String categoria;

  String title;

  String descripcion;

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<CRUDModel>(context);
    categoria = widget.trabajo.archivo[0].toUpperCase() +
        widget.trabajo.archivo.substring(1);
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Modify Product Details'),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                  initialValue: widget.trabajo.titulo,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Titulo del Trabajo',
                    fillColor: Colors.grey[300],
                    filled: true,
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter Product Title';
                    }
                    return null;
                  },
                  onSaved: (value) => title = value),
              SizedBox(
                height: 16,
              ),
              TextFormField(
                  initialValue: widget.trabajo.descripcion,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Descripción',
                    fillColor: Colors.grey[300],
                    filled: true,
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Por favor, ingresar una descripción';
                    }
                    return null;
                  },
                  onSaved: (value) => descripcion = value),
              DropdownButton<String>(
                value: categoria,
                onChanged: (String newValue) {
                  setState(() {
                    categoria = newValue;
                  });
                },
                items: <String>[
                  'Construcción',
                  'Electricidad',
                  'Gasfitería',
                  'Albañilería',
                  'Electrónica'
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
                    await productProvider.updateTrabajo(
                        Trabajo(
                            titulo: title,
                            descripcion: descripcion,
                            categoria: categoria.toLowerCase()),
                        widget.trabajo.id);
                    Navigator.pop(context);
                  }
                },
                child: Text('Modify Product',
                    style: TextStyle(color: Colors.white)),
                color: Colors.blue,
              )
            ],
          ),
        ),
      ),
    );
  }
}
