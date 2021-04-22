import 'package:flutter/material.dart';
import 'settings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login.dart';
//import 'dd.dart';

class ADrawer extends StatefulWidget {
  State createState() => new ADrawerState();
}

class ADrawerState extends State<ADrawer> {
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          new UserAccountsDrawerHeader(
            accountName: new Text('user'),
            accountEmail: new Text('default@gmail.com'),
            currentAccountPicture: new CircleAvatar(
              backgroundImage: new AssetImage('assets/logo.jpg'),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            hoverColor: Colors.red,
            onTap: () {
              Navigator.pop(context);
            },
          ),
          new Divider(
            color: Colors.black,
            height: 5,
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Setting'),
            hoverColor: Colors.red,
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Set()));
            },
          ),
          new Divider(
            color: Colors.black,
            height: 5,
          ),
          ListTile(
            leading: Icon(Icons.supervisor_account),
            title: Text('About us'),
            hoverColor: Colors.red,
            onTap: () {
              Navigator.pop(context);
            },
          ),
          new Divider(
            color: Colors.black,
            height: 5,
          ),
          ListTile(
            leading: Icon(Icons.help),
            title: Text('Help'),
            hoverColor: Colors.red,
            onTap: () {
              Navigator.pop(context);
            },
          ),
          new Divider(
            color: Colors.black,
            height: 5,
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            hoverColor: Colors.red,
            onTap: () {
              //_signOut();
            },
          )
        ],
      ),
    );
  }

  /*void _signOut() {
    FirebaseAuth.instance.signOut();
    User user = FirebaseAuth.instance.currentUser;
    //print('$user');
    runApp(new MaterialApp(
      home: new LoginPage(),
    ));
  }*/
}
