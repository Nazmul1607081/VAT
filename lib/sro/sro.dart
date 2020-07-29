import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vatapp/components/mydrawer.dart';
import '../constants.dart';
import 'mypdfview.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Sro extends StatefulWidget {
  final title;
  final subject;

  const Sro({Key key, this.title, this.subject}) : super(key: key);
  @override
  _SroState createState() => _SroState();
}

class _SroState extends State<Sro> {
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
            /*if (widget.subject == 'babostapotro' || widget.subject == 'gades') {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return Ades();
              }));
            } else {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return HomePage();
              }));
            }*/
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
        child: SroBody(
          subject: widget.subject,
        ),
      ),
    );
  }
}

class SroBody extends StatefulWidget {
  final subject;

  const SroBody({Key key, this.subject}) : super(key: key);
  @override
  _SroBodyState createState() => _SroBodyState();
}

class _SroBodyState extends State<SroBody> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

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
      child: Scrollbar(
        child: ListView(
          children: <Widget>[
            StreamBuilder<QuerySnapshot>(
              //stream: Firestore.instance.collection('sro').snapshots(),
              stream: Firestore.instance
                  .collection("${widget.subject}")
                  .orderBy('no', descending: false)
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
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
                          return MyPdfView(
                            title: document['title'],
                            date: document['date'],
                            description: document['description'],
                            num: document['no'],
                            sub: "${widget.subject}",
                          );
                        });
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
