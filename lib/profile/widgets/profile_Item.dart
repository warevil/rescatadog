import 'package:flutter/material.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem(this.userData, {Key? key}) : super(key: key);
  final Map<String, dynamic> userData;

  Widget build(BuildContext context) {
    return Column(
      children: [
        getProfileImage(userData['image']),
        Container(
            width: 350,
            child: Column(
              children: [
                getName(userData['name']),
                getEmail(userData['email']),
                getPhone(userData['phone']),
                getBased(userData['address']),
                Container(
                  padding: EdgeInsets.only(top: 8),
                  width: 350,
                  child: Text('Acerca de mi...',
                      style: TextStyle(
                          fontFamily: 'OpenSans',
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),
                ),
                getAbout(userData['aboutme'])
              ],
            )),
      ],
    );
  }

  getProfileImage(String url) {
    return Container(
      height: 240,
      margin: EdgeInsets.only(
        top: 20.0,
        bottom: 20.0,
      ),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(image: NetworkImage('${url}'))),
    );
  }

  getName(String name) {
    return Container(
      padding: EdgeInsets.only(bottom: 8),
      child: Row(children: [
        Container(child: Icon(Icons.account_circle_outlined)),
        Container(
          child: Container(
            padding: EdgeInsets.only(left: 8),
            child: Text('${name}',
                style: TextStyle(fontFamily: 'OpenSans', fontSize: 16)),
          ),
        ),
      ]),
    );
  }

  getPhone(String phone) {
    return Container(
      padding: EdgeInsets.only(bottom: 8),
      child: Row(children: [
        Container(child: Icon(Icons.phone)),
        Container(
          child: Container(
            padding: EdgeInsets.only(left: 8),
            child: Text('${phone}',
                style: TextStyle(fontFamily: 'OpenSans', fontSize: 16)),
          ),
        ),
      ]),
    );
  }

  getEmail(String email) {
    return Container(
      padding: EdgeInsets.only(bottom: 8),
      child: Row(children: [
        Container(child: Icon(Icons.mail_outline)),
        Container(
          child: Container(
            padding: EdgeInsets.only(left: 8),
            child: Text('${email}',
                style: TextStyle(fontFamily: 'OpenSans', fontSize: 16)),
          ),
        ),
      ]),
    );
  }

  getBased(String based) {
    return Container(
      padding: EdgeInsets.only(bottom: 8),
      child: Row(children: [
        Container(child: Icon(Icons.location_on)),
        Container(
          child: Container(
            padding: EdgeInsets.only(left: 8),
            child: Text('${based}',
                style: TextStyle(fontFamily: 'OpenSans', fontSize: 16)),
          ),
        ),
      ]),
    );
  }

  getAbout(String description) {
    return Container(
      width: 350,
      child: Text('${description}',
          style: TextStyle(fontFamily: 'OpenSans', fontSize: 16)),
    );
  }
}
