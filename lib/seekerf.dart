import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'TC.dart';

import 'dd.dart';

class Seekerf extends StatefulWidget {
  @override
  State createState() => SeekerState();
}

class SeekerState extends State<Seekerf> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController _name = TextEditingController();
  TextEditingController _addController = TextEditingController();
  TextEditingController _displayName = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  TextEditingController _passController = TextEditingController();
  TextEditingController _confirmpassController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String locationMessage = "";
  void getCurrentLocation() async {
    final position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print(position);

    setState(() {
      locationMessage = "${position.latitude}, ${position.longitude}";
    });
  }

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);

    return Scaffold(
      appBar:
          AppBar(title: Text("DETAILS OF SEEKER"), backgroundColor: Colors.red),
      resizeToAvoidBottomPadding: false,
      body: Form(
        key: _formKey,
        child: new Stack(
          fit: StackFit.expand,
          children: <Widget>[
            new Image(
              image: AssetImage("assets/logo.jpg"),
              fit: BoxFit.fill,
              color: Colors.black12,
              colorBlendMode: BlendMode.colorBurn,
            ),
            new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Stack(
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.only(top: 40),
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.fromLTRB(20, 5, 20, 0),
                              child: TextFormField(
                                controller: _name,
                                validator: (value) {
                                  if (value.isEmpty || value.length >= 8) {
                                    return 'Enter full name!';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    labelText: 'Name -',
                                    labelStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    )),
                                keyboardType: TextInputType.name,
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              padding: EdgeInsets.fromLTRB(20, 5, 20, 0),
                              child: TextFormField(
                                controller: _addController,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Enter address!';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    labelText: 'Address -',
                                    labelStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    )),
                                keyboardType: TextInputType.multiline,
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              padding: EdgeInsets.fromLTRB(20, 5, 20, 0),
                              child: TextFormField(
                                controller: _passController,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Enter password !';
                                  }
                                  return null;
                                },
                                textInputAction: TextInputAction.next,
                                onEditingComplete: () => node.nextFocus(),
                                decoration: InputDecoration(
                                  labelText: 'Password -',
                                  labelStyle: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                obscureText: true,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(20, 5, 20, 0),
                              child: TextFormField(
                                validator: (value) {
                                  if (value.isEmpty ||
                                      !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z]+\.[a-zA-Z]+")
                                          .hasMatch(value)) {
                                    return 'Enter a valid email!';
                                  }
                                  return null;
                                },
                                controller: _emailController,
                                textInputAction: TextInputAction.next,
                                onEditingComplete: () => node.nextFocus(),
                                decoration: InputDecoration(
                                    labelText: 'EmailId -',
                                    labelStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    )),
                                keyboardType: TextInputType.emailAddress,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(20, 5, 20, 0),
                              child: TextFormField(
                                controller: _confirmpassController,
                                textInputAction: TextInputAction.next,
                                onEditingComplete: () => node.nextFocus(),
                                validator: (String val) {
                                  if (val != _passController.text)
                                    return "Invalid Password";
                                  else
                                    return null;
                                },
                                decoration: InputDecoration(
                                  labelText: 'Confirm Password -',
                                  labelStyle: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                obscureText: true,
                              ),
                            ),
                            Container(
                                padding: EdgeInsets.fromLTRB(20, 5, 20, 0),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(locationMessage),
                                      FlatButton(
                                          onPressed: () {
                                            getCurrentLocation();
                                          },
                                          color: Colors.green,
                                          child: Text("find locaion"))
                                    ])
                                /*decoration: InputDecoration(
                                          labelText: 'Search Available Donor ',
                                          labelStyle: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                          )),*/
                                //keyboardType: TextInputType.number,
                                ),
                            SizedBox(height: 30),
                            Container(
                              height: 50,
                              child: MaterialButton(
                                onPressed: () async {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Dd()));
                                },
                                color: Colors.red,
                                highlightColor: Colors.redAccent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  side: BorderSide(color: Colors.white),
                                ),
                                elevation: 8.0,
                                child: Center(
                                  child: Text(
                                    'SUBMIT',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  GlobalKey<FormState> buildFormKey() => _formKey;

  /*void _registerAccount() async {
    String name = _displayName.text;
    String email1 = _emailController.text;

    String add = _addController.text;
    print("On Register account");
    try {
      final User user = (await _auth.signInWithCredential(
              email: _emailController.text, password: _passController.text))
          .user;

      if (user != null) {
        if (!user.emailVerified) {
          await user.sendEmailVerification();
        }

        await Db().createSeekerData(
          name,
          email1,
          add,
          user.uid,
        );
        final user1 = _auth.currentUser;
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => TC(user: user1)));
      }
    } catch (e) {
      print(e.message);
    }
  }*/
}
