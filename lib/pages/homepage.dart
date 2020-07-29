import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:vatapp/components/appbar.dart';
import 'package:vatapp/components/gridview.dart';
import 'package:vatapp/components/mydrawer.dart';
import 'package:vatapp/components/search.dart';
import 'package:vatapp/drawerpages/login.dart';
import 'package:vatapp/law/law11.dart';

import '../constants.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:vatapp/bisoyvittik/bisoyvittik.dart';

import 'package:fluttertoast/fluttertoast.dart';

import 'package:firebase_storage/firebase_storage.dart';

import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:vatapp/constants.dart';

import 'package:flutter_windowmanager/flutter_windowmanager.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void buildSearchList() async {
    ///law
    for (int i = 0; i < lawList.length; i++) {
      var temp = new MySearchItem();
      temp.title = lawList[i].title.toString();
      temp.num = lawList[i].no.toString();
      temp.dir = 'law';
      temp.type = 'আইন';
      searchList.add(temp);
    }

    ///bd
    for (int i = 0; i < bdList.length; i++) {
      var temp = new MySearchItem();
      temp.title = bdList[i].title.toString();
      temp.num = bdList[i].no.toString();
      temp.dir = 'rule';
      temp.type = 'বিধিমালা';
      searchList.add(temp);
    }

    ///
    List<DocumentSnapshot> documentList;
    List<DocumentSnapshot> documentList1;
    List<DocumentSnapshot> documentList2;
    List<DocumentSnapshot> documentList3;
    List<DocumentSnapshot> documentList4;
    List<DocumentSnapshot> documentList5;
    List<DocumentSnapshot> documentList6;
    List<DocumentSnapshot> documentList7;

    ///form
    List<DocumentSnapshot> documentList8;
    List<DocumentSnapshot> documentList9;

    documentList = (await Firestore.instance
            .collection("sro")
            .orderBy('no', descending: false)
            .getDocuments())
        .documents;
    documentList1 = (await Firestore.instance
            .collection("gades")
            .orderBy('no', descending: false)
            .getDocuments())
        .documents;
    documentList2 = (await Firestore.instance
            .collection("sades")
            .orderBy('no', descending: false)
            .getDocuments())
        .documents;
    documentList3 = (await Firestore.instance
            .collection("babostapotro")
            .orderBy('no', descending: false)
            .getDocuments())
        .documents;
    documentList4 = (await Firestore.instance
            .collection("babostapotro")
            .orderBy('no', descending: false)
            .getDocuments())
        .documents;
    documentList5 = (await Firestore.instance
            .collection("abogari")
            .orderBy('no', descending: false)
            .getDocuments())
        .documents;
    documentList6 = (await Firestore.instance
            .collection("tariff")
            .orderBy('no', descending: false)
            .getDocuments())
        .documents;
    documentList7 = (await Firestore.instance
            .collection("bibidho")
            .orderBy('no', descending: false)
            .getDocuments())
        .documents;

    ///form
    documentList8 = (await Firestore.instance
            .collection("form")
            .orderBy('no', descending: false)
            .getDocuments())
        .documents;
    documentList9 = (await Firestore.instance
            .collection("form2")
            .orderBy('no', descending: false)
            .getDocuments())
        .documents;
    for (int i = 0; i < documentList.length; i++) {
      var temp = new MySearchItem();
      temp.title = documentList[i]['title'].toString();
      temp.description = documentList[i]['description'].toString();
      temp.date = documentList[i]['date'].toString();
      temp.num = documentList[i]['no'].toString();
      temp.dir = 'sro';
      temp.type = 'sro';

      searchList.add(temp);
    }
    for (int i = 0; i < documentList1.length; i++) {
      var temp = new MySearchItem();
      temp.title = documentList1[i]['title'].toString();
      temp.description = documentList1[i]['description'].toString();
      temp.date = documentList1[i]['date'].toString();
      temp.num = documentList1[i]['no'].toString();
      temp.dir = 'gades';
      temp.type = 'sro';

      searchList.add(temp);
    }

    ///sades
    for (int i = 0; i < documentList2.length; i++) {
      var temp = new MySearchItem();
      temp.title = documentList2[i]['title'].toString();
      temp.description = documentList2[i]['description'].toString();
      temp.date = documentList2[i]['date'].toString();
      temp.num = documentList2[i]['no'].toString();
      temp.dir = 'sades';
      temp.type = 'sro';

      searchList.add(temp);
    }
    for (int i = 0; i < documentList3.length; i++) {
      var temp = new MySearchItem();
      temp.title = documentList3[i]['title'].toString();
      temp.description = documentList3[i]['description'].toString();
      temp.date = documentList3[i]['date'].toString();
      temp.num = documentList3[i]['no'].toString();
      temp.dir = 'babostapotro';
      temp.type = 'sro';

      searchList.add(temp);
    }

    ///sarcharge
    for (int i = 0; i < documentList4.length; i++) {
      var temp = new MySearchItem();
      temp.title = documentList4[i]['title'].toString();
      temp.description = documentList4[i]['description'].toString();
      temp.date = documentList4[i]['date'].toString();
      temp.num = documentList4[i]['no'].toString();
      temp.dir = 'sarcharge';
      temp.type = 'sro';

      searchList.add(temp);
    }

    ///abogari
    for (int i = 0; i < documentList5.length; i++) {
      var temp = new MySearchItem();
      temp.title = documentList5[i]['title'].toString();
      temp.description = documentList5[i]['description'].toString();
      temp.date = documentList5[i]['date'].toString();
      temp.num = documentList5[i]['no'].toString();
      temp.dir = 'abogari';
      temp.type = 'sro';
      searchList.add(temp);
    }

    ///tariff
    for (int i = 0; i < documentList6.length; i++) {
      var temp = new MySearchItem();
      temp.title = documentList6[i]['title'].toString();
      temp.description = documentList6[i]['description'].toString();
      temp.date = documentList6[i]['date'].toString();
      temp.num = documentList6[i]['no'].toString();
      temp.dir = 'tariff';
      temp.type = 'sro';
      searchList.add(temp);
    }

    ///bibidho
    for (int i = 0; i < documentList7.length; i++) {
      var temp = new MySearchItem();
      temp.title = documentList7[i]['title'].toString();
      temp.description = documentList7[i]['description'].toString();
      temp.date = documentList7[i]['date'].toString();
      temp.num = documentList7[i]['no'].toString();
      temp.dir = 'bibidho';
      temp.type = 'sro';
      searchList.add(temp);
    }

    ///form
    for (int i = 0; i < documentList8.length; i++) {
      //print("form type");
      // print(documentList8[i]['title'].toString());
      var temp = new MySearchItem();
      temp.title = documentList8[i]['title'].toString();
      temp.num = documentList8[i]['no'].toString();
      temp.dir = 'form';
      temp.type = 'form';
      searchList.add(temp);
    }

    ///form2
    for (int i = 0; i < documentList9.length; i++) {
      //print("form type");
      // print(documentList9[i]['title'].toString());
      var temp = new MySearchItem();
      temp.title = documentList9[i]['title'].toString();
      temp.num = documentList9[i]['no'].toString();
      temp.dir = 'form2';
      temp.type = 'form';
      searchList.add(temp);
    }
  }

  Directory directory;

  File file, file1;

  doPdfSettings() async {
    directory = await getExternalStorageDirectory();
    file = File("${directory.path}/pdfsetings1.txt");
    file1 = File("${directory.path}/pdfsetings2.txt");
    if (await file.exists()) {
      String contents = await file.readAsString();

      if (mounted) {
        setState(() {
          if (contents == 'true') {
            pdf_nightmnnode = true;
          } else {
            pdf_nightmnnode = false;
          }
        });
      }

      print("contents");
      print(contents);
    }
    if (await file1.exists()) {
      String contents = await file1.readAsString();
      print(contents);

      if (mounted) {
        setState(() {
          if (contents == 'true') {
            pdf_pagemode = true;
          } else {
            pdf_pagemode = false;
          }
        });
      }
    }
    print("pdf modes read s");
    print(pdf_pagemode);
    print(pdf_nightmnnode);
  }

  screenOff() async {
    await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("home page init state");

    FirebaseAuth.instance.onAuthStateChanged.listen((user) {
      //print(user);
      if (user != null) {
        buildSearchList();
      }
    });
    doPdfSettings();
    screenOff();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  Future<bool> _onWillPop() {
    return showDialog(
          context: context,
          builder: (context) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              side: BorderSide(color: Colors.green),
            ),
            title: Text('Are you sure?'),
            content: RichText(
              text: TextSpan(
                style: TextStyle(
                  color: Colors.black,
                ),
                text: 'Do you want to exit ',
                children: <TextSpan>[
                  TextSpan(
                      text: 'VAT Guide',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red)),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text('No'),
              ),
              FlatButton(
                onPressed: () => exit(0),
                /*Navigator.of(context).pop(true)*/
                child: Text('Yes'),
              ),
            ],
          ),
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    print("home build");
    return MaterialApp(
      home: SafeArea(
        child: WillPopScope(
          onWillPop: _onWillPop,
          child: Scaffold(
            drawer: MyDrawer(),
            appBar: MyCustomAppBar(
              height: 76,
            ),
            body: ListView(
              children: <Widget>[
                MyGridView(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
