import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vatapp/components/appbar.dart';
import 'package:vatapp/components/gridview.dart';
import 'package:vatapp/components/mydrawer.dart';
import 'package:vatapp/law/law1.dart';

import '../constants.dart';
import 'package:vatapp/sro/mypdfview.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'law11.dart';

class OthoAin extends StatefulWidget {
  final title;
  final subject;

  const OthoAin({Key key, this.title, this.subject}) : super(key: key);
  @override
  _OthoAinState createState() => _OthoAinState();
}

class _OthoAinState extends State<OthoAin> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white10,
      child: Scaffold(
        drawer: MyDrawer(),
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.keyboard_backspace),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Color(0xff056608),
          centerTitle: true,
          title: Text(
            "${widget.title}",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Container(
          /*decoration: BoxDecoration(
              //color: Color(0xff056608),
              image: DecorationImage(
                image: AssetImage("images/pdfback.jpg"),
                fit: BoxFit.cover,
              ),
            ),*/
          child: OthoAinBody(
            subject: widget.subject,
          ),
        ),
      ),
    );
  }
}

class OthoAinBody extends StatefulWidget {
  final subject;

  const OthoAinBody({Key key, this.subject}) : super(key: key);
  @override
  _OthoAinBodyState createState() => _OthoAinBodyState();
}

class _OthoAinBodyState extends State<OthoAinBody> {
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
      child: ListView(
        children: <Widget>[
          SizedBox(
            height: 30,
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
                print("mat pressed");
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return Law11(
                    name: "অর্থ আইন, ২০২১",
                    num: num,
                    path: null,
                    gopage: 0,
                    dir: 'orthoain',
                  );
                }));
              },
              child: Text(
                "অর্থ আইন, ২০২১",
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
                print("mat pressed");
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return Law11(
                    name: "Finance Act 2020",
                    num: num,
                    path: null,
                    gopage: 0,
                    dir: 'orthoain',
                  );
                }));
              },
              child: Text(
                "অর্থ আইন, ২০২০",
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
                print("mat pressed");
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return Law11(
                    name: "Finance Act 2019",
                    num: num,
                    path: null,
                    gopage: 0,
                    dir: 'orthoain',
                  );
                }));
              },
              child: Text(
                "অর্থ আইন, ২০১৯",
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
                print("mat pressed");
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return Law11(
                    name: "Finance Act 2018",
                    num: num,
                    path: null,
                    gopage: 0,
                    dir: 'orthoain',
                  );
                }));
              },
              child: Text(
                "অর্থ আইন, ২০১৮",
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
                print("mat pressed");
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return Law11(
                    name: "Finance Act 2017",
                    num: num,
                    path: null,
                    gopage: 0,
                    dir: 'orthoain',
                  );
                }));
              },
              child: Text(
                "অর্থ আইন, ২০১৭",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Shobuj Nolua',
                  fontSize: 22,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}
