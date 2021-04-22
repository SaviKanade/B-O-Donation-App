import 'package:flutter/material.dart';
//import 'Asa.dart';
import 'dart:async';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BOP',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme: AppBarTheme(
        color: Color(0xFFF32828),
      )),
      home: SplashS(),
    );
  }
}

class SplashS extends StatefulWidget {
  @override
  _SplashSState createState() => _SplashSState();
}

class _SplashSState extends State<SplashS> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 2), () => Navigator.pushNamed(context, "/LoginPage"));
  }

  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(title: Text("BOP"), backgroundColor: Colors.red),
        backgroundColor: Colors.white,
        body: Stack(fit: StackFit.expand, children: <Widget>[
          Column(children: <Widget>[
            Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                        backgroundColor: Colors.red,
                        radius: 60,
                        child: Icon(
                          Icons.ac_unit_rounded,
                          color: Colors.black,
                        )),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                    ),
                    Text(
                      "BOP",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ))
          ]),
        ]));
  }
}
