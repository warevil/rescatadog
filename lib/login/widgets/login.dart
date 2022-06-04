import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.black38,
                  blurRadius: 25.0,
                  spreadRadius: 5.0,
                  offset: Offset(5.0, 5.0)),
            ],
            color: Colors.white70,
          ),
          margin: EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 50),
          padding: EdgeInsets.only(top: 50, left: 80, right: 80, bottom: 50),
          child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                Text(
                  'Bienvenido a ResCATaDOG',
                  style: TextStyle(fontSize: 24),
                ),
                Image.asset('assets/img/dog.png', height: 110),
                CampoText1(),
                SizedBox(
                  height: 50,
                ),
                CampoText2(),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(color: Colors.blue),
                  // borderRadius: BorderRadius.circular(10),
                  child: Boton(),
                ),
                SizedBox(
                  height: 50,
                ),
                Text("¿Aún no estás registrado? Crea una cuenta!")
              ]))),
    );
  }

  Widget CampoText1() {
    return TextField(
      controller: email,
      decoration: InputDecoration(hintText: "Ingresa tu email"),
    );
  }

  Widget CampoText2() {
    return TextField(
      controller: password,
      obscureText: true,
      decoration: InputDecoration(hintText: "Ingresa tu contraseña"),
    );
  }

  Widget Boton() {
    return FlatButton(
      child: Text(
        'Login',
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
      onPressed: () {},
    );
  }
}
