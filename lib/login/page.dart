import 'package:flutter/material.dart';
import '../register/page.dart';

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

  // Inicialmente la contraseña no es visible
  bool _obscureText = true;
  // Cambia la visibilidad de la contraseña
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            margin: EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 40),
            padding: EdgeInsets.only(top: 40, left: 50, right: 50, bottom: 40),
            child: Center(
              child: Column(
                children: [
                  Image.asset('assets/img/dog.png', height: 110),
                  Form(
                    key: _formkey,
                    child: Column(children: <Widget>[
                      SizedBox(height: 50),
                      emailText(),
                      passwordText(),
                      new TextButton.icon(
                        onPressed: _toggle,
                        icon: Icon(
                          _obscureText
                              ? Icons.remove_red_eye
                              : Icons.hide_source_outlined,
                          size: 24.0,
                        ),
                        label: Text(_obscureText
                            ? 'Mostrar contraseña'
                            : 'Ocultar contraseña'),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10, bottom: 10),
                        width: 150,
                        child: loginButton(),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegisterApp()));
                        },
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size(200, 40),
                            maximumSize: const Size(200, 40)),
                        child: const Text(
                          '¿No tienes cuenta? Regístrate',
                          style: TextStyle(fontSize: 10.0),
                        ),
                      )
                    ]),
                  )
                ],
              ),
            )));
  }

  Widget emailText() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: "Ingresa tu correo",
          icon: const Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: const Icon(Icons.email))),
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
      obscureText: _obscureText,
      decoration: InputDecoration(
          labelText: "Ingresa tu contraseña",
          icon: const Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: const Icon(Icons.lock))),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Ingrese su contraseña';
        } else {
          if (value.length < 8) {
            return 'La contraseña debe tener al menos 8 caracteres';
          } else {
            return null;
          }
        }
      },
    );
  }

  Widget loginButton() {
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      primary: Colors.white,
      minimumSize: const Size(200, 40),
      maximumSize: const Size(200, 40),
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
          Scaffold.of(context).showSnackBar(SnackBar(
              content: Text('Accesando al Sistema'),
              behavior: SnackBarBehavior.floating,
              margin: EdgeInsets.only(bottom: 75.0)));
        }
      },
      child: Text('Login',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0)),
    );
  }
}
