import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vatapp/components/appbar.dart';
import 'package:vatapp/components/filereadwrite.dart';
import 'package:vatapp/components/gridview.dart';
import 'package:vatapp/components/mydrawer.dart';

class AboutDev extends StatefulWidget {
  @override
  _AboutDevState createState() => _AboutDevState();
}

class _AboutDevState extends State<AboutDev> {
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
        title: Text('ডেভেলপার'),
      ),
      body: Container(
        color: Color(0xff056608),
        child: ListView(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  Text(
                    "Md. Nazmul Hasan\nStudent of Computer Science and Engineering Department,\nKhulna University of Engineering and Technology\nMobile no : 01770751512\nGmail : nazmul81csekuet@gmail.com\nFb profile: https://www.facebook.com/profile.php?id=100006437230988",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontStyle: FontStyle.italic),
                  ),
                  /* SizedBox(
                      height: 30,
                    ),
                    FlatButton(
                      color: Colors.red,
                      child: Text("Test"),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return MyFileOperation();
                        }));
                      },
                    ),*/
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
