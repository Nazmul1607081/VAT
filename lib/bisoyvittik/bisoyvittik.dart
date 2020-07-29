import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vatapp/components/mydrawer.dart';

import 'package:vatapp/constants.dart';
import 'package:vatapp/law/law11.dart';

import 'package:http/http.dart' as http;

import 'package:cloud_firestore/cloud_firestore.dart';

class SubjectWise extends StatefulWidget {
  @override
  _SubjectWiseState createState() => _SubjectWiseState();
}

class _SubjectWiseState extends State<SubjectWise> {
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
          'বিষয় ভিত্তিক আলোচনা',
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
        child: SubjectWiseBody(),
      ),
    );
  }
}

class SubjectWiseBody extends StatefulWidget {
  @override
  _SubjectWiseBodyState createState() => _SubjectWiseBodyState();
}

class _SubjectWiseBodyState extends State<SubjectWiseBody> {
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
            StreamBuilder<QuerySnapshot>(
              //stream: Firestore.instance.collection('sro').snapshots(),
              stream: Firestore.instance
                  .collection("subjectwise")
                  .orderBy('no', descending: false)
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                print("inside ortho ain {widget.subject}");

                if (snapshot.hasError)
                  return new Text('Error: ${snapshot.error}');
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return new Text('Waiting...');
                  default:
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data.documents.length,
                        physics: ScrollPhysics(),
                        itemBuilder: (context, index) {
                          DocumentSnapshot document =
                              snapshot.data.documents[index];
                          return SubjectWiseButton(
                            name: document['title'],
                            num: document['no'],
                          );
                        });
                }
              },
            )
          ],
        ),
      );
    });
  }
}

class SubjectWiseButton extends StatelessWidget {
  final name;
  final num;

  const SubjectWiseButton({Key key, this.name, this.num}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
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
              name: name,
              num: num,
              path: null,
              gopage: 0,
              dir: 'subject',
            );
          }));
        },
        child: Text(
          "$name",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Shobuj Nolua',
            fontSize: 22,
          ),
        ),
      ),
    );
  }
}
