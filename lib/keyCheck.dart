import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_info/device_info.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vatapp/pages/homepage.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class MyKey extends StatefulWidget {
  @override
  _MyKeyState createState() => _MyKeyState();
}

class _MyKeyState extends State<MyKey> {
  String code = "";
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

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: ListView(
          children: <Widget>[
            Container(
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(300),
                  bottomLeft: Radius.circular(300),
                ),
                child: Image.asset('images/finalwelcomepagelogo.jpg'),
              ),
              height: MediaQuery.of(context).size.height * .4,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 1.5,
              decoration: BoxDecoration(
                color: Colors.white10,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              padding: EdgeInsets.only(top: 10),
              child: Column(
                children: [
                  Card(
                    elevation: 0,
                    child: Container(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        "কোডটি পেতে ০১৭৭৭৩৩৪৯৯৪ নাম্বার এ যোগাযোগ করুন",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  Card(
                    elevation: 0,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: " Give the Code",
                            ),
                            onChanged: (value) {
                              setState(() {
                                code = value;
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        FlatButton(
                          color: Colors.green,
                          onPressed: () {
                            go();
                          },
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                "GO",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  go() {
    if (code == "") {
      Fluttertoast.showToast(
        msg: "Code is Empty",
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.red,
      );
    } else {
      setState(() {
        isLoading = true;
      });
      FirebaseDatabase database = FirebaseDatabase();
      database.setPersistenceEnabled(true);
      //database.setPersistenceCacheSizeBytes(10000000);

      database.reference().child('keys').child(code).once().then((value) {
        if (value.value == null) {
          setState(() {
            isLoading = false;
          });
          Fluttertoast.showToast(
            msg: "Code not Found",
            gravity: ToastGravity.CENTER,
            backgroundColor: Colors.red,
          );
        } else {
          int presentDate = DateTime.now().millisecondsSinceEpoch;
          int expDate = value.value['exp'];
          print(presentDate / 1000);
          print(expDate);
          if (presentDate / 1000 > expDate) {
            Fluttertoast.showToast(
              msg: "Code is Expired",
              gravity: ToastGravity.CENTER,
              backgroundColor: Colors.red,
            );
          } else if (value.value['status'] == 'true') {
            Fluttertoast.showToast(
              msg:
                  "Code is using by  another device \n Please release this code from this device.\nThanks",
              gravity: ToastGravity.CENTER,
              backgroundColor: Colors.red,
            );
          } else {
            _getId().then((deviceID) {
              database
                  .reference()
                  .child('devices')
                  .child(deviceID)
                  .set({'code': code}).then((value) {
                database.reference().child('keys').child(code).update({
                  'status': 'true',
                  'device': deviceID,
                }).then((value) {
                  setState(() {
                    isLoading = false;
                  });
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return HomePage();
                  }));
                });
              });
            });
          }
        }
        print(DateTime.now().millisecondsSinceEpoch);
        print(value.value['exp']);
      });
    }
  }
}
