import 'dart:html';

import 'package:flutter/material.dart';
import 'package:rescatadog/profile/class/api_profile.dart';
import 'package:rescatadog/profile/class/pedido.dart';
import 'widgets/profile_Item.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class ProfileUser extends StatefulWidget {
  const ProfileUser({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<ProfileUser> {
  // Map<String, dynamic> datas = {
  //   'image': 'https://i.postimg.cc/1XbYvZ2p/woman.jpg',
  //   'name': 'Mari Doe',
  //   'email': 'example@email.com',
  //   'phone': 999999999,
  //   'address': 'calle s/n 123 av. Sur',
  //   'aboutme':
  //       'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
  // };
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.white),
              onPressed: null,
            ),
            title: Text('PERFIL DE USUARIO')),
        // body: ProfileItem(data));
        body: FutureBuilder<DataProfile?>(
            future: ApiHttpRequest().dataprofile,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                    child: CircularProgressIndicator.adaptive());
              }
              final DataProfile? data = snapshot.data;
              return ProfileItem(data);
            }));
  }
}
