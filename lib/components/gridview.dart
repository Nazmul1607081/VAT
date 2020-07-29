import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vatapp/ades/ades.dart';
import 'package:vatapp/bisoyvittik/bisoyvittik.dart';
import 'package:vatapp/components/webview.dart';
import 'package:vatapp/form/form.dart';
import 'package:vatapp/menuitem/calculator.dart';
import 'package:vatapp/menuitem/importantlink.dart';
import 'package:vatapp/menuitem/law.dart';
import 'package:vatapp/menuitem/question.dart';
import 'package:vatapp/rule/rule.dart';
import 'package:vatapp/sro/sro.dart';
import 'package:vatapp/tofsil/tofsil.dart';

class MyGridView extends StatefulWidget {
  final grid;

  const MyGridView({Key key, this.grid}) : super(key: key);
  @override
  _MyGridViewState createState() => _MyGridViewState();
}

class _MyGridViewState extends State<MyGridView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff056608),
      alignment: Alignment.topCenter,
      child: GridView.count(
        primary: true,
        shrinkWrap: true,
        padding: EdgeInsets.only(top: 0),
        crossAxisCount: 2,
        physics: ScrollPhysics(),
        children: <Widget>[
          ///1 law
          Center(
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return MyLaw();
                }));
              },
              child: Card(
                  color: Colors.white,
                  child: Center(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: CircleAvatar(
                                radius: 55,
                                backgroundColor: Colors.white,
                                // radius: 60.0,
                                child: Container(
                                  margin: EdgeInsets.all(5),
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
                                          image: new AssetImage(
                                              "images/ain.jpg"))),
                                )),
                          ),
                          Text(
                            'আইন',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 28,
                              fontFamily: 'Shobuj Nolua',
                            ),
                          ),
                        ]),
                  )),
            ),
          ),

          ///rules
          Center(
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return MyRule();
                }));
              },
              child: Card(
                  color: Colors.white,
                  child: Center(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: CircleAvatar(
                                radius: 55,
                                backgroundColor: Colors.white,
                                // radius: 60.0,
                                child: Container(
                                  margin: EdgeInsets.all(5),
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
                                          fit: BoxFit.cover,
                                          image: new AssetImage(
                                              "images/bidimala.jpg"))),
                                )),
                          ),
                          Text(
                            'বিধিমালা',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 30,
                              fontFamily: 'Shobuj Nolua',
                            ),
                          ),
                        ]),
                  )),
            ),
          ),

          ///tofsil
          Center(
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return Tofsil();
                }));
              },
              child: Card(
                  color: Colors.white,
                  child: Center(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: CircleAvatar(
                                radius: 55,
                                backgroundColor: Colors.white,
                                // radius: 60.0,
                                child: Container(
                                  margin: EdgeInsets.all(5),
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
                                          image: new AssetImage(
                                              "images/tofsil.jpg"))),
                                )),
                          ),
                          Text(
                            'তফসিল',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 30,
                              fontFamily: 'Shobuj Nolua',
                            ),
                          ),
                        ]),
                  )),
            ),
          ),

          ///sro
          Center(
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return Sro(
                    subject: 'sro',
                    title: 'এসআরও',
                  );
                }));
              },
              child: Card(
                  color: Colors.white,
                  child: Center(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: CircleAvatar(
                                radius: 55,
                                backgroundColor: Colors.white,
                                // radius: 60.0,
                                child: Container(
                                  margin: EdgeInsets.all(5),
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
                                        image: ResizeImage(
                                            AssetImage("images/sro.jpg"),
                                            height: 300)),
                                  ),
                                )),
                          ),
                          Text(
                            'এসআরও',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 30,
                              fontFamily: 'Shobuj Nolua',
                            ),
                          ),
                        ]),
                  )),
            ),
          ),

          ///ades
          Center(
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return Ades();
                }));
              },
              child: Card(
                  color: Colors.white,
                  child: Center(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: CircleAvatar(
                                radius: 55,
                                backgroundColor: Colors.white,
                                // radius: 60.0,
                                child: Container(
                                  margin: EdgeInsets.all(5),
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
                                          image: new AssetImage(
                                              "images/ades.jpg"))),
                                )),
                          ),
                          Text(
                            'আদেশ ও ব্যাখ্যাপত্র',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 28,
                              fontFamily: 'Shobuj Nolua',
                            ),
                          ),
                        ]),
                  )),
            ),
          ),

          ///6 subjectwise
          Center(
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return SubjectWise();
                }));
              },
              child: Card(
                  color: Colors.white,
                  child: Center(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 1,
                            child: CircleAvatar(
                                radius: 55,
                                backgroundColor: Colors.white,
                                // radius: 60.0,
                                child: Container(
                                  margin: EdgeInsets.all(5),
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
                                          image: new AssetImage(
                                              "images/alocona.jpg"))),
                                )),
                          ),
                          Text(
                            'বিষয় ভিত্তিক আলোচনা',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 28,
                              fontFamily: 'Shobuj Nolua',
                            ),
                          ),
                        ]),
                  )),
            ),
          ),

          ///7 form
          Center(
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return MyForm(
                    subject: 'form',
                    title: 'ফরম',
                  );
                }));
              },
              child: Card(
                  color: Colors.white,
                  child: Center(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: CircleAvatar(
                                radius: 55,
                                backgroundColor: Colors.white,
                                // radius: 60.0,
                                child: Container(
                                  margin: EdgeInsets.all(5),
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
                                          image: new AssetImage(
                                              "images/form.jpg"))),
                                )),
                          ),
                          Text(
                            'ফরম',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 30,
                              fontFamily: 'Shobuj Nolua',
                            ),
                          ),
                        ]),
                  )),
            ),
          ),

          ///form2
          Center(
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return MyForm(
                    subject: 'form2',
                    title: 'ফরম পূরনের নির্দেশিকা',
                  );
                }));
              },
              child: Card(
                  color: Colors.white,
                  child: Center(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 1,
                            child: CircleAvatar(
                                radius: 55,
                                backgroundColor: Colors.white,
                                // radius: 60.0,
                                child: Container(
                                  margin: EdgeInsets.all(5),
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
                                          image: new AssetImage(
                                              "images/formin.jpg"))),
                                )),
                          ),
                          Text(
                            'ফরম পূরনের নির্দেশিকা',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 28,
                              fontFamily: 'Shobuj Nolua',
                            ),
                          ),
                        ]),
                  )),
            ),
          ),

          ///sarcharge
          Center(
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return Sro(
                    subject: 'sarcharge',
                    title: 'সার চার্জ',
                  );
                }));
              },
              child: Card(
                  color: Colors.white,
                  child: Center(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: CircleAvatar(
                                radius: 55,
                                backgroundColor: Colors.white,
                                // radius: 60.0,
                                child: Container(
                                  margin: EdgeInsets.all(5),
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
                                          image: new AssetImage(
                                              "images/sarcharge.jpg"))),
                                )),
                          ),
                          Text(
                            'সার চার্জ',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 30,
                              fontFamily: 'Shobuj Nolua',
                            ),
                          ),
                        ]),
                  )),
            ),
          ),

          /// abogari
          Center(
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return Sro(
                    subject: 'abogari',
                    title: 'আবগারী শুল্ক',
                  );
                }));
              },
              child: Card(
                  color: Colors.white,
                  child: Center(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: CircleAvatar(
                                radius: 55,
                                backgroundColor: Colors.white,
                                // radius: 60.0,
                                child: Container(
                                  margin: EdgeInsets.all(5),
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
                                          image: new AssetImage(
                                              "images/abgari.jpg"))),
                                )),
                          ),
                          Text(
                            'আবগারী শুল্ক',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 30,
                              fontFamily: 'Shobuj Nolua',
                            ),
                          ),
                        ]),
                  )),
            ),
          ),

          ///tariff
          Center(
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return MyForm(
                    subject: 'bibidho',
                    title: 'ট্যারিফ ও অন্যান্য',
                  );
                }));
              },
              child: Card(
                  color: Colors.white,
                  child: Center(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: CircleAvatar(
                                radius: 55,
                                backgroundColor: Colors.white,
                                // radius: 60.0,
                                child: Container(
                                  margin: EdgeInsets.all(5),
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
                                          image: new AssetImage(
                                              "images/tarif.jpg"))),
                                )),
                          ),
                          Text(
                            'ট্যারিফ ও অন্যান্য',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 30,
                              fontFamily: 'Shobuj Nolua',
                            ),
                          ),
                        ]),
                  )),
            ),
          ),

          ///bin search
          Center(
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return MyWebView(
                    title: 'বিন সার্চ',
                    selectedUrl:
                        'http://nbr.gov.bd/fourteen-digit-bin-search/eng',
                  );
                }));
              },
              child: Card(
                  color: Colors.white,
                  child: Center(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: CircleAvatar(
                                radius: 55,
                                backgroundColor: Colors.white,
                                // radius: 60.0,
                                child: Container(
                                  margin: EdgeInsets.all(5),
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
                                          image: new AssetImage(
                                              "images/binsearch.jpg"))),
                                )),
                          ),
                          Text(
                            'বিন সার্চ',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 30,
                              fontFamily: 'Shobuj Nolua',
                            ),
                          ),
                        ]),
                  )),
            ),
          ),

          ///calculator
          Center(
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return MyCalculator();
                }));
              },
              child: Card(
                  color: Colors.white,
                  child: Center(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: CircleAvatar(
                                radius: 55,
                                backgroundColor: Colors.white,
                                // radius: 60.0,
                                child: Container(
                                  margin: EdgeInsets.all(5),
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
                                          image: new AssetImage(
                                              "images/calculator.jpg"))),
                                )),
                          ),
                          Text(
                            'ক্যালকুলেটর',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 30,
                              fontFamily: 'Shobuj Nolua',
                            ),
                          ),
                        ]),
                  )),
            ),
          ),

          ///question ans
          Center(
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return Question();
                }));
              },
              child: Card(
                  color: Colors.white,
                  child: Center(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: CircleAvatar(
                                radius: 55,
                                backgroundColor: Colors.white,
                                // radius: 60.0,
                                child: Container(
                                  margin: EdgeInsets.all(5),
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
                                          image: new AssetImage(
                                              "images/question.jpg"))),
                                )),
                          ),
                          Text(
                            'প্রশ্ন ও উত্তর',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 30,
                              fontFamily: 'Shobuj Nolua',
                            ),
                          ),
                        ]),
                  )),
            ),
          ),

          ///links
          Center(
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return ImportLink();
                }));
              },
              child: Card(
                  color: Colors.white,
                  child: Center(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: CircleAvatar(
                                radius: 55,
                                backgroundColor: Colors.white,
                                // radius: 60.0,
                                child: Container(
                                  margin: EdgeInsets.all(5),
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
                                          image: new AssetImage(
                                              "images/linkr.jpg"))),
                                )),
                          ),
                          Text(
                            'গুরুত্বপূর্ণ লিংক',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 30,
                              fontFamily: 'Shobuj Nolua',
                            ),
                          ),
                        ]),
                  )),
            ),
          ),

          ///16 bibidho form
          Center(
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return MyForm(
                    subject: 'tariff',
                    title: 'ডাউনলোড',
                  );
                }));
              },
              child: Card(
                  color: Colors.white,
                  child: Center(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: CircleAvatar(
                                radius: 55,
                                backgroundColor: Colors.white,
                                // radius: 60.0,
                                child: Container(
                                  margin: EdgeInsets.all(5),
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
                                          image: new AssetImage(
                                              "images/extra.jpg"))),
                                )),
                          ),
                          Text(
                            'ডাউনলোড',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 30,
                              fontFamily: 'Shobuj Nolua',
                            ),
                          ),
                        ]),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}

/* Center(
            child: InkWell(
              onTap: () {
                /* Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return Law();
                  }));*/
              },
              child: Card(
                  color: Colors.white,
                  child: Center(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 50,
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
                                            new AssetImage("images/law2.png"))),
                              ),
                            ),
                          ),
                          Text(
                            'আইন',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Shobuj Nolua',
                              fontSize: 30,
                            ),
                          ),
                        ]),
                  )),
            ),
          ),*/
