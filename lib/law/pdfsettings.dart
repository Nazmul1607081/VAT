import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:string_validator/string_validator.dart';
import 'package:vatapp/components/mydrawer.dart';

import '../constants.dart';
import 'law11.dart';

class PdfSetting extends StatefulWidget {
  final path;
  final name;
  final num;

  final dir;

  const PdfSetting({Key key, this.path, this.name, this.num, this.dir})
      : super(key: key);

  @override
  _PdfSettingState createState() => _PdfSettingState();
}

class _PdfSettingState extends State<PdfSetting> {
  bool nightmod = false;
  bool horizontal = false;

  Directory directory;

  File file, file1;
  int pageno;

  doPdfSettings() async {
    directory = await getExternalStorageDirectory();
    file = File("${directory.path}/pdfsetings1.txt");
    file1 = File("${directory.path}/pdfsetings2.txt");
    if (await file.exists()) {
      String contents = await file.readAsString();
      setState(() {
        if (contents == 'true') {
          pdf_nightmnnode = true;
        } else {
          pdf_nightmnnode = false;
        }
      });
      print("contents");
      print(contents);
    }
    if (await file1.exists()) {
      String contents = await file1.readAsString();
      print(contents);
      setState(() {
        if (contents == 'true') {
          pdf_pagemode = true;
        } else {
          pdf_pagemode = false;
        }
      });
    }
    print("pdf modes read s");
    print(pdf_pagemode);
    print(pdf_nightmnnode);
    setState(() {
      nightmod = pdf_nightmnnode;
      horizontal = pdf_pagemode;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageno = 0;
    nightmod = false;
    horizontal = false;
    doPdfSettings();
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
          "PDF Settings",
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
          padding: EdgeInsets.fromLTRB(30, 60, 30, 0),
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
/*            Material(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                elevation: 5,
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(10),
                      child: TextField(
                        decoration: InputDecoration(hintText: "page no"),
                        onChanged: (value) {
                          setState(() {
                            print(MediaQuery.of(context).viewInsets.bottom);
                            if (isNumeric(value)) {
                              pageno = int.parse(value);
                            }
                          });
                        },
                      ),
                    ),
                    (MediaQuery.of(context).viewInsets.bottom > 0.0)
                        ? Container()
                        : Card(
                            child: FlatButton(
                              onPressed: () {
                                pageno = pageno - 1;
                                print(pageno);
                                print("settings in " +
                                    pageno.runtimeType.toString());

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Law11(
                                            num: widget.num,
                                            name: widget.name,
                                            path: widget.path,
                                            nightmod: nightmod,
                                            horizontal: false,
                                            gopage: pageno,
                                            dir: widget.dir,
                                            fromsettings: true,
                                          )),
                                );
                              },
                              child: Text("Go"),
                            ),
                          ),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),*/
            Material(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              elevation: 5,
              child: Column(
                children: <Widget>[
                  Card(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text("Night Mode"),
                        Switch(
                          value: nightmod,
                          onChanged: (value) {
                            setState(() {
                              nightmod = value;
                              print(nightmod);
                            });
                          },
                        )
                      ],
                    ),
                  ),
                  Card(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text("Page View"),
                        Switch(
                          value: horizontal,
                          onChanged: (value) {
                            setState(() {
                              horizontal = value;
                              print(horizontal);
                            });
                          },
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Card(
                        child: FlatButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("Back"),
                        ),
                      ),
                      Card(
                        child: FlatButton(
                          onPressed: () async {
                            /*Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Law11(
                                          num: widget.num,
                                          name: widget.name,
                                          path: widget.path,
                                          nightmod: (nightmod == null)
                                              ? false
                                              : nightmod,
                                          horizontal: (horizontal == null)
                                              ? false
                                              : horizontal,
                                          gopage: (pageno == null) ? 0 : pageno,
                                          dir: widget.dir,
                                          fromsettings: true,
                                        )),
                              );*/
                            directory = await getExternalStorageDirectory();
                            file = File("${directory.path}/pdfsetings1.txt");
                            file1 = File("${directory.path}/pdfsetings2.txt");
                            await file.writeAsString("$nightmod");
                            await file1.writeAsString("$horizontal");
                            setState(() {
                              pdf_pagemode = horizontal;
                              pdf_nightmnnode = nightmod;
                            });
                            Navigator.pop(context);
                          },
                          child: Text("Ok"),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

/* TextField(
              decoration: InputDecoration(hintText: "page no"),
              onChanged: (value) {
                pageno = int.parse(value);
              },
            ),
            FlatButton(
              onPressed: () {},
              child: Text("Go"),
            ),
            Container(
              child: Text(
                "PDF Reader Settings",
                textAlign: TextAlign.center,
              ),
            ),
            Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text("Night Mode"),
                  Switch(
                    value: nightmod,
                    onChanged: (value) {
                      setState(() {
                        nightmod = value;
                        print(nightmod);
                      });
                    },
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Cancel"),
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Law11(
                                num: widget.num,
                                name: widget.name,
                                path: widget.path,
                                nightmod: nightmod,
                              )),
                    );
                  },
                  child: Text("Ok"),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(hintText: "page no"),
                ),
                FlatButton(
                  onPressed: () {},
                  child: Text("Go"),
                )
              ],
            ),*/
