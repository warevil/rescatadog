import 'package:flutter/material.dart';
import 'widgets/perfil_item_about.dart';

class Perfil extends StatelessWidget {
  const Perfil({super.key});

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: Icon(Icons.arrow_back), title: Text('PERFIL DE USUARIO')),
        body: Column(
          children: [
            Container(
              height: 240,
              margin: EdgeInsets.only(
                top: 20.0,
                bottom: 20.0,
              ),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://i.postimg.cc/1XbYvZ2p/woman.jpg'))),
            ),
            Container(
                width: 350,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(bottom: 8),
                      child: Row(children: [
                        Container(child: Icon(Icons.account_circle_outlined)),
                        Container(
                          child: Container(
                            padding: EdgeInsets.only(left: 8),
                            child: Text('Mari Doe',
                                style: TextStyle(
                                    fontFamily: 'OpenSans', fontSize: 16)),
                          ),
                        ),
                      ]),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 8),
                      child: Row(children: [
                        Container(child: Icon(Icons.mail_outline)),
                        Container(
                          child: Container(
                            padding: EdgeInsets.only(left: 8),
                            child: Text('example@email.com',
                                style: TextStyle(
                                    fontFamily: 'OpenSans', fontSize: 16)),
                          ),
                        ),
                      ]),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 8),
                      child: Row(children: [
                        Container(child: Icon(Icons.phone)),
                        Container(
                          child: Container(
                            padding: EdgeInsets.only(left: 8),
                            child: Text('999999999',
                                style: TextStyle(
                                    fontFamily: 'OpenSans', fontSize: 16)),
                          ),
                        ),
                      ]),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 8),
                      child: Row(children: [
                        Container(child: Icon(Icons.location_on)),
                        Container(
                          child: Container(
                            padding: EdgeInsets.only(left: 8),
                            child: Text('calle s/n 123 av. Sur',
                                style: TextStyle(
                                    fontFamily: 'OpenSans', fontSize: 16)),
                          ),
                        ),
                      ]),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 8),
                      width: 350,
                      child: Text('Acerca de mi...',
                          style: TextStyle(
                              fontFamily: 'OpenSans',
                              fontWeight: FontWeight.bold,
                              fontSize: 16)),
                    ),
                    PerfilAbout(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.')
                  ],
                )),
          ],
        ));
  }
}
