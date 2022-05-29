import 'package:flutter/material.dart';

class PerfilAbout extends StatelessWidget {
  PerfilAbout(this.description, {Key? key}) : super(key: key);
  String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      child: Text('${this.description}',
          style: TextStyle(fontFamily: 'OpenSans', fontSize: 16)),
    );
  }
}