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
      body: Center(
        child: ElevatedButton(
          child: Text('¿Ya tienes cuenta? Inicia sesión'),
          onPressed: () {
            Navigator.pop(
              context,
              MaterialPageRoute(builder: (context) => LoginApp()),
            );
          },
        ),
      ),
    );
  }
}
