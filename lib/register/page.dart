import 'package:flutter/material.dart';
import '../login/page.dart';

class RegisterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Regístrate en ResCATaDOG'),
          centerTitle: true,
        ),
        body: MyHomeRegisterApp());
  }
}

class MyHomeRegisterApp extends StatefulWidget {
  @override
  State<MyHomeRegisterApp> createState() => _RegisterState();
}

class _RegisterState extends State<MyHomeRegisterApp> {
  static final RegExp _emailRegExp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9\-\_]+(\.[a-zA-Z]+)*$");

  final RegExp _phoneRegExp = RegExp(r"^[0-9]{9}$");

  bool _isEmail(String str) {
    return _emailRegExp.hasMatch(str.toLowerCase());
  }

  bool _isPhoneNumber(String str) {
    return _phoneRegExp.hasMatch(str.toLowerCase());
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

  // Validar confirmación de contraseña
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            margin: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
            padding: EdgeInsets.only(top: 10, left: 50, right: 50, bottom: 10),
            child: Center(
              child: Column(
                children: [
                  Image.asset('assets/img/signup.png', height: 110),
                  Form(
                    key: _formkey,
                    child: Column(children: <Widget>[
                      namesText(),
                      emailText(),
                      passwordText(),
                      confirmPasswordText(),
                      phoneNumberText(),
                      Container(
                        margin: EdgeInsets.only(top: 10, bottom: 10),
                        width: 200,
                        height: 40,
                        child: loginButton(),
                      ),
                      SizedBox(
                        width: 200,
                        height: 25,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginApp()));
                          },
                          child: const Text(
                            '¿Ya tienes una cuenta? Inicia sesión',
                            style: TextStyle(fontSize: 10.0),
                          ),
                        ),
                      )
                    ]),
                  )
                ],
              ),
            )));
  }

  Widget namesText() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new Flexible(
            child: new TextFormField(
              decoration: InputDecoration(
                  labelText: "Nombres",
                  icon: const Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: const Icon(Icons.person))),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Ingrese sus nombres';
                }
              },
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
          new Flexible(
            child: new TextFormField(
              decoration: InputDecoration(
                  labelText: "Apellidos",
                  icon: const Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: const Icon(Icons.person))),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Ingrese sus apellidos';
                }
              },
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
        ]);
  }

  Widget emailText() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: "Ingrese su correo",
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        new Expanded(
          flex: 9,
          child: new TextFormField(
            controller: _pass,
            obscureText: _obscureText,
            decoration: InputDecoration(
                labelText: "Ingrese su contraseña",
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
          ),
        ),
        SizedBox(width: 20.0),
        new Expanded(
            flex: 1,
            child: new TextButton.icon(
              onPressed: _toggle,
              icon: Icon(
                _obscureText
                    ? Icons.remove_red_eye
                    : Icons.hide_source_outlined,
                size: 18.0,
              ),
              label: Text(_obscureText ? 'Mostrar' : 'Ocultar'),
            )),
      ],
    );
  }

  Widget confirmPasswordText() {
    return TextFormField(
      controller: _confirmPass,
      obscureText: true,
      decoration: InputDecoration(
          labelText: "Confirme su contraseña",
          icon: const Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: const Icon(Icons.lock))),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Confirme su contraseña';
        } else {
          if (value != _pass.text) {
            return 'Las contraseñas no coinciden';
          } else {
            return null;
          }
        }
      },
    );
  }

  Widget phoneNumberText() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: "Ingrese su número telefónico",
          icon: const Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: const Icon(Icons.phone))),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Ingrese su teléfono';
        } else {
          if (!_isPhoneNumber(value)) {
            return 'Ingrese un número de teléfono válido';
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
              content: Text('Registrando en el Sistema'),
              behavior: SnackBarBehavior.floating,
              margin: EdgeInsets.only(bottom: 75.0)));
        }
      },
      child: Text('Registrar',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0)),
    );
  }
}
