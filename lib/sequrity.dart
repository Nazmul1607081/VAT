import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vatapp/pages/homepage.dart';
import 'package:device_info/device_info.dart';

class MySecurity extends StatefulWidget {
  @override
  _MySecurityState createState() => _MySecurityState();
}

class _MySecurityState extends State<MySecurity> {
  String deviceId = "";
  String deviceId1 = "";
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
      Fluttertoast.showToast(
          msg: 'Fail to get deviceID',
          gravity: ToastGravity.CENTER,
          toastLength: Toast.LENGTH_LONG);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //for checking purpose;
  }

  String hashGen(String s) {
    if (s == "a" || s == "A") return "Q";
    if (s == "b" || s == "B") return "FJHJ";
    if (s == "c" || s == "C") return "K34";
    if (s == "d" || s == "D") return "C";
    if (s == "e" || s == "E") return "S";
    if (s == "f" || s == "F") return "BGR";
    if (s == "g" || s == "G") return "R";
    if (s == "h" || s == "H") return "HAG";
    if (s == "i" || s == "I") return "AGT";
    if (s == "j" || s == "J") return "I";
    if (s == "k" || s == "K") return "AAG";
    if (s == "l" || s == "L") return "V";
    if (s == "m" || s == "M") return "ZAG";
    if (s == "n" || s == "N") return "O";
    if (s == "o" || s == "O") return "J";
    if (s == "p" || s == "P") return "!";
    if (s == "q" || s == "Q") return ")AG";
    if (s == "r" || s == "R") return "%G";
    if (s == "s" || s == "S") return "9";
    if (s == "t" || s == "T") return "462GF";
    if (s == "u" || s == "U") return "1";
    if (s == "v" || s == "V") return "6";
    if (s == "w" || s == "W") return "8FB";
    if (s == "x" || s == "X") return "2";
    if (s == "y" || s == "Y") return "E";
    if (s == "z" || s == "Z") return "LBDG";
    if (s == "1") return "Y";
    if (s == "1") return "MHA";
    if (s == "2") return "3";
    if (s == "3") return "@";
    if (s == "4") return "#3";
    if (s == "5") return "7#";
    if (s == "6") return "G";
    if (s == "7") return "XAG";
    if (s == "8") return "(";
    if (s == "9") return "*A8";
    if (s == "0")
      return "7QHGR";
    else {
      return s + "HDS";
    }
  }

  bool check(String s1, String s2) {
    String temp = "VAT";
    for (int i = 0; i < s1.length; i++) {
      temp = temp + hashGen(s1[i]);
    }
    temp = temp + "GUIDE";
    print(temp);
    if (temp == s2) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Image.asset('images/finalwelcomepagelogo.jpg'),
          Card(
            child: Container(
              child: Text(
                "কোডটি পেতে ০১৭৭৭৩৩৪৯৯৪ নাম্বার এ যোগাযোগ করুন",
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Card(
            child: Column(
              children: <Widget>[
                (deviceId1 != "")
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("$deviceId1"),
                          IconButton(
                            icon: Icon(Icons.content_copy),
                            onPressed: () {
                              Clipboard.setData(
                                  new ClipboardData(text: deviceId1));
                              Fluttertoast.showToast(
                                  msg: 'Text copied : $deviceId1',
                                  gravity: ToastGravity.CENTER);
                            },
                          )
                        ],
                      )
                    : Container(),
                MaterialButton(
                  color: Colors.lightBlue,
                  child: Text("Get device ID"),
                  onPressed: () async {
                    deviceId = await _getId();
                    setState(() {
                      deviceId1 = deviceId;
                    });
                    print("deviceID");
                    print(deviceId1);
                  },
                ),
              ],
            ),
          ),
          Card(
            child: Column(
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                    hintText: "  Give the Code",
                  ),
                  onChanged: (value) {
                    code = value;
                  },
                ),
                MaterialButton(
                  color: Colors.red,
                  child: Text("GO"),
                  onPressed: () async {
                    deviceId = await _getId();
                    setState(() {
                      deviceId1 = deviceId;
                    });
                    print("code = $code");
                    if (check(deviceId1, code)) {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    } else {
                      Fluttertoast.showToast(
                          msg: 'Wrong Code',
                          gravity: ToastGravity.CENTER,
                          toastLength: Toast.LENGTH_LONG);
                    }
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40,
          )
        ],
      ),
    );
  }
}
