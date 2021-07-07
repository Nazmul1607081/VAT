import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vatapp/drawerpages/AppMap.dart';
import 'package:vatapp/drawerpages/aboutdeveloper.dart';
import 'package:vatapp/drawerpages/aboutme.dart';
import 'package:vatapp/drawerpages/advice.dart';
import 'package:vatapp/drawerpages/introduction.dart';
import 'package:vatapp/drawerpages/vatsupport.dart';
import 'package:vatapp/drawerpages/website.dart';
import 'package:vatapp/law/pdfsettings.dart';
import 'package:vatapp/pages/homepage.dart';
import 'package:vatapp/drawerpages/login.dart';
import 'package:vatapp/sro/pdfview.dart';
import 'package:vatapp/pages/spalashscreen.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:device_info/device_info.dart';

class MyDrawer extends StatefulWidget {
  final code;

  const MyDrawer({Key key, this.code}) : super(key: key);
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
/*  _showMyDialog() {
    return showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('This is a demo alert dialog.'),
                Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text('OK'),
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => MyLogOut()));
              },
            ),
          ],
        );
      },
    );
  }*/

  bool isLoggedin = false;

  @override
  Widget build(BuildContext context) {
    FirebaseAuth.instance.onAuthStateChanged.listen((user) {
      //print(user);
      if (mounted) {
        if (user != null) {
          setState(() {
            isLoggedin = true;
          });
        } else {
          setState(() {
            isLoggedin = false;
          });
        }
      }
    });
    return SafeArea(
      child: Container(
        width: 250,
        child: Drawer(
          elevation: 20,
          child: new ListView(
            padding: EdgeInsets.all(0),
            children: <Widget>[
              Container(
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    color: Color(0xff056608),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                    /*image: DecorationImage(

                        ///ToDo image change hobe..
                        image: AssetImage('images/backspa.jpg'),
                        fit: BoxFit.fill),*/
                  ),
                  child: Stack(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          CircleAvatar(
                            child: Image(image: AssetImage('images/logo2.png')),
                            backgroundColor: Colors.white,
                            radius: 50,
                          ),
                          Container(
                            child: Text(
                              "ভ্যাট এখন হাতের মুঠোয়",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 28.0,
                                fontFamily: "Shobuj Nolua",
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
//            header

//            body

              Container(
                child: ListTile(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return HomePage();
                    }));
                  },
                  title: Text('হোম'),
                  leading: ImageIcon(
                    AssetImage('images/house.png'),
                    color: Colors.black,
                  ),
                ),
              ),
              Divider(),

              Container(
                child: ListTile(
                  title: Text('ভূমিকা'),
                  leading: ImageIcon(
                    AssetImage('images/introduction.png'),
                    color: Colors.black,
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return Introduction();
                    }));
                  },
                ),
              ),
              Divider(),
              Container(
                child: ListTile(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return AppMap();
                    }));
                  },
                  title: Text('অ্যাপ ম্যাপ'),
                  leading: ImageIcon(
                    AssetImage('images/map1.png'),
                    color: Colors.black,
                  ),
                ),
              ),
              Divider(),

              Container(
                child: ListTile(
                  title: Text('ব্যবহারকারীর পরামর্শ'),
                  leading: ImageIcon(
                    AssetImage('images/feedback1.png'),
                    color: Colors.black,
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return Advice();
                    }));
                  },
                ),
              ),
              Divider(),
              Container(
                child: ListTile(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Website()));
                  },
                  title: Text('ওয়েবসাইট'),
                  leading: ImageIcon(
                    AssetImage('images/website.png'),
                    color: Colors.black,
                  ),
                ),
              ),
              (!isLoggedin) ? Divider() : Container(),
              (isLoggedin)
                  ? /*Container(
                      child: ListTile(
                        onTap: () {
                          ///FirebaseAuth.instance.signOut();
                          */ /*Navigator.push(context, MaterialPageRoute(
                              builder: (BuildContext context) {
                            return MyLogOut();
                          }));*/ /*
                          _showMyDialog();
                        },
                        title: Text('লগ আউট'),
                        leading: ImageIcon(
                          AssetImage('images/login.png'),
                          color: Colors.black,
                        ),
                      ),
                    )*/
                  Container()
                  : Container(
                      child: ListTile(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (BuildContext context) {
                            return Login();
                          }));
                        },
                        title: Text('লগইন/রেজিস্ট্রেশান'),
                        leading: ImageIcon(
                          AssetImage('images/login.png'),
                          color: Colors.black,
                        ),
                      ),
                    ),
              Divider(),
              Container(
                child: ListTile(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return AboutMe();
                    }));
                  },
                  title: Text('আমাদের সম্পর্কে'),
                  leading: ImageIcon(
                    AssetImage('images/about1.png'),
                    color: Colors.black,
                  ),
                ),
              ),
              Divider(),
              Container(
                child: ListTile(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return AboutDev();
                    }));
                  },
                  title: Text('ডেভেলপার'),
                  leading: ImageIcon(
                    AssetImage('images/developer1.png'),
                    color: Colors.black,
                  ),
                ),
              ),
              Divider(),
              Container(
                child: ListTile(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return VatSupport();
                    }));
                  },
                  title: Text('ভ্যাট সাপোর্ট'),
                  leading: ImageIcon(
                    AssetImage('images/vatsupport.png'),
                    color: Colors.black,
                  ),
                ),
              ),
              Divider(),
              Container(
                child: ListTile(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return PdfSetting();
                    }));
                  },
                  title: Text('PDF Settings'),
                  leading: ImageIcon(
                    AssetImage('images/pdf.png'),
                  ),
                ),
              ),
              Divider(),
              Container(
                child: ListTile(
                  onTap: () {
                    String code = '';
                    FirebaseDatabase database = FirebaseDatabase();
                    database.setPersistenceEnabled(true);
                    if (FirebaseAuth.instance.currentUser() != null) {
                      FirebaseAuth.instance.signOut().then((value) {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                          return SplashScreen1();
                        }));
                      });
                    }
                    /*_getId().then((deviceID) {
                      database
                          .reference()
                          .child('devices')
                          .child(deviceID)
                          .once()
                          .then((c) {
                        code = c.value['code'];
                        print("code");
                        print(code);
                      }).then((value) {
                        database
                            .reference()
                            .child('devices')
                            .child(deviceID)
                            .remove()
                            .then((value) {
                          database
                              .reference()
                              .child('keys')
                              .child(code)
                              .update({
                            'status': 'false',
                            'device': '',
                          }).then((value) {
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) {
                              return SplashScreen1();
                            }));
                          });
                        });
                      });
                    });*/
                  },
                  title: Text('Code Release and signOUT'),
                  leading: Icon(
                    Icons.logout,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<String> _getId() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Theme.of(context).platform == TargetPlatform.iOS) {
      IosDeviceInfo iosDeviceInfo = await deviceInfo.iosInfo;
      return iosDeviceInfo.identifierForVendor; // unique ID on iOS
    } else if (Theme.of(context).platform == TargetPlatform.android) {
      AndroidDeviceInfo androidDeviceInfo = await deviceInfo.androidInfo;
      return androidDeviceInfo.androidId; // unique ID on Android
    } else {
      return "";
    }
  }
}
