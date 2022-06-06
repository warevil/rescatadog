import 'package:flutter/material.dart';
// import 'widgets/profile_about.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.white),
              onPressed: null,
            ),
            title: Text('PERFIL DE USUARIO')),
        body: Column(
          children: [
            getProfileImage('https://i.postimg.cc/1XbYvZ2p/woman.jpg'),
            Container(
                width: 350,
                child: Column(
                  children: [
                    getName('Mari Doe'),
                    getEmail('example@email.com'),
                    getPhone('999999999'),
                    getBased('calle s/n 123 av. Sur'),
                    Container(
                      padding: EdgeInsets.only(top: 8),
                      width: 350,
                      child: Text('Acerca de mi...',
                          style: TextStyle(
                              fontFamily: 'OpenSans',
                              fontWeight: FontWeight.bold,
                              fontSize: 16)),
                    ),
                    getAbout(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.')
                  ],
                )),
          ],
        ));
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
