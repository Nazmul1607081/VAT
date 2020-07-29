import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:vatapp/components/mydrawer.dart';

import 'package:vatapp/law/law1.dart';
import 'package:vatapp/constants.dart';
import 'package:vatapp/law/law11.dart';
import 'package:vatapp/law/orthoain.dart';

import 'package:http/http.dart' as http;

class MyLaw extends StatefulWidget {
  @override
  _MyLawState createState() => _MyLawState();
}

class _MyLawState extends State<MyLaw> {
  String urlPDFPath = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: LawBody(),
      ),
    );
  }
}

class LawBody extends StatefulWidget {
  @override
  _LawBodyState createState() => _LawBodyState();
}

class _LawBodyState extends State<LawBody> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(builder: (context) {
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
                      return Law1();
                    }));
                  },
                  child: Text(
                    "মূল্য সংযোজন কর ও সম্পূরক শুল্ক আইন, ২০১২",
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
                margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
                child: RaisedButton(
                  elevation: 12,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    //side: BorderSide(color: Colors.red),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return Law11(
                        name: "মূল্য সংযোজন কর আইন, ১৯৯১",
                        num: "",
                        path: null,
                        gopage: 0,
                        dir: 'law2',
                      );
                    }));
                  },
                  child: Text(
                    "মূল্য সংযোজন কর আইন, ১৯৯১",
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
                margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
                child: RaisedButton(
                  elevation: 12,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    //side: BorderSide(color: Colors.red),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return OthoAin(
                        title: "অর্থ আইন",
                        subject: "orthoain",
                      );
                    }));
                  },
                  child: Text(
                    "অর্থ আইন",
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
      }),
    );
  }
}
