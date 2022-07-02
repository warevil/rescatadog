import 'package:flutter/material.dart';

void main() {
  runApp(CreatePetApp());
}

class CreatePetApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {  final titulo ='Registro de una mascota';
  return MaterialApp(
    home: Scaffold(
      appBar: (
          AppBar(title: Text(titulo))),
      body: HomeCreatePetApp(),
    ),
  );
  }
}

class HomeCreatePetApp  extends StatefulWidget
{
  @override
  State< HomeCreatePetApp> createState() => _HomeCreatePetState();
}

class _HomeCreatePetState extends State< HomeCreatePetApp>
{
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formkey,
        child: Column(
          children:<Widget> [
            SizedBox( height: 40),
            TextFormField(
                decoration: InputDecoration(
                    labelText: 'Nombre : '
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Debe ingresar un nombre a la mascota';
                  }
                }
            )  ,
            TextFormField(
                decoration: InputDecoration(
                    labelText: 'Descripción : '
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Ingrese una descripción';
                  }
                }
            )  ,
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 80,horizontal: 120),
              child: RaisedButton(
                onPressed: ()
                {
                  if(_formkey.currentState!.validate()) {
                    Scaffold.of(context).showSnackBar(
                        SnackBar(content: Text("Guardando pet en el sistema"))
                    );
                  }
                },
                child: Text('Entrar'),
                color: Colors.blue,
                textColor: Colors.white,
              ),
            ),
          ],
        )
    );
  }
}
