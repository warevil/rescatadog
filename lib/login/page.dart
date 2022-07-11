import 'package:flutter/material.dart';
import '../register/page.dart';

import 'package:http/http.dart' as http;
import './user_secure_storage.dart';
import 'dart:developer';
import 'dart:convert';

Future<User> loginUser(String username, String password) async {
  final response = await http.post(
      Uri.parse('http://localhost:8000/api/auth/token'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(
          <String, String>{'username': username, 'password': password}));
  log(response.body);
  return User.fromJson(jsonDecode(response.body));
}

class User {
  final String access_token;
  final String token_type;
  final String detail;

  const User(
      {required this.access_token,
      required this.token_type,
      required this.detail});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        access_token: json['access_token'],
        token_type: json['token_type'],
        detail: json['detail']);
  }
}

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
  final _formkey = GlobalKey<FormState>();
  // Inicialmente la contraseña no es visible
  bool _obscureText = true;
  // Cambia la visibilidad de la contraseña
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  Future<User>? _futureUser;
  String token = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }

  Future init() async {
    final token = await UserSecureStorage.getToken() ?? '';

    setState(() {
      this.token = token;
    });
  }

  // Controladores
  TextEditingController usernameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            margin: EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 40),
            padding: EdgeInsets.only(top: 40, left: 50, right: 50, bottom: 40),
            child: (_futureUser != null)
                ? buildFutureBuilder()
                : Center(
                    child: Column(
                      children: [
                        Image.asset('assets/img/dog.png', height: 110),
                        Form(
                          key: _formkey,
                          child: Column(children: <Widget>[
                            SizedBox(height: 50),
                            usernameText(),
                            passwordText(),
                            Container(
                              margin: EdgeInsets.only(top: 25, bottom: 10),
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
                                          builder: (context) => RegisterApp()));
                                },
                                child: const Text(
                                  '¿No tienes cuenta? Regístrate',
                                  style: TextStyle(fontSize: 10.0),
                                ),
                              ),
                            ),
                            Text("Token: ${token}")
                          ]),
                        )
                      ],
                    ),
                  )));
  }

  Widget usernameText() {
    return TextFormField(
      controller: usernameController,
      decoration: InputDecoration(
          labelText: "Ingrese su nombre de usuario",
          icon: const Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: const Icon(Icons.person))),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Ingrese su nombre de usuario!!';
        } else {
          return null;
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
              controller: passwordController,
              obscureText: _obscureText,
              decoration: InputDecoration(
                  labelText: "Ingrese su contraseña",
                  icon: const Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: const Icon(Icons.lock))),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Ingrese su contraseña!!';
                } else {
                  if (value.length < 8) {
                    return 'La contraseña debe tener al menos 8 caracteres';
                  } else {
                    return null;
                  }
                }
              },
            )),
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
              label: Text(''),
            ))
      ],
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
              content: Text('Accesando al Sistema'),
              behavior: SnackBarBehavior.floating,
              margin: EdgeInsets.only(bottom: 75.0)));
        }
        setState(() {
          _futureUser =
              loginUser(usernameController.text, passwordController.text);
        });
      },
      child: Text('Login',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0)),
    );
  }

  FutureBuilder<User> buildFutureBuilder() {
    return FutureBuilder<User>(
      future: _futureUser,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          UserSecureStorage.setToken(snapshot.data!.access_token);
          return Text(
              'Token de acceso: ${snapshot.data!.access_token}\ntipo de token: ${snapshot.data!.token_type}\nDetail: ${snapshot.data!.detail}');
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
