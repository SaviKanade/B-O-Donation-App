import 'package:flutter/material.dart';

class BBFul extends StatefulWidget {
  @override
  State createState() => BBState();
}

class BBState extends State<BBFul> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("DETAILS OF HOSPITALS/BB"),
            backgroundColor: Colors.red),
        resizeToAvoidBottomPadding: false,
        body: Form(
          key: _formKey,
          child: new Stack(fit: StackFit.expand, children: <Widget>[
            new Image(
              image: AssetImage("assets/logo.jpg"),
              fit: BoxFit.fill,
              color: Colors.black12,
              colorBlendMode: BlendMode.colorBurn,
            ),
            new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Stack(children: <Widget>[
                  Container(
                      padding: EdgeInsets.only(top: 40),
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.fromLTRB(20, 5, 20, 0),
                            child: TextFormField(
                              validator: (val) {
                                if (val.isEmpty)
                                  return ("Enter Name");
                                else
                                  return null;
                              },
                              decoration: InputDecoration(
                                  labelText: 'Name of Hospital/Blood Bank -',
                                  labelStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  )),
                              keyboardType: TextInputType.name,
                            ),
                          ),
                          SizedBox(height: 20),
                          Container(
                            padding: EdgeInsets.fromLTRB(20, 5, 20, 0),
                            child: TextFormField(
                              validator: (val) {
                                if (val.isEmpty)
                                  return ("Inavlid Address");
                                else
                                  return null;
                              },
                              decoration: InputDecoration(
                                  labelText: 'Address of Hospital/Blood Bank -',
                                  labelStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  )),
                              keyboardType: TextInputType.multiline,
                            ),
                          ),
                          SizedBox(height: 20),
                          Container(
                            padding: EdgeInsets.fromLTRB(20, 5, 20, 0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                  labelText: 'Certificate -',
                                  labelStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  )),
                              keyboardType: TextInputType.multiline,
                            ),
                          ),
                          SizedBox(height: 20),
                          Container(
                            padding: EdgeInsets.fromLTRB(20, 5, 20, 0),
                            child: TextFormField(
                              validator: (val) {
                                if (val.isEmpty || val.length < 10)
                                  return ("Inavlid License Number");
                                else
                                  return null;
                              },
                              decoration: InputDecoration(
                                  labelText: 'License Number -',
                                  labelStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  )),
                              keyboardType: TextInputType.number,
                            ),
                          ),
                          SizedBox(height: 30),
                          Container(
                            height: 50,
                            child: MaterialButton(
                              onPressed: () {
                                setState(() {
                                  if (_formKey.currentState.validate()) {
                                    Scaffold.of(context).showSnackBar(SnackBar(
                                        content: Text("Failed to SIgnUP")));
                                  } else {
                                    // _registerAccount();
                                  }
                                });
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
                ])
              ],
            ),
          ]),
        ));
  }
}
