import 'package:flutter/material.dart';

class TrackD extends StatefulWidget {
  @override
  _TrackDState createState() => _TrackDState();
}

class _TrackDState extends State<TrackD> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('BOP'),
        backgroundColor: Colors.red,
      ),
      body: Column(children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 50),
          height: 80,
          child: MaterialButton(
            onPressed: () {},
            color: Colors.red,
            highlightColor: Colors.redAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(color: Colors.white),
            ),
            elevation: 8.0,
            child: Center(
              child: Text(
                'TRACK DONOR',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
