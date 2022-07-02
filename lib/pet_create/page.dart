import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

storePet(requestBody) async {
  final response = await http.post(Uri.parse('https://rescatadog.herokuapp.com/api/pets/'), headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJoZXJiZXJ0LmFyc2lsdmFAZ21haWwuY29tIiwiZXhwIjoxNjU2ODM3NTE5fQ.9foAm18rt60jVKBsBfNRVbdkGir1QbNMa8WTKPcqfnQ',
  }, body: json.encode(requestBody));
  print(response.body);
}

class CreatePetApp extends StatelessWidget
{
  const CreatePetApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    final titulo ='Registro de una mascota';
    return MaterialApp(
      title: titulo,
      home: const CreatePetPage(title: 'Create pet'),
    );
  }
}

class CreatePetPage  extends StatefulWidget
{
  const CreatePetPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State< CreatePetPage> createState() => _CreatePetState();
}

class _CreatePetState extends State<CreatePetPage>
{
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _description = TextEditingController();
  final TextEditingController _url = TextEditingController();
  final TextEditingController _petCategory = TextEditingController();
  final TextEditingController _gender = TextEditingController();
  final TextEditingController _age = TextEditingController();
  final TextEditingController _location = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: (
            AppBar(title: Text('Crear Mascota'))),
        body: Form(
            key: _formkey,
            child: ListView(shrinkWrap: true, children: <Widget>[
              Padding(
                padding: EdgeInsets.all(16.0),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Ingresa nombre';
                    }
                    return null;
                  },
                  controller: _name,
                  decoration: InputDecoration(
                    hintText: 'Ingresa el nombre',
                    labelText: "Nombre",
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Categoria de la mascota';
                    }
                    return null;
                  },
                  controller: _petCategory,
                  decoration: InputDecoration(
                    hintText: 'Escribe la categoria de la mascota',
                    labelText: "Categoria de mascota",
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Escribe la descripción';
                    }
                    return null;
                  },
                  controller: _description,
                  decoration: InputDecoration(
                    hintText: 'Escribe la descripción',
                    labelText: "Descripción",
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Ingresa la url de la imagen';
                    }
                    return null;
                  },
                  controller: _url,
                  decoration: InputDecoration(
                    hintText: 'Ingresa la url de la imagen',
                    labelText: "Url",
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Ingresa el sexo';
                    }
                    return null;
                  },
                  controller: _gender,
                  decoration: InputDecoration(
                    hintText: 'Ingresa el sexo de la mascota',
                    labelText: "Sexo",
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Edad';
                    }
                    return null;
                  },
                  controller: _age,
                  decoration: InputDecoration(
                    hintText: 'Ingresa la edad de la mascota',
                    labelText: "Edad",
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Ingresa ubicacion';
                    }
                    return null;
                  },
                  controller: _location,
                  decoration: InputDecoration(
                    hintText: 'Ingresa la ubicacion',
                    labelText: "Ubicacion",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 80,horizontal: 120),
                child: RaisedButton(
                  onPressed: ()
                  {
                    if(_formkey.currentState!.validate()) {
                      var requestData = {
                        'name': _name.text,
                        'description': _description.text,
                        'url': _url.text,
                        'pet_category_id': int.parse(_petCategory.text),
                        'gender': _gender.text,
                        'age': int.parse(_age.text),
                        'location': _location.text
                      };
                      storePet(requestData);
                      Scaffold.of(context).showSnackBar(
                          SnackBar(content: Text("Guardando pet en el sistema"))
                      );
                    }
                  },
                  child: Text('Entrar'),
                  color: Colors.blue,
                  textColor: Colors.white,
                ),
              )],
            )
        )
    );
  }
}
