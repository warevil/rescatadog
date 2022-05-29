import 'package:flutter/material.dart';
import '../widgets/perfil_item_about.dart';

class PetProfile extends StatelessWidget {
  const PetProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: const Icon(Icons.arrow_back), title: const Text('PERFIL DE MASCOTA')),
        body: Column(
          children: [
            Container(
              height: 240,
              margin: const EdgeInsets.only(
                top: 20.0,
                bottom: 20.0,
              ),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://cdn.pixabay.com/photo/2014/03/29/09/17/cat-300572_960_720.jpg'))),
            ),
            Container(
                width: 350,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(bottom: 8),
                      child: Row(children: [
                        Container(child: Icon(Icons.pets)),
                        Container(
                          child: Container(
                            padding: EdgeInsets.only(left: 8),
                            child: Text('Bigotes',
                                style: TextStyle(
                                    fontFamily: 'OpenSans', fontSize: 16)),
                          ),
                        ),
                      ]),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 8),
                      child: Row(children: [
                        Container(child: Icon(Icons.type_specimen)),
                        Container(
                          child: Container(
                            padding: EdgeInsets.only(left: 8),
                            child: Text('Gato',
                                style: TextStyle(
                                    fontFamily: 'OpenSans', fontSize: 16)),
                          ),
                        ),
                      ]),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 8),
                      child: Row(children: [
                        Container(child: Icon(Icons.male)),
                        Container(
                          child: Container(
                            padding: EdgeInsets.only(left: 8),
                            child: Text('Macho',
                                style: TextStyle(
                                    fontFamily: 'OpenSans', fontSize: 16)),
                          ),
                        ),
                      ]),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 8),
                      child: Row(children: [
                        Container(child: Icon(Icons.account_box)),
                        Container(
                          child: Container(
                            padding: EdgeInsets.only(left: 8),
                            child: Text('Andrea Rescatista',
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
                      padding: EdgeInsets.only(top: 8),
                      width: 350,
                      child: Text('Acerca de mi...',
                          style: TextStyle(
                              fontFamily: 'OpenSans',
                              fontWeight: FontWeight.bold,
                              fontSize: 16)),
                    ),
                    PerfilAbout(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.'
                    ),
                    Container(
                        margin: const EdgeInsets.only(top: 20),
                        decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(10)),
                        child: botonAdoptar()
                    ),
                  ],
                )),
          ],
        ));
  }

  Widget botonAdoptar() {
    return FlatButton(
      child: const Text("Adoptame", style: TextStyle(color: Colors.white, fontSize: 20)),
      onPressed: (){},
    );
  }
}
