import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:vatapp/drawerpages/login.dart';
import 'package:vatapp/drawerpages/registration.dart';
import 'package:vatapp/pages/homepage.dart';
import '../constants.dart';
import 'search.dart';
import 'package:connectivity/connectivity.dart';

import 'package:firebase_auth/firebase_auth.dart';

class MyCustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final double height;
  final bool logging;

  const MyCustomAppBar({Key key, this.height, this.logging}) : super(key: key);
  @override
  _MyCustomAppBarState createState() => _MyCustomAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(height);
}

class _MyCustomAppBarState extends State<MyCustomAppBar> {
  Map _source = {ConnectivityResult.none: false};
  MyConnectivity _connectivity = MyConnectivity.instance;

  String loginStatus;
  String requestMassage;
  bool isloggedIn = false;

  doLogout() async {
    FirebaseAuth.instance.signOut();
    final GoogleSignIn googleSignIn = new GoogleSignIn();
    if (await googleSignIn.isSignedIn()) {
      googleSignIn.signOut();
    }
  }

  Future<void> showMyDialog() {
    print("home0000000000");
    print(loginStatus);
    print(requestMassage);
    return showDialog(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          title: Text(
            'WelCome',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                fontFamily: 'Galada'),
          ),
          content: SingleChildScrollView(
            child: (isloggedIn)
                ? ListBody(
                    children: <Widget>[
                      Container(
                        height: 160,
                        margin: EdgeInsets.all(0),
                        padding: EdgeInsets.all(0),
                        child: Image.asset('images/logo2.png'),
                      ),
                      Text(
                        '$loginStatus',
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        '$requestMassage',
                        textAlign: TextAlign.center,
                      ),
                    ],
                  )
                : ListBody(
                    children: <Widget>[
                      Container(
                        //height: 160,
                        margin: EdgeInsets.all(0),
                        padding: EdgeInsets.all(0),
                        child: Image.asset('images/dialog.jpg'),
                        // child: Image.asset('images/logo2.png'),
                      ),
                      /*Text(
                  '$loginStatus',
                  textAlign: TextAlign.center,
                ),
                Text(
                  '$requestMassage',
                  textAlign: TextAlign.center,
                ),*/
                    ],
                  ),
          ),
          actions: <Widget>[
            (isloggedIn)
                ? FlatButton(
                    child: Text('Log Out'),
                    onPressed: () {
                      doLogout();
                      Fluttertoast.showToast(
                          msg: "LogOut Successfull",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          backgroundColor: Colors.blueAccent,
                          textColor: Colors.white,
                          fontSize: 16.0);
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                          (route) => false);
                      // Navigator.pop(context);
                    },
                  )
                : FlatButton(
                    child: Text('Login/Registration'),
                    onPressed: () {
                      print("in the login/reg tap");
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Login()));
                    },
                  ),
            FlatButton(
              child: (isloggedIn) ? Text('OK') : Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  checkUser() async {
    if (await FirebaseAuth.instance.currentUser() == null) {
      showMyDialog();
    }
  }

  @override
  void initState() {
    print("app bar init state");
    // TODO: implement initState
    FirebaseAuth.instance.onAuthStateChanged.listen((user) {
      //print(user);
      if (user != null) {
        if (mounted) {
          setState(() {
            loginStatus = "Congratulations";
            requestMassage = "You have already logged in";
            isloggedIn = true;
          });
        }

        print("user already logged in");
      } else {
        if (mounted) {
          setState(() {
            loginStatus = "You are not loggedIn";
            requestMassage = "Would you like to login/registration ?";
            isloggedIn = false;
          });
        }

        print("CALLED S a d");

        print("not logged in");
      }
    });
    checkUser();

    super.initState();

    _connectivity.initialise();

    _connectivity.myStream.listen((source) {
      if (mounted) {
        setState(() => _source = source);
      }
    });

    //netC();
  }

  @override
  Widget build(BuildContext context) {
    print("appbar build");
    return Container(
      padding: EdgeInsets.all(5),
      color: Color(0xff056608),
      child: Card(
        elevation: 5,
        color: Color(0xff056608),
        margin: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    // color: Colors.black,
                    child: IconButton(
                      padding: EdgeInsets.all(0),
                      icon: Icon(
                        Icons.menu,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 40,
                      margin: EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      //color: Color(0xff056608),

                      child: MySearch(),
                    ),
                  ),
                  Container(
                    // color: Colors.black,
                    child: IconButton(
                      padding: EdgeInsets.all(0),
                      icon: Icon(
                        Icons.account_circle,
                        color: (isloggedIn) ? Colors.black : Colors.red,
                        //size: 10,
                      ),
                      onPressed: () {
                        showMyDialog();
                      },
                    ),
                  ),
                ],
              ),
            ),
            (_source.keys.toList()[0] != ConnectivityResult.none)
                ? Container()
                : Container(
                    child: Text(
                      "No Internet Connection",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

/*TextField(
                cursorColor: Colors.black,
                enableSuggestions: true,
                decoration: InputDecoration(
                  hintText: "Search",
                  contentPadding: EdgeInsets.all(10),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),*/
