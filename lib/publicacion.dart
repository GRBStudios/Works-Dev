import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:io';

class PublicacionPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return PublicacionState();
  }
}


class PublicacionState extends State<PublicacionPage>{

  final _formKey = GlobalKey<FormState>();
  File _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }
  @override
  Widget build(BuildContext context) {

    final titulo =
    ListTile(
        leading: const Icon(Icons.label),
        title: new TextFormField(
      validator: (value){
        if(value.isEmpty){
          return 'Por favor, ingrese un título';
        }
        return null;
      },
      keyboardType: TextInputType.text,
      autofocus: false,
      initialValue: '',
      decoration: InputDecoration(
        hintText: 'Título',
      ),
    )
    );
    String dropdownValue = 'Construcción';
    final area =
    ListTile(
      leading: const Icon(Icons.label),
      title: new DropdownButton<String>(
          value: dropdownValue,

          onChanged: (String newValue) {
            setState(() {
              dropdownValue = newValue;
            });
          },
          items: <String>['Construcción', 'Electricidad', 'Gasfitería', 'Albañilería', 'Electrónica']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
    );
    final descripcion =
    ListTile(
        leading: const Icon(Icons.label),
        title: new TextFormField(
          validator: (value){
            if(value.isEmpty){
              return 'Por favor, ingrese describa su problema';
            }
            return null;
          },
          keyboardType: TextInputType.text,
          autofocus: false,
          initialValue: '',
          maxLines: 12,
          decoration: InputDecoration(hintText: "Escribe aquí tu problema", border: OutlineInputBorder(),),
        )
    );

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Crear una Publicación"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text('CUÉNTANOS TU PROBLEMA',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                ),
                titulo,
                area,
                descripcion,
                ListTile(
                  leading: const Icon(Icons.label),
                  title: _image == null
                      ? Text('Ninguna imagen seleccionada.')
                      : Image.file(_image),
                ),

                MaterialButton(
                  shape: CircleBorder(
                  ),
                  onPressed: getImage,
                  child: Icon(Icons.add_a_photo),
                ),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)
                  ),
                  minWidth: 500.0,
                  height: 42.0,
                  onPressed: () {
                    print('Enviado');
                  },
                  color: Colors.lightBlueAccent,
                  child: Text('Enviar Publicación', style: TextStyle(color: Colors.white)),
                ),

          ],
        ),
        ],
        ),
      ),

    );
  }
}