import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'Asa.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'SearchH.dart';

class LoginPage extends StatefulWidget {
  State createState() => new LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  bool _secureText = true;
  String _email;
  FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);
    return Scaffold(
      body: Form(
          key: formkey,
          child: new Stack(fit: StackFit.expand, children: <Widget>[
            new Image(
              image: AssetImage("assets/logo.jpg"),
              fit: BoxFit.fill,
              color: Colors.black12,
              colorBlendMode: BlendMode.colorBurn,
            ),
            Container(
                padding: EdgeInsets.only(top: 70),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 5, 20, 0),
                      child: TextFormField(
                        controller: _emailController,
                        textInputAction: TextInputAction.next,
                        onEditingComplete: () => node.nextFocus(),
                        validator: (value) {
                          if (value.isEmpty ||
                              !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(value)) {
                            return 'Enter a valid email!';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            labelText: 'EmailId -',
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            )),
                        keyboardType: TextInputType.emailAddress,
                        onSaved: (String val) => setState(() => _email = val),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: TextFormField(
                        controller: _passController,
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (_) => node.unfocus(),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Enter a valid password!';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Password -',
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(_secureText
                                ? Icons.remove_red_eye
                                : Icons.security),
                            onPressed: () {
                              setState(() {
                                _secureText = !_secureText;
                              });
                            },
                          ),
                        ),
                        obscureText: _secureText,
                        keyboardAppearance: Brightness.light,
                      ),
                    ),
                    SizedBox(height: 40),
                    Container(
                      height: 50,
                      child: MaterialButton(
                        onPressed: () async {
                          signInWithEmailAndPassword();
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
                            'LOGIN',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      height: 50,
                      child: SignInButton(
                        Buttons.Google,
                        onPressed: () async {
                          signInWithEmailAndPassword();
                        },
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Asa()),
                            );
                          },
                          child: Text(
                            'New Registration',
                            style: TextStyle(
                              color: Colors.redAccent,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                              textBaseline: TextBaseline.alphabetic,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                )),
          ])),
    );
  }

  void signInWithEmailAndPassword() async {
    try {
      final User user = (await _auth.signInWithEmailAndPassword(
              email: _emailController.text, password: _passController.text))
          .user;
      if (!user.emailVerified) {
        await user.sendEmailVerification();
      }
      Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => SearchH(
                user: user,
              )));
    } catch (e) {
      if (formkey.currentState.validate()) {
        Scaffold.of(context)
            .showSnackBar(SnackBar(content: Text("Failed To SignIn")));
      }

      print(e);
    }
  }
}
