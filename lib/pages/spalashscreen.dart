import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vatapp/pages/homepage.dart';
import 'package:vatapp/sequrity.dart';

class SplashScreen1 extends StatefulWidget {
  @override
  _SplashScreen1State createState() => _SplashScreen1State();
}

class _SplashScreen1State extends State<SplashScreen1> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseAuth.instance.onAuthStateChanged.listen((user) {
      //print(user);
      if (user != null) {
        Timer(
            Duration(seconds: 10),
            () => Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return HomePage();
                })));
      } else {
        Timer(
            Duration(seconds: 10),
            () => Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return MySecurity();
                })));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              child: Image.asset(
                'images/fspalashbackground.jpg',
                //'images/s4.jpg',
                fit: BoxFit.fill,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: Container(
                    //  margin: EdgeInsets.only(top: 25),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: 190.0,
                          alignment: Alignment.bottomLeft,
                          padding: new EdgeInsets.only(
                            bottom: 0,
                          ),
                          decoration: new BoxDecoration(
                            image: new DecorationImage(
                              image: new AssetImage(
                                  'images/finalwelcomepagelogo.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          /*child: Container(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              "ভ্যাট আইন এখন হাতের মুঠোয়",
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 30.0,
                                fontFamily: 'Shobuj Nolua',
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),*/
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          child: CircleAvatar(
                              minRadius: 2,
                              maxRadius: 60,
                              backgroundColor: Colors.white,
                              // radius: 60.0,
                              child: Container(
                                decoration: new BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 5.0,
                                          offset: Offset(
                                            5.0,
                                            5.0,
                                          ),
                                          spreadRadius: 5.0)
                                    ],
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                    image: new DecorationImage(
                                        fit: BoxFit.fill,
                                        image:
                                            new AssetImage("images/vai.jpg"))),
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 100,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          "কারিগরি সহযোগিতায়",
                          softWrap: true,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18.0, color: Colors.black),
                        ),
                        Container(
                          height: 20,
                          width: 100,
                          child: Image.asset('images/mylogo.png'),
                        ),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
