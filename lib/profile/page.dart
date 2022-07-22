import 'package:flutter/material.dart';
import 'package:rescatadog/home/page.dart';
import 'package:rescatadog/profile/data/repository.dart';
import 'package:rescatadog/profile/data/models.dart';
import 'widgets/profile_Item.dart';

class ProfileUser extends StatefulWidget {
  const ProfileUser({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<ProfileUser> {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            // leading: IconButton(
            //   icon: Icon(Icons.arrow_back_ios, color: Colors.white),
            //   onPressed: () {
            //     _showSecondPage(context);
            //   },
            // ),
            title: Text('PERFIL DE USUARIO')),
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

  // void _showSecondPage(BuildContext context) {
  //   final route = MaterialPageRoute(builder: (BuildContext context) {
  //     return HomePage();
  //   });
  //   Navigator.of(context).push(route);
  // }
}
