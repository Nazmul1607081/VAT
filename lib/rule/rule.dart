import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vatapp/components/mydrawer.dart';
import 'package:vatapp/law/law11.dart';
import 'rule1.dart';

class MyRule extends StatefulWidget {
  @override
  _MyRuleState createState() => _MyRuleState();
}

class _MyRuleState extends State<MyRule> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        backgroundColor: Color(0xff056608),
        centerTitle: true,
        title: Text(
          'বিধিমালা',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
            icon: Icon(Icons.keyboard_backspace),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: Container(
        /* decoration: BoxDecoration(
              //color: Color(0xff056608),
              image: DecorationImage(
                image: AssetImage("images/backlaw.png"),
                fit: BoxFit.cover,
              ),
            ),*/
        child: RuleBody(),
      ),
    );
  }
}

class RuleBody extends StatefulWidget {
  @override
  _RuleBodyState createState() => _RuleBodyState();
}

class _RuleBodyState extends State<RuleBody> {
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
          image: AssetImage("images/backlaw.jpg"),
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
              onPressed: () {
                print("mat pressed");
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return Rule1();
                }));
              },
              elevation: 10,
              //color: Color(0xC5C5C7),
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                //side: BorderSide(color: Colors.red),
              ),

              child: Text(
                "মূল্য সংযোজন কর ও সম্পূরক শুল্ক বিধিমালা, ২০১৬",
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
                    name: "মূল্য সংযোজন কর বিধিমাল, ১৯৯১",
                    num: "২",
                    path: null,
                    gopage: 0,
                    dir: 'rule2',
                  );
                }));
              },
              child: Text(
                "মূল্য সংযোজন কর বিধিমালা, ১৯৯১",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Shobuj Nolua',
                  fontSize: 22,
                ),
              ),
            ),
          ),
          /* Container(
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
                print("mat pressed");
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return Law1();
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
          ),*/
        ],
      ),
    );
  }
}
