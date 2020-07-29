import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart';
import 'package:vatapp/components/appbar.dart';
import 'package:vatapp/components/gridview.dart';
import 'package:vatapp/components/mydrawer.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:open_file/open_file.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:dio/dio.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:connectivity/connectivity.dart';

import '../constants.dart';
import 'login.dart';

class MyReg extends StatefulWidget {
  @override
  _MyRegState createState() => _MyRegState();
}

class _MyRegState extends State<MyReg> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.keyboard_backspace),
            onPressed: () {
              Navigator.pop(context);
            }),
        centerTitle: true,
        backgroundColor: Color(0xff056608),
        title: Text('রেজিস্ট্রেশান'),
      ),
      body: MyRegBody(),
    );
  }
}

class MyRegBody extends StatefulWidget {
  @override
  _MyRegBodyState createState() => _MyRegBodyState();
}

class _MyRegBodyState extends State<MyRegBody> {
  final _auth = FirebaseAuth.instance;
  bool showProgress = false;

  bool wrong1 = true;
  bool wrong2 = true;

  String email = "", password = "";

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
          image: backgroundimage,
          //image: AssetImage("images/pdfback.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: ModalProgressHUD(
        inAsyncCall: showProgress,
        child: ListView(
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 160,
                    child: Image.asset(
                      'images/logo2.png',
                    ),
                  ),
                  TextField(
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    keyboardType: TextInputType.emailAddress,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      email = value; //get the value entered by user.
                    },
                    decoration: InputDecoration(
                      hintText: "Enter your Email",
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: (wrong1) ? Colors.green : Colors.red,
                            width: 5),
                        borderRadius: BorderRadius.all(
                          Radius.circular(32.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextField(
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    obscureText: true,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      password = value;
                      setState(() {
                        wrong2 = true;
                      });
                    },
                    decoration: InputDecoration(
                      fillColor: (wrong2) ? Colors.green : Colors.red,
                      hintText: "Enter your Password",
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: (wrong2) ? Colors.green : Colors.red,
                            width: 5),
                        borderRadius: BorderRadius.all(
                          Radius.circular(32.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Material(
                    elevation: 5,
                    color: Colors.lightBlue,
                    borderRadius: BorderRadius.circular(32.0),
                    child: MaterialButton(
                      onPressed: () async {
                        setState(() {
                          showProgress = true;
                        });
                        if (!isEmail(email)) {
                          setState(() {
                            wrong1 = false;
                          });
                          Scaffold.of(context).showSnackBar(SnackBar(
                            backgroundColor: Colors.red,
                            content: Text(
                              "Enter a valid email",
                              style: TextStyle(color: Colors.white),
                            ),
                          ));
                          setState(() {
                            showProgress = false;
                          });
                        }
                        if (password.length < 6) {
                          setState(() {
                            wrong2 = false;
                          });
                          Scaffold.of(context).showSnackBar(SnackBar(
                            backgroundColor: Colors.red,
                            content: Text(
                              "Password at least length 6",
                              style: TextStyle(color: Colors.white),
                            ),
                          ));
                          setState(() {
                            showProgress = false;
                          });
                        } else {
                          try {
                            final newuser =
                                await _auth.createUserWithEmailAndPassword(
                                    email: email, password: password);
                            if (newuser != null) {
                              setState(() {
                                showProgress = false;
                              });
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Login()),
                              );
                            } else {
                              print("abs");
                              setState(() {
                                showProgress = false;
                              });
                              Scaffold.of(context).showSnackBar(SnackBar(
                                backgroundColor: Colors.red,
                                content: Text(
                                  "Registration Failed. Try again",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ));
                            }
                          } catch (e) {
                            setState(() {
                              showProgress = false;
                            });
                            print("error :" + e.toString());
                            Scaffold.of(context).showSnackBar(SnackBar(
                              backgroundColor: Colors.red,
                              content: Text(
                                "Registration Failed. Try again \n ${e}",
                                style: TextStyle(color: Colors.white),
                              ),
                            ));
                          }
                        }
                      },
                      minWidth: 200.0,
                      height: 45.0,
                      child: Text(
                        "Register",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 20.0),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  InkWell(
                    onTap: () {
                      print("already");
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Login()),
                      );
                    },
                    child: Text(
                      "Already Registered? Login Now",
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.w900),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
