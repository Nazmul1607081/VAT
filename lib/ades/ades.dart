import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vatapp/components/mydrawer.dart';
import 'package:vatapp/constants.dart';
import 'package:vatapp/law/law11.dart';
import 'package:vatapp/sro/sro.dart';
import 'package:http/http.dart' as http;

class Ades extends StatefulWidget {
  @override
  _AdesState createState() => _AdesState();
}

class _AdesState extends State<Ades> {
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
          'সাধারণ আদেশ ও ব্যাখ্যাপত্র',
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
        child: AdesBody(),
      ),
    );
  }
}

class AdesBody extends StatefulWidget {
  @override
  _AdesBodyState createState() => _AdesBodyState();
}

class _AdesBodyState extends State<AdesBody> {
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
                  print("mat pressed");
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return Sro(
                      title: "(ক) সাধারন আদেশ",
                      subject: "gades",
                    );
                  }));
                },
                child: Text(
                  "(ক) সাধারন আদেশ",
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
                    return Sro(
                      title: "(খ) বিশেষ আদেশ",
                      subject: "sades",
                    );
                  }));
                },
                child: Text(
                  "(খ) বিশেষ আদেশ",
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
                    return Sro(
                      title: "(গ) ব্যাখ্যাপত্র",
                      subject: 'babostapotro',
                    );
                  }));
                },
                child: Text(
                  "(গ) ব্যাখ্যাপত্র",
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Law11(
                      name: "আমদানি-রপ্তানিকারক রেজিস্ট্রেশন আদেশ-১৯৮১",
                      num: "",
                      path: null,
                      gopage: 0,
                      dir: 'extralaw',
                    );
                  }));
                },
                child: Text(
                  "(ঘ) আমদানি-রপ্তানিকারক রেজিস্ট্রেশান আদেশ-১৯৮১",
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Law11(
                      name: "আমদানি নীতি আদেশ-2015-2018",
                      num: "",
                      path: null,
                      gopage: 0,
                      dir: 'extralaw',
                    );
                  }));
                },
                child: Text(
                  "(ঙ) আমদানি নীতি আদেশ ২০১৫-২০১৮",
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Law11(
                      name: "রপ্তানী নীতি -2018-2021",
                      num: "",
                      path: null,
                      gopage: 0,
                      dir: 'extralaw',
                    );
                  }));
                },
                child: Text(
                  "(চ) রপ্তানি নীতি আদেশ ২০১৮-২০২১",
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
