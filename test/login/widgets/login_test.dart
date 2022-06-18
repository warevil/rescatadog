import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rescatadog/login/page.dart';
import '../widgets/login_test.dart';

void main() {
  testWidgets('login ...', (tester) async {
    await tester.pumpWidget(LoginApp());
  });
}

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final titulo = 'Formulario de Validacion de Campos !!';
    return MaterialApp(
      home: Scaffold(
        appBar: (AppBar(title: Text(titulo))),
        body: LoginApp(),
      ),
    );
  }
}
