import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

//import 'seeker.dart';
import 'db.dart';
import 'TC.dart';

class Donorf extends StatefulWidget {
  @override
  State createState() => DonorfState();
}

class DonorfState extends State<Donorf> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _displayName = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _addController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  TextEditingController _confirmpassController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  TextEditingController _adharController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();

  String _errorpass;

  String _fileName;
  String _path;
  String _extension;
  Map<String, String> _paths;
  bool _loadingPath = false;
  bool _multiPick = false;
  bool _hasValidMime = false;
  FileType _pickingType;
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() => _extension = _controller.text);
  }

  void _openFileExplorer() async {
    if (_pickingType != FileType.custom || _hasValidMime) {
      setState(() => _loadingPath = true);
      try {
        if (_multiPick) {
          _path = null;
          _paths = await FilePicker.getMultiFilePath(
              type: _pickingType, allowedExtensions: [_extension]);
        } else {
          _paths = null;
          _path = await FilePicker.getFilePath(
              type: _pickingType, allowedExtensions: [_extension]);
        }
      } on PlatformException catch (e) {
        print("Unsupported Operation" + e.toString());
      }
      if (!mounted) return;
      setState(() {
        _loadingPath = false;
        _fileName = _path != null
            ? _path.split('/').last
            : _paths != null
                ? _paths.keys.toString()
                : '...';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);

    return Scaffold(
        key: _scaffoldkey,
        appBar: AppBar(
            title: Text("DETAILS OF DONOR"), backgroundColor: Colors.red),
        resizeToAvoidBottomPadding: false,
        body: Form(
          key: _formKey,
          child: Container(
            child: SingleChildScrollView(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                reverse: true,
                child: new Stack(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Image(
                        image: AssetImage("assets/logo.jpg"),
                        fit: BoxFit.fill,
                        color: Colors.black12,
                        colorBlendMode: BlendMode.colorBurn,
                      ),
                      Container(
                          padding: EdgeInsets.only(top: 10),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.fromLTRB(20, 5, 20, 0),
                                child: TextFormField(
                                  controller: _displayName,
                                  decoration: InputDecoration(
                                      labelText: 'Name -',
                                      labelStyle: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      )),
                                  validator: (value) {
                                    if (value.isEmpty || value.length >= 8) {
                                      return 'Enter full name!';
                                    }
                                    return null;
                                  },
                                  keyboardType: TextInputType.name,
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
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Enter address!';
                                    }
                                    return null;
                                  },
                                  controller: _addController,
                                  maxLines: 2,
                                  decoration: InputDecoration(
                                      labelText: 'Address -',
                                      labelStyle: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      )),
                                  keyboardType: TextInputType.multiline,
                                ),
                              ),

                              Container(
                                padding: EdgeInsets.fromLTRB(20, 5, 20, 0),
                                child: TextFormField(
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Enter adharcard number!';
                                    }
                                    return null;
                                  },
                                  controller: _adharController,
                                  textInputAction: TextInputAction.next,
                                  onEditingComplete: () => node.nextFocus(),
                                  decoration: InputDecoration(
                                      labelText: 'AdharCard Number -',
                                      labelStyle: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      )),
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                              // SizedBox(height: 10),
                              Container(
                                padding: EdgeInsets.fromLTRB(20, 5, 20, 0),
                                child: TextFormField(
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Enter age!';
                                    }
                                    return null;
                                  },
                                  controller: _ageController,
                                  decoration: InputDecoration(
                                      labelText: 'Age -',
                                      labelStyle: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      )),
                                  keyboardType: TextInputType.number,
                                ),
                              ),
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
                                    errorText: _errorpass,
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
                                child: Row(
                                  children: [
                                    Text(
                                      'Health History -',
                                      semanticsLabel: "Upload Image",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                    Container(
                                      child: Row(
                                        children: [
                                          Container(
                                            child: IconButton(
                                              icon: Icon(
                                                  Icons.add_a_photo_outlined),
                                              onPressed: () =>
                                                  _openFileExplorer(),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              SizedBox(height: 30),
                              Container(
                                height: 50,
                                child: MaterialButton(
                                  onPressed: () async {
                                    if (true) {
                                      _registerAccount();
                                    }
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
                                      'DONATE',
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
                    ])),
          ),
        ));
  }

  GlobalKey<FormState> buildFormKey() => _formKey;

  void _registerAccount() async {
    String name = _displayName.text;
    String email1 = _emailController.text;
    String adhar = _adharController.text;
    String age = _ageController.text;
    String add = _addController.text;
    print("On Register account");
    try {
      final User user = (await _auth.createUserWithEmailAndPassword(
              email: _emailController.text, password: _passController.text))
          .user;

      if (user != null) {
        if (!user.emailVerified) {
          await user.sendEmailVerification();
        }

        await Db().createDonorData(
          name,
          email1,
          add,
          age,
          adhar,
          user.uid,
        );
        final user1 = _auth.currentUser;
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => TC(user: user1)));
      }
    } catch (e) {
      print(e.message);
    }
  }
}
