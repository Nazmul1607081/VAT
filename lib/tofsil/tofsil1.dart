import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vatapp/components/mydrawer.dart';
import 'package:vatapp/law/law11.dart';
import 'package:vatapp/constants.dart';

class Tofsil1 extends StatefulWidget {
  @override
  _Tofsil1State createState() => _Tofsil1State();
}

class _Tofsil1State extends State<Tofsil1> {
  @override
  void initState() {
    // TODO: implement initState
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
          "মূল্য সংযোজন কর ও সম্পূরক শুল্ক আইন, ২০১২ এর তফসিল",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          //color: Color(0xff056608),
          image: DecorationImage(
            image: backgroundimage,
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          children: <Widget>[
            Card(
              child: ListTile(
                leading: Container(
                  height: 40,
                  width: 40,
                  padding: EdgeInsets.all(0),
                  margin: EdgeInsets.all(0),
                  child: Image.asset('images/pdf.png'),
                ),
                title: Text('তফসিল-১ (অব্যাহতিপ্রাপ্ত পণ্য ও সেবাসমূহ)'),
                subtitle: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    MyTofSilButton(
                      text: "প্রথম খণ্ড",
                      num: '১',
                      dir: 'tofsil1',
                    ),
                    MyTofSilButton(
                      text: "দ্বিতীয় খণ্ড",
                      num: '২',
                      dir: 'tofsil1',
                    ),
                  ],
                ),
              ),
            ),
            Card(
              child: ListTile(
                leading: Container(
                  height: 40,
                  width: 40,
                  padding: EdgeInsets.all(0),
                  margin: EdgeInsets.all(0),
                  child: Image.asset('images/pdf.png'),
                ),
                title:
                    Text('তফসিল-২ (সম্পূরক শুল্ক আরোপযোগ্য পণ্য ও সেবাসমূহ)'),
                subtitle: Column(
                  children: <Widget>[
                    MyTofSilButton(
                      text: "টেবিল ০১",
                      num: '১',
                      dir: 'tofsil2',
                    ),
                    MyTofSilButton(
                      text: "টেবিল ০২",
                      num: '২',
                      dir: 'tofsil2',
                    ),
                    MyTofSilButton(
                      text: "টেবিল ০৩",
                      num: '৩',
                      dir: 'tofsil2',
                    ),
                  ],
                ),
              ),
            ),
            Card(
              child: ListTile(
                leading: Container(
                  height: 40,
                  width: 40,
                  padding: EdgeInsets.all(0),
                  margin: EdgeInsets.all(0),
                  child: Image.asset('images/pdf.png'),
                ),
                title: Text(
                    'তফসিল-৩ (আদর্শ হার ব্যাতিত অন্যান্য হারের ও সুনির্দিষ্ট করের পণ্য ও সেবাসমূহ)'),
                subtitle: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    MyTofSilButton(
                      text: "টেবিল ০১",
                      num: '১',
                      dir: 'tofsil3',
                    ),
                    MyTofSilButton(
                      text: "টেবিল ০২",
                      num: '২',
                      dir: 'tofsil3',
                    ),
                    MyTofSilButton(
                      text: "টেবিল ০৩",
                      num: '৩',
                      dir: 'tofsil3',
                    ),
                    MyTofSilButton(
                      text: "টেবিল ০৪",
                      num: '৪',
                      dir: 'tofsil3',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyTofSilButton extends StatelessWidget {
  final text;
  final num;
  final dir;

  const MyTofSilButton({Key key, this.text, this.num, this.dir})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    String tabilname = text;
    if (dir == 'tofsil3') {
      if (text == "টেবিল ০১") {
        tabilname = 'টেবিল 1 - 5  %  হারের ভ্যাট';
      }
      if (text == "টেবিল ০২") {
        tabilname = 'টেবিল 2 - 7.5% হারের ভ্যাট';
      }
      if (text == "টেবিল ০৩") {
        tabilname = 'টেবিল 3 - 10%  হারের ভ্যাট';
      }
      if (text == "টেবিল ০৪") {
        tabilname = 'টেবিল 4    -      সুনির্দিষ্ট কর';
      }
    }
    if (dir == 'tofsil2') {
      if (text == "টেবিল ০১") {
        tabilname = 'টেবিল 1- আমদানি পর্যায়ে সম্পূরক শুল্ক আরোপযোগ্য পণ্য';
      }
      if (text == "টেবিল ০২") {
        tabilname = 'টেবিল 2 স্থানীয় পর্যায়ে সম্পূরক শুল্ক আরোপযোগ্য পণ্য';
      }
      if (text == "টেবিল ০৩") {
        tabilname = 'টেবিল 3- স্থানীয় পর্যায়ে সম্পূরক শুল্ক আরোপযোগ্য সেবা।';
      }
    }
    if (dir == 'tofsil1') {
      if (text == "প্রথম খণ্ড") {
        tabilname =
            'প্রথম তফসিল টেবিল ১: মূল্য সংযোজন কর হতে অব্যাহতিপ্রাপ্ত পণ্য';
      }
      if (text == "দ্বিতীয় খণ্ড") {
        tabilname = 'টেবিল ২: মূল্য সংযোজন কর হতে অব্যাহতিপ্রাপ্ত সেবা।';
      }
    }
    return Container(
      padding: EdgeInsets.all(0),
      child: RaisedButton(
        color: Color(0xff056608),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) {
            return Law11(
              name: text,
              num: num,
              path: null,
              gopage: 0,
              dir: dir,
            );
          }));
        },
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            '$tabilname',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

/*Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) {
            return Law11(
              name: name,
              num: num,
              path: null,
              gopage: 0,
              dir: dir,
            );
          }));*/
