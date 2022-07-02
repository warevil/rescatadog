import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Category {
  final int id;
  final String name;

  const Category({
    required this.id,
    required this.name
  });
}

class Profile {
  final int id;
  final String gender;
  final int age;
  final String location;

  const Profile({
    required this.id,
    required this.gender,
    required this.age,
    required this.location
  });
}

class Pet {
  final int id;
  final String name;
  final String description;
  final String url;
  final bool is_adopted;
  final Category category;
  final Profile profile;

  const Pet({
    required this.id,
    required this.name,
    required this.description,
    required this.url,
    required this.is_adopted,
    required this.category,
    required this.profile
  });

  factory Pet.fromJson(Map<String, dynamic> json) {
    return Pet(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      url: json['url'],
      is_adopted: json['is_adopted'],
      category: Category(
        id: json['pet_category']['id'],
        name: json['pet_category']['name']
      ),
      profile: Profile(
        id: json['pet_profile']['id'],
        gender: json['pet_profile']['gender'],
        age: json['pet_profile']['age'],
        location: json['pet_profile']['location']
      )
    );
  }
}

Future<Pet> fetchPet() async {
  final response = await http
      .get(Uri.parse('https://rescatadog.herokuapp.com/api/pets/0'), headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJoZXJiZXJ0LmFyc2lsdmFAZ21haWwuY29tIiwiZXhwIjoxNjU2ODM3NTE5fQ.9foAm18rt60jVKBsBfNRVbdkGir1QbNMa8WTKPcqfnQ',
  });

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Pet.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load pet data');
  }
}

class PetProfile extends StatelessWidget {
  const PetProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue
      ),
      home: const PetProfilePage(title: 'Pet List by id'),
    );
  }
}

class PetProfilePage extends StatefulWidget {
  const PetProfilePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<PetProfilePage> createState() => _MyPetProfileState();
}

class _MyPetProfileState extends State<PetProfilePage> {
  late Future<Pet> futurePet;

  @override
  void initState() {
    super.initState();
    futurePet = fetchPet();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: const Icon(Icons.arrow_back), title: const Text('PERFIL DE MASCOTA')),
        body: Column(
          children: [
            FutureBuilder<Pet>(
              future: futurePet,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return
                    Container(
                      height: 240,
                      margin: const EdgeInsets.only(
                        top: 20.0,
                        bottom: 20.0,
                      ),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(image: NetworkImage(
                              snapshot.data!.url
                          ))
                      ),
                    );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                return const CircularProgressIndicator();
              },
            ),
            FutureBuilder<Pet>(
              future: futurePet,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return
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
                                    child: Text(snapshot.data!.name,
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
                                    child: Text(snapshot.data!.category.name,
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
                                    child: Text(snapshot.data!.profile.gender,
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
                                    child: Text('Miriam Cardenas',
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
                            Container(
                              width: 350,
                              child: Text(snapshot.data!.description,
                                  style: TextStyle(fontFamily: 'OpenSans', fontSize: 16)),
                            ),
                            Container(
                                margin: const EdgeInsets.only(top: 20),
                                decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(10)),
                                child: botonAdoptar()
                            ),
                          ],
                        ));
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                return const CircularProgressIndicator();
              },
            ),
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
