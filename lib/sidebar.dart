import 'package:flutter/material.dart';

class Sidebar extends StatefulWidget {
  @override
  SBState createState() => new SBState();
}

class SBState extends State<Sidebar> {
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: Text('BOP'),
        ),
        drawer: new Drawer(
            child: ListView(children: <Widget>[
          new UserAccountsDrawerHeader(
            accountName: new Text('user'),
            accountEmail: new Text('default@gmail.com'),
            currentAccountPicture: new CircleAvatar(
              backgroundImage: new NetworkImage('http://i.pravatar.cc/300'),
            ),
          ),
          new ListTile(
            title: new Text('abc'),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          new Divider(
            color: Colors.black,
            height: 5.0,
          ),
          new ListTile(
            title: new Text('abc'),
            onTap: () {
              Navigator.of(context).pop();
            },
          )
        ])),
        body: Center(
            child: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: () {},
              padding: EdgeInsets.all(10),
              color: Colors.black45,
              child: Text('Donate'),
              highlightColor: Colors.white,
            ),
            RaisedButton(
              onPressed: () {},
              padding: EdgeInsets.all(10),
              color: Colors.black45,
              child: Text('Request'),
              highlightColor: Colors.white,
            )
          ],
        )));
  }
}
