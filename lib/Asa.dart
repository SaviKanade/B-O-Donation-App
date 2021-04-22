import 'package:BOD/appD.dart';
import 'package:flutter/material.dart';
import 'donorf.dart';
import 'seekerf.dart';
import 'BB&H.dart';

class Asa extends StatefulWidget {
  State createState() => new _LoginasState();
}

class _LoginasState extends State<Asa> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('Register'),
        backgroundColor: Colors.red,
      ),
      drawer: ADrawer(),
      body: Center(
          child: Column(
        children: <Widget>[
          SizedBox(
            height: 70,
          ),
          Container(
            height: 80,
            width: 200,
            padding: EdgeInsets.all(10),
            child: RaisedButton(
              onPressed: () {
                _push(context, Donorf());
              },
              child: Text(
                "As a Donor",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              color: Colors.red,
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            height: 80,
            width: 200,
            padding: EdgeInsets.all(10),
            child: RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Seekerf()),
                );
              },
              child: Text(
                "As a Seeker",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              color: Colors.red,
              highlightColor: Colors.white,
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            height: 80,
            width: 200,
            padding: EdgeInsets.all(10),
            child: RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BBFul()),
                );
              },
              child: Text(
                "As Hospital/Blood Bank",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              color: Colors.red,
              highlightColor: Colors.white,
            ),
          )
        ],
      )),
    );
  }

  void _push(BuildContext context, Widget page) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return page;
    }));
  }
}
