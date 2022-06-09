import 'package:flutter/material.dart';

void main() {
  runApp(LoginApp());
}

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final titulo = 'Bienvenido a ResCATaDOG';
    return MaterialApp(
      home: Scaffold(
        appBar: (AppBar(
          title: Text(titulo),
          centerTitle: true,
        )),
        body: MyHomeLoginApp(),
      ),
    );
  }
}

class MyHomeLoginApp extends StatefulWidget {
  @override
  State<MyHomeLoginApp> createState() => _LoginState();
}

class _LoginState extends State<MyHomeLoginApp> {
  static final RegExp _emailRegExp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9\-\_]+(\.[a-zA-Z]+)*$");

  bool _isEmail(String str) {
    return _emailRegExp.hasMatch(str.toLowerCase());
  }

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            margin: EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 50),
            padding: EdgeInsets.only(top: 50, left: 50, right: 50, bottom: 50),
            child: Center(
              child: Column(
                children: [
                  Image.asset('assets/img/dog.png', height: 110),
                  Form(
                    key: _formkey,
                    child: Column(children: <Widget>[
                      SizedBox(height: 40),
                      emailText(),
                      passwordText(),
                      Container(
                        margin: EdgeInsets.only(top: 25),
                        child: loginButton(),
                      )
                    ]),
                  )
                ],
              ),
            )));
  }

  Widget emailText() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Ingresa tu correo"),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Ingrese su correo';
        } else {
          if (!_isEmail(value.toString())) {
            return 'Ingrese un correo válido';
          } else {
            return null;
          }
        }
      },
    );
  }

  Widget passwordText() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(labelText: "Ingresa tu contraseña"),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Ingrese su contraseña';
        }
      },
    );
  }

  Widget loginButton() {
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      primary: Colors.white,
      minimumSize: Size(88, 44),
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(2.0)),
      ),
      backgroundColor: Colors.blue,
    );

    return TextButton(
      style: flatButtonStyle,
      onPressed: () {
        if (_formkey.currentState!.validate()) {
          Scaffold.of(context)
              .showSnackBar(SnackBar(content: Text('Accesando al Sistema')));
        }
      },
      child: Text('Login'),
    );
  }
}
