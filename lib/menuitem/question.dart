import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vatapp/components/dowenloader.dart';
import 'package:vatapp/components/mydrawer.dart';
import 'package:vatapp/components/search.dart';
import 'package:vatapp/drawerpages/advice.dart';
import 'package:vatapp/drawerpages/login.dart';
import 'package:vatapp/pages/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:connectivity/connectivity.dart';

import '../constants.dart';

bool isMe = true;
FirebaseUser myuser;

class Question extends StatefulWidget {
  @override
  _QuestionState createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  bool isLoggedin = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseAuth.instance.onAuthStateChanged.listen((user) {
      print(user);
      if (user != null) {
        setState(() {
          isLoggedin = true;
          myuser = user;
        });
        print("user already logged in");
      } else {
        setState(() {
          isLoggedin = false;
        });
        print("not logged in");
      }
    });
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
          'প্রশ্ন ও উত্তর',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: (isLoggedin)
          ? QuestionBody()
          : Container(
              decoration: BoxDecoration(
                color: Color(0xff056608),
                image: DecorationImage(
                  image: AssetImage("images/backspa.jpg"),
                  //image: AssetImage("images/pdfback.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.red),
                  ),
                  color: Colors.red,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Login()));
                  },
                  child: Container(
                    child: Text(
                      "You are not loggedIn. Login First",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
      floatingActionButton: (isLoggedin)
          ? (isMe)
              ? FloatingActionButton.extended(
                  backgroundColor: Colors.red,
                  label: Text("All Question"),
                  onPressed: () {
                    setState(() {
                      FirebaseAuth.instance.onAuthStateChanged
                          .listen((user) async {
                        myuser = user;
                      });
                      if (myuser != null) {
                        isMe = false;
                      }
                    });
                  },
                )
              : FloatingActionButton.extended(
                  backgroundColor: Colors.red,
                  label: Text("My Question"),
                  onPressed: () {
                    FirebaseAuth.instance.onAuthStateChanged.listen((user) {
                      myuser = user;
                      if (myuser != null) {
                        setState(() {
                          isMe = true;
                        });
                      }
                    });
                  },
                )
          : Container(),
    );
  }
}

class QuestionBody extends StatefulWidget {
  @override
  _QuestionBodyState createState() => _QuestionBodyState();
}

class _QuestionBodyState extends State<QuestionBody> {
  String question = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void saveData() async {
    bool net = await netCheck();
    if (net) {
      FirebaseAuth.instance.onAuthStateChanged.listen((user) async {
        print(user.uid);
        user = user;
        if (user != null) {
          try {
            DocumentReference ref =
                await databaseReference.collection("question").add({
              'sender': '${user.uid}',
              'question': "$question",
              'time': DateTime.now(),
              'ans': "",
            });
            print(ref.documentID);
            print("upload finished");
            Scaffold.of(context).showSnackBar(SnackBar(
              content: Text("Sent Successful"),
            ));
            setState(() {
              isMe = true;
            });
          } catch (e) {
            Scaffold.of(context).showSnackBar(SnackBar(
              content: Text("Sending Error"),
            ));
          }
        } else {
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text("Sending Error"),
          ));
        }
      });
    } else {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("No Internet Connection"),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        //color: Color(0xff056608),

        image: DecorationImage(
          image: AssetImage("images/backspa.jpg"),
          //image: AssetImage("images/pdfback.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: ListView(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 10),
                width: 200,
                child: TextField(
                  decoration: InputDecoration(hintText: "write your question"),
                  onChanged: (text) {
                    question = text;
                  },
                ),
              ),
              Container(
                child: RaisedButton(
                  color: Color(0xff056608),
                  onPressed: () {
                    if (question.isEmpty) {
                      Scaffold.of(context).showSnackBar(SnackBar(
                        backgroundColor: Colors.red,
                        content: Text(
                          "Please write something",
                          style: TextStyle(color: Colors.white),
                        ),
                      ));
                    } else {
                      saveData();
                    }
                  },
                  child: Text(
                    "Post",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          (isMe)
              ? StreamBuilder<QuerySnapshot>(
                  stream: Firestore.instance
                      .collection('question')
                      .where('sender', isEqualTo: myuser.uid)
                      .orderBy('time', descending: true)
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
                            itemCount: snapshot.data.documents
                                .length, //snapshot.data.documents.length,
                            physics: ScrollPhysics(),
                            itemBuilder: (context, index) {
                              DocumentSnapshot document =
                                  snapshot.data.documents[index];

                              return MyMassage1(
                                question: document['question'],
                                ans: document['ans'],
                                index: document.documentID,
                              );
                            });
                    }
                  },
                )
              : StreamBuilder<QuerySnapshot>(
                  stream: Firestore.instance
                      .collection('question')
                      .orderBy('time', descending: true)
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    int i = 0;
                    if (snapshot.hasError)
                      return new Text('Error: ${snapshot.error}');
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return new Text('Waiting...');
                      default:
                        return ListView.builder(
                            shrinkWrap: true,
                            itemCount: snapshot.data.documents
                                .length, //snapshot.data.documents.length,
                            physics: ScrollPhysics(),
                            itemBuilder: (context, index) {
                              DocumentSnapshot document =
                                  snapshot.data.documents[index];
                              i++;
                              print(i);

                              return MyMassage1(
                                question: document['question'],
                                ans: document['ans'],
                                index: document.documentID,
                              );
                            });
                    }
                  },
                ),
          SizedBox(
            height: 60,
          )
        ],
      ),
    );
  }
}

class MyMassage1 extends StatefulWidget {
  final question;
  final ans;
  final index;

  const MyMassage1({
    Key key,
    this.question,
    this.ans,
    this.index,
  }) : super(key: key);

  @override
  _MyMassage1State createState() => _MyMassage1State();
}

class _MyMassage1State extends State<MyMassage1> {
  bool delete = false;

  void f() async {
    Firestore.instance.collection("question").document(widget.index).delete();

    print(widget.index);
    print("success!");

    setState(() {
      delete = false;
      isMe = true;
    });
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Question()));
    print("success end!");
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      children: <Widget>[
        InkWell(
          onTap: () {
            setState(() {
              delete = false;
            });
          },
          onLongPress: () {
            setState(() {
              delete = true;
            });
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                child: Material(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    topLeft: Radius.circular(10),
                  ),
                  color: Colors.white10,
                  elevation: 5,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                    padding: EdgeInsets.all(5),
                    child: (delete && isMe)
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "${widget.question}",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              Container(
                                child: IconButton(
                                  icon: Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                  onPressed: () {
                                    f();
                                  },
                                ),
                              ),
                            ],
                          )
                        : Text(
                            "${widget.question}",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
              child: Material(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  topLeft: Radius.circular(10),
                ),
                color: Colors.white10,
                elevation: 5,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  padding: EdgeInsets.all(5),
                  child: Text(
                    "${widget.ans}",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
