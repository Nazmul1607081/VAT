import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:string_validator/string_validator.dart';
import 'package:vatapp/components/appbar.dart';
import 'package:vatapp/components/gridview.dart';
import 'package:vatapp/components/mydrawer.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:open_file/open_file.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:dio/dio.dart';

import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:vatapp/components/phoneauth.dart';
import 'package:vatapp/drawerpages/registration.dart';
import 'package:vatapp/pages/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:connectivity/connectivity.dart';
import '../constants.dart';
import 'forgotpasswword.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isLoggedin = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseAuth.instance.onAuthStateChanged.listen((user) {
      print(user);
      if (user != null) {
        setState(() {
          print("login 1 to home");
          isLoggedin = true;
        });
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
            (route) => false);
        print("user already logged in");
      } else {
        setState(() {
          isLoggedin = false;
        });
        print("not logged in");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.keyboard_backspace),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Color(0xff056608),
        title: Text('লগইন'),
        actions: <Widget>[
          /*IconButton(
              icon: Icon(
                Icons.not_interested,
                color: (isLoggedin) ? Colors.black : Colors.red,
              ),
              onPressed: () async {
                if (isLoggedin) {
                  await FirebaseAuth.instance.signOut();
                  Fluttertoast.showToast(
                      msg: "LogOut Successfull",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      backgroundColor: Colors.blueAccent,
                      textColor: Colors.white,
                      fontSize: 16.0);
                  setState(() {
                    isLoggedin = false;
                  });

                  print("user already logged in");
                } else {
                  Fluttertoast.showToast(
                      msg: "You are not logged in. Login first.",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      backgroundColor: Colors.blueAccent,
                      textColor: Colors.white,
                      fontSize: 16.0);
                  print("not logged in");
                }
              },
            )*/
        ],
      ),
      body: LoginBody(),
    );
  }
}

class LoginBody extends StatefulWidget {
  @override
  _LoginBodyState createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final _auth = FirebaseAuth.instance;
  bool wrong1 = false;
  bool wrong2 = false;
  bool showProgress = false;
  String email = '', password = '';
  bool isLoggedin;
  Future<String> signInWithGoogle() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final GoogleSignIn googleSignIn = GoogleSignIn();
    try {
      final GoogleSignInAccount googleSignInAccount =
          await googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      final AuthResult authResult =
          await _auth.signInWithCredential(credential);
      final FirebaseUser user = authResult.user;

      assert(!user.isAnonymous);
      assert(await user.getIdToken() != null);

      final FirebaseUser currentUser = await _auth.currentUser();
      assert(user.uid == currentUser.uid);
      print("google auth");
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
          (route) => false);
    } catch (err) {
      print(err);
      Scaffold.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.red,
        content: Text(
          "$err",
          style: TextStyle(color: Colors.white),
        ),
      ));
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        //color: Color(0xff056608),

        image: DecorationImage(
          image: backgroundimage,
          //image: AssetImage("images/pdfback.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: ModalProgressHUD(
        inAsyncCall: showProgress,
        child: ListView(
          shrinkWrap: true,
          physics: ScrollPhysics(),
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 120,
                    child: Image.asset(
                      'images/logo2.png',
                    ),
                  ),
                  TextField(
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    keyboardType: TextInputType.emailAddress,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      email = value;
                    },
                    decoration: InputDecoration(
                      hintText: "Enter your Email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(32.0),
                        ),
                        borderSide: BorderSide(
                            color: (wrong1) ? Colors.green : Colors.red,
                            width: 5),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextField(
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    obscureText: true,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      password = value;
                    },
                    decoration: InputDecoration(
                      hintText: "Enter your Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(32.0),
                        ),
                        borderSide: BorderSide(
                            color: (wrong2) ? Colors.green : Colors.red,
                            width: 5),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Material(
                    elevation: 5,
                    color: Colors.lightBlue,
                    borderRadius: BorderRadius.circular(32.0),
                    child: MaterialButton(
                      onPressed: () async {
                        if (!isEmail(email)) {
                          setState(() {
                            wrong1 = false;
                          });
                          Scaffold.of(context).showSnackBar(SnackBar(
                            backgroundColor: Colors.red,
                            content: Text(
                              "Enter a valid email",
                              style: TextStyle(color: Colors.white),
                            ),
                          ));
                        }
                        if (password.length < 1) {
                          setState(() {
                            wrong2 = false;
                          });
                          Scaffold.of(context).showSnackBar(SnackBar(
                            backgroundColor: Colors.red,
                            content: Text(
                              "Password empty",
                              style: TextStyle(color: Colors.white),
                            ),
                          ));
                        } else {
                          setState(() {
                            showProgress = true;
                          });
                          try {
                            final newUser =
                                await _auth.signInWithEmailAndPassword(
                                    email: email, password: password);
                            print(newUser.toString() + " uysereeeeeeee");
                            if (newUser != null) {
                              Fluttertoast.showToast(
                                  msg: "Login Successful",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  backgroundColor: Colors.blueAccent,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                              setState(() {
                                showProgress = false;
                              });
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()),
                                  (route) => false);
                            } else {
                              print("else");
                              setState(() {
                                showProgress = false;
                              });
                              Scaffold.of(context).showSnackBar(SnackBar(
                                backgroundColor: Colors.red,
                                content: Text(
                                  "Login Failed. Try again",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ));
                            }
                          } catch (e) {
                            print("error :" + e.runtimeType.toString());
                            setState(() {
                              showProgress = false;
                            });
                            Scaffold.of(context).showSnackBar(SnackBar(
                              backgroundColor: Colors.red,
                              content: Text(
                                "Login Failed. Try again. \n ${e}",
                                style: TextStyle(color: Colors.white),
                              ),
                            ));
                          }
                        }

                        //////////////////////////////////////////
                      },
                      minWidth: 200.0,
                      height: 30.0,
                      child: Text(
                        "Login",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 20.0),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Material(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    elevation: 5,
                    child: InkWell(
                      onTap: () {
                        print("googletapped");

                        signInWithGoogle();
                      },
                      child: Container(
                        padding: EdgeInsets.all(5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              height: 30,
                              child: Image.asset("images/google_logo.png"),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Sign In with Google.",
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Material(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    elevation: 5,
                    child: InkWell(
                      onTap: () {
                        print("phone auth");

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                      },
                      child: Container(
                        padding: EdgeInsets.all(5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              height: 30,
                              child: Image.asset("images/phone_icon.png"),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text("Sign In with Phone Number.")
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Material(
                      color: Color(0xff056608),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      elevation: 5,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => MyReg()));
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            "Create new account",
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Material(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      elevation: 5,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ForgotPassword()));
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            "Forget/Reset Password",
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*void getData() {
  print("get data called");
  databaseReference
      .collection("update")
      .getDocuments()
      .then((QuerySnapshot snapshot) {
    snapshot.documents.forEach((f) {
      print('${f.data}}');
      print(f.data['title']);
    });
  });
}*/

/*void saveData() async {
    DocumentReference ref = await databaseReference.collection("sms").add({
      'sender': 'nazmul81csekuet@gmail.com',
      'description': "$sms",
      'time': DateTime.now()
    });
    print(ref.documentID);
    print("upload finished");

    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text("Sent Successful"),
    ));



    StreamBuilder<QuerySnapshot>(
          stream: Firestore.instance.collection('update').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return new Text('Loading...');
              default:
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data.documents.length *
                        2, //snapshot.data.documents.length,
                    physics: ScrollPhysics(),
                    itemBuilder: (context, index) {
                      DocumentSnapshot document = snapshot.data.documents[i];
                      if (index % 2 == 0) {
                        i++;
                        i = (i % 2);

                        return CustomUpdate(
                          title: document['title'],
                          description: document['description'],
                        );
                      } else {
                        return Container(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: AdMob(),
                        );
                      }
                    });
            }
          },
        )


        */
