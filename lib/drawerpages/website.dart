import 'package:flutter/material.dart';
import 'package:vatapp/components/mydrawer.dart';
import 'package:connectivity/connectivity.dart';
import 'package:vatapp/constants.dart';

class Website extends StatefulWidget {
  @override
  _WebsiteState createState() => _WebsiteState();
}

class _WebsiteState extends State<Website> {
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
        title: Text('ওয়েবসাইট'),
      ),
      body: Container(
        color: Color(0xff056608),
        padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
        child: Center(
          child: Container(
            child: CircleAvatar(
              backgroundColor: Colors.red,
              child: Center(
                child: Container(
                  child: Text(
                    "Website not published.",
                    textAlign: TextAlign.center,
                  ),
                  padding: EdgeInsets.all(10),
                ),
              ),
              radius: 80,
            ),
          ),
        ),
      ),
    );
  }
}
