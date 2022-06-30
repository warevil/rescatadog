import 'package:flutter/material.dart';
import 'widgets/profile_Item.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Map<String, dynamic> data = {
    'image': 'https://i.postimg.cc/1XbYvZ2p/woman.jpg',
    'name': 'Mari Doe',
    'email': 'example@email.com',
    'phone': '999999999',
    'address': 'calle s/n 123 av. Sur',
    'aboutme':
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
  };
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.white),
              onPressed: null,
            ),
            title: Text('PERFIL DE USUARIO')),
        body: ProfileItem(data));
  }
}
