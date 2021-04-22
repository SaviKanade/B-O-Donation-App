import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'appD.dart';

class SearchH extends StatefulWidget {
  final User user;
  const SearchH({Key key, this.user}) : super(key: key);

  State createState() => new SearchHState();
}

class SearchHState extends State<SearchH> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('BOP'),
        backgroundColor: Colors.red,
      ),
      drawer: ADrawer(),
      body: Column(
        children: <Widget>[
          Center(
            child: Text(
              "Donate Blood",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            child: TextField(
              decoration: InputDecoration(
                labelText: "Search for BB/Hospital",
                border: OutlineInputBorder(
                  borderSide: new BorderSide(color: Colors.red),
                ),
                prefixIcon: Icon(Icons.location_pin),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
