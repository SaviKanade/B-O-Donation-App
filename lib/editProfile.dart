import 'package:flutter/material.dart';

class Editp extends StatefulWidget {
  @override
  _EditpState createState() => _EditpState();
}

class _EditpState extends State<Editp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: "Email-Id",
                suffixIcon: IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {},
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "Phone Number",
                suffixIcon: IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {},
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
