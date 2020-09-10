import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vatapp/components/appbar.dart';
import 'package:vatapp/components/dowenloader.dart';
import 'package:vatapp/components/gridview.dart';
import 'package:vatapp/components/loadingpdf.dart';
import 'package:vatapp/components/mydrawer.dart';
import 'package:vatapp/components/onepdf.dart';
import 'package:vatapp/law/law1.dart';
import 'package:vatapp/constants.dart';
import 'package:vatapp/law/law11.dart';
import 'package:vatapp/law/orthoain.dart';
import 'package:vatapp/pages/homepage.dart';
import 'package:vatapp/sro/sro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:open_file/open_file.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:dio/dio.dart';

import 'package:firebase_storage/firebase_storage.dart';

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:http/http.dart' as http;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vatapp/tofsil/tofsil1.dart';
import 'package:vatapp/tofsil/tofsil2.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyForm extends StatefulWidget {
  final subject;
  final title;

  const MyForm({Key key, this.subject, this.title}) : super(key: key);
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  @override
  void initState() {
    super.initState();
  }

  String urlPDFPath = "";

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
          "${widget.title}",
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
        child: MyFormBody(
          subject: widget.subject,
        ),
      ),
    );
  }
}

class MyFormBody extends StatefulWidget {
  final subject;

  const MyFormBody({Key key, this.subject}) : super(key: key);
  @override
  _MyFormBodyBodyState createState() => _MyFormBodyBodyState();
}

class _MyFormBodyBodyState extends State<MyFormBody> {
  @override
  void initState() {
    super.initState();
  }

  /*Future<File> getFileFromUrl() async {
    try {
      final Directory tempdir = Directory.systemTemp;
      final File file = File('${tempdir.path}/${widget.link}');

      final StorageReference ref =
          FirebaseStorage.instance.ref().child('/${widget.link}');
      final StorageFileDownloadTask downloadTask = ref.writeToFile(file);
      final int totalByte = (await downloadTask.future).totalByteCount;
      print(totalByte);

      return file;

      print(" chashed " + file.toString());
    } catch (e) {
      throw Exception("Error opening url file");
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        //color: Color(0xff056608),
        image: DecorationImage(
          image: backgroundimage,
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
                print("inside form ${widget.subject}");

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
                          // print(document.documentID);
                          return MyForrmView(
                            title: document['title'],
                            sub: "${widget.subject}",
                            num: document['no'],
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

class MyForrmView extends StatefulWidget {
  final title;
  final loc;
  final sub;
  final num;
  final searchSuggestion;
  final word1;

  const MyForrmView(
      {Key key,
      this.title,
      this.loc,
      this.sub,
      this.num,
      this.searchSuggestion,
      this.word1})
      : super(key: key);

  @override
  _MyForrmViewState createState() => _MyForrmViewState();
}

class _MyForrmViewState extends State<MyForrmView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  int downloading = 0;
  String downloadpath;

  String progressString = 'waiting...';
  String progressString1 = '0.0';

  Future<void> startDownloading() async {
    final wt = (widget.searchSuggestion == null) ? widget.title : widget.word1;
    final Directory tempdir = await getExternalStorageDirectory();
    var path = '${tempdir.path}/${widget.sub}${wt}.pdf';
    if (widget.sub == 'tariff') {
      print("tarif type");
      path = '${tempdir.path}/${widget.sub}${wt}';
    }

    if (path != null) {
      if (mounted) {
        setState(() {
          downloadpath = path;
          print(downloadpath + " this the download path 1");
        });

        if (await File(path).exists()) {
          print("file length ");
          print(File(path).lengthSync());
          if (mounted) {
            setState(() {
              downloadpath = path;
              downloading = 2;
            });
            setState(() {
              progressString1 = '1';
            });
          }
        } else {
          try {
            if (mounted) {
              print("file length else");
              //print(File(path).lengthSync());

              var url;
              if (widget.sub != 'tariff') {
                url = await FirebaseStorage.instance
                    .ref()
                    .child("${widget.sub}")
                    .child("${wt}.pdf")
                    .getDownloadURL();
              } else {
                url = await FirebaseStorage.instance
                    .ref()
                    .child("${widget.sub}")
                    .child("${wt}")
                    .getDownloadURL();
              }

              print(url.toString());

              Dio dio = Dio();
              dio.download(url.toString(), path,
                  onReceiveProgress: (rec, total) {
                if (mounted) {
                  setState(() {
                    print(total);
                    progressString =
                        ((rec / total) * 100).toStringAsFixed(0) + "%";
                    progressString1 = ((rec / total)).toString();
                    print(progressString);
                  });
                }

                if (progressString == '100%') {
                  if (mounted) {
                    setState(() {
                      downloading = 2;
                      progressString = "Completed";
                    });
                    print("Download completed");
                  }
                }
              });
            }
          } catch (e) {
            print(e);
            Fluttertoast.showToast(
                msg: "Something Error",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                backgroundColor: Colors.blueAccent,
                textColor: Colors.white,
                fontSize: 16.0);
            if (mounted) {
              setState(() {
                downloading = 0;
              });
            }
            //print("dispose");
          }
        }
      }

      /*final StorageFileDownloadTask downloadTask = ref.writeToFile(file);
    final int totalByte = (await downloadTask.future).totalByteCount;
    print(totalByte);  for dio add..*/

      if (mounted) {
        setState(() {
          downloadpath = path;
          print(downloadpath + " this the download path");
        });
      }
    }
  }

  @override
  void dispose() {
    super.dispose();

    //this method not called when user press android back button or quit
    //print('disposed ok');
  }

  Future<void> openFile() async {
    final filePath = downloadpath;
    print(downloadpath);
    final result = await OpenFile.open(filePath);
    print(result.message);
    Scaffold.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.red,
      content: Text(
        "${result.message}\nYou can find downloaded file here :$downloadpath ",
        style: TextStyle(color: Colors.white),
      ),
    ));
    print("file open");
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Container(
          height: 40,
          width: 40,
          padding: EdgeInsets.all(0),
          margin: EdgeInsets.all(0),
          child: Image.asset('images/pdf.png'),
        ),
        title: RichText(
          text: new TextSpan(
            style: new TextStyle(
              fontSize: 14.0,
              color: Colors.black,
            ),
            children: (widget.searchSuggestion != null)
                ? widget.title
                : <TextSpan>[
                    new TextSpan(
                        text: 'Title : ',
                        style: new TextStyle(fontWeight: FontWeight.bold)),
                    new TextSpan(
                        text: '${widget.title}', style: new TextStyle()),
                  ],
          ),
        ),
        subtitle: Container(
          padding: EdgeInsets.all(0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: (widget.sub != 'tariff')
                    ? MainAxisAlignment.spaceBetween
                    : MainAxisAlignment.start,
                children: <Widget>[
                  (widget.sub != 'tariff')
                      ? Container(
                          child: RaisedButton(
                            color: Color(0xff056608),
                            child: Row(
                              children: <Widget>[
                                Icon(Icons.picture_as_pdf),
                                Text(
                                  "View",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                            onPressed: () {

                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return Law11(
                                    name: (widget.searchSuggestion == null)
                                        ? widget.title
                                        : widget.word1,
                                    num: widget.num,
                                    path: null,
                                    gopage: 0,
                                    dir: widget.sub,
                                  );
                                }));

                            },
                          ),
                        )
                      : Container(),
                  Container(
                    child: RaisedButton(
                      color: Color(0xff056608),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.file_download),
                          Text(
                            "Download",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      onPressed: () {
                        setState(() {
                          downloading = 1;
                          startDownloading();
                        });
                      },
                    ),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  (downloading == 1 && downloading != 0)

                      ///last modification
                      ? Row(
                          children: <Widget>[
                            Container(
                              width: 80,
                              child: LinearProgressIndicator(
                                value: double.parse(progressString1),
                              ),
                            ),
                            Text("$progressString"),
                          ],
                        )
                      : (downloading == 2)
                          ? RaisedButton(
                              color: Color(0xff056608),
                              onPressed: () {
                                openFile();
                              },
                              child: Row(
                                children: <Widget>[
                                  ImageIcon(
                                    AssetImage('images/open_book.png'),
                                    color: Colors.black,
                                  ),
                                  Text(
                                    "Open",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : Container()
                ],
              )
            ],
          ),
        ),
        isThreeLine: true,
      ),
    );
  }
}
