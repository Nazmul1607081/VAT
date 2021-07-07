import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_info/device_info.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vatapp/pages/homepage.dart';
import 'package:vatapp/sequrity.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:vatapp/keyCheck.dart';

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
            Duration(seconds: 8),
            () => Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return HomePage();
                })));
      } else {
        Timer(
            Duration(seconds: 8),
            () => Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return MySecurity();
                })));
      }
    });
    /*Future.delayed(Duration(seconds: 2)).then((value) {
      _getId().then((deviceID) async {
        print(deviceID);
        try {
          FirebaseDatabase database = FirebaseDatabase();
          database.setPersistenceEnabled(true);
          //database.setPersistenceCacheSizeBytes(10000000);

          database
              .reference()
              .child('devices')
              .child(deviceID)
              .once()
              .then((value) {
            final data = value.value;
            print(data);
            if (data != null) {
              Timer(
                  Duration(seconds: 3),
                  () => Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return HomePage();
                      })));
            } else {
              Timer(
                  Duration(seconds: 3),
                  () => Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return MyKey();
                      })));
            }
          });
        } on Exception catch (e) {
          print(e);
          Timer(
              Duration(seconds: 3),
              () => Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return MyKey();
                  })));
        }
      });
    });*/
  }

  Future<String> _getId() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Theme.of(context).platform == TargetPlatform.iOS) {
      IosDeviceInfo iosDeviceInfo = await deviceInfo.iosInfo;
      return iosDeviceInfo.identifierForVendor; // unique ID on iOS
    } else if (Theme.of(context).platform == TargetPlatform.android) {
      AndroidDeviceInfo androidDeviceInfo = await deviceInfo.androidInfo;
      return androidDeviceInfo.androidId; // unique ID on Android
    } else {
      return "";
    }
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
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Container(
                    height: 190.0,
                    alignment: Alignment.bottomLeft,
                    padding: new EdgeInsets.only(
                      bottom: 0,
                    ),
                    decoration: new BoxDecoration(
                      image: new DecorationImage(
                        image:
                            new AssetImage('images/finalwelcomepagelogo.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
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
                                image: new AssetImage("images/vai.jpg"))),
                      )),
                ),
              ],
            ),
            Column(
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
            )
          ],
        ),
      ),
    );
  }
}
