import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vatapp/components/appbar.dart';
import 'package:vatapp/components/gridview.dart';
import 'package:vatapp/components/loadingpdf.dart';
import 'package:vatapp/components/mydrawer.dart';
import 'package:vatapp/components/onepdf.dart';
import 'package:vatapp/law/law1.dart';
import 'package:vatapp/constants.dart';
import 'package:vatapp/law/law11.dart';
import 'package:vatapp/law/orthoain.dart';
import 'package:vatapp/sro/sro.dart';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:http/http.dart' as http;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vatapp/tofsil/tofsil.dart';
import 'package:vatapp/tofsil/tofsil1.dart';

class Tofsil2 extends StatefulWidget {
  @override
  _Tofsil2State createState() => _Tofsil2State();
}

class _Tofsil2State extends State<Tofsil2> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        color: Colors.white10,
        child: Scaffold(
          drawer: MyDrawer(),
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.keyboard_backspace),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return Tofsil();
                }));
              },
            ),
            backgroundColor: Color(0xff056608),
            centerTitle: true,
            title: Text(
              'আইন',
              style: TextStyle(color: Colors.white),
            ),
          ),
          body: Container(
            /* decoration: BoxDecoration(
              //color: Color(0xff056608),
              image: DecorationImage(
                image: AssetImage("images/backlaw.png"),
                fit: BoxFit.cover,
              ),
            ),*/
            child: Tofsil2Body(),
          ),
        ),
      ),
    );
  }
}

class Tofsil2Body extends StatefulWidget {
  @override
  _Tofsil2BodyState createState() => _Tofsil2BodyState();
}

class _Tofsil2BodyState extends State<Tofsil2Body> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Container(
        decoration: BoxDecoration(
          //color: Color(0xff056608),
          image: DecorationImage(
            image: backgroundimage,
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Container(
              height: 60,
              margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: RaisedButton(
                elevation: 10,
                //color: Color(0xC5C5C7),
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  //side: BorderSide(color: Colors.red),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return Law11(
                      name: "তফসিল-১ (অব্যাহতিপ্রাপ্ত পণ্য)",
                      num: '১',
                      path: null,
                      gopage: 0,
                      dir: "tofsilB",
                    );
                  }));
                },
                child: Text(
                  "তফসিল-১ (অব্যাহতিপ্রাপ্ত পণ্য)",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Shobuj Nolua',
                    fontSize: 22,
                  ),
                ),
              ),
            ),
            Container(
              height: 60,
              margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: RaisedButton(
                elevation: 10,
                //color: Color(0xC5C5C7),
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  //side: BorderSide(color: Colors.red),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return Law11(
                      name: "তফসিল-২ (অব্যাহতিপ্রাপ্ত সেবাসমূহ)",
                      num: '২',
                      path: null,
                      gopage: 0,
                      dir: "tofsilB",
                    );
                  }));
                },
                child: Text(
                  "তফসিল-২ (অব্যাহতিপ্রাপ্ত সেবাসমূহ)",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Shobuj Nolua',
                    fontSize: 22,
                  ),
                ),
              ),
            ),
            Container(
              height: 60,
              margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: RaisedButton(
                elevation: 10,
                //color: Color(0xC5C5C7),
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  //side: BorderSide(color: Colors.red),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return Law11(
                      name: "তফসিল-৩ (সম্পূরক শুল্ক আরোপযোগ্য পণ্য ও সেবাসমূহ)",
                      num: '৩',
                      path: null,
                      gopage: 0,
                      dir: "tofsilB",
                    );
                  }));
                },
                child: Text(
                  "তফসিল-৩ (সম্পূরক শুল্ক আরোপযোগ্য পণ্য ও সেবাসমূহ)",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Shobuj Nolua',
                    fontSize: 22,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
