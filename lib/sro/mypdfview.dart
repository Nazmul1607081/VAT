import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vatapp/components/loadingpdf.dart';

import 'package:vatapp/components/search.dart';
import 'package:vatapp/law/law11.dart';
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
import 'package:vatapp/law/orthoain.dart';
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

class MyPdfView extends StatefulWidget {
  final title;
  final date;
  final description;
  final sub;
  final num;
  final searchSuggestion;
  final word;
  final word1;

  const MyPdfView(
      {Key key,
      this.title,
      this.date,
      this.description,
      this.sub,
      this.num,
      this.searchSuggestion,
      this.word,
      this.word1})
      : super(key: key);

  @override
  _MyPdfViewState createState() => _MyPdfViewState();
}

class _MyPdfViewState extends State<MyPdfView> {
  int downloading = 0;
  String downloadpath;

  String progressString = "waiting...";
  String progressString1 = '0.0';

  Future<void> startDownloading() async {
    var link = widget.title;
    if (widget.sub == 'sro' ||
        widget.sub == 'babostapotro' ||
        widget.sub == 'gades' ||
        widget.sub == 'sades' ||
        widget.sub == 'sarcharge') {
      link = widget.description;
    }
    print("link");
    print(link);
    final Directory tempdir = await getExternalStorageDirectory();
    final path = '${tempdir.path}/${widget.sub}$link.pdf';

    if (path != null) {
      if (mounted) {
        setState(() {
          downloadpath = path;
          print(downloadpath + " this the download path 1");
        });
      }

      if (await File(path).exists()) {
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
            final url = await FirebaseStorage.instance
                .ref()
                .child("${widget.sub}")
                .child("$link.pdf")
                .getDownloadURL();

            print(url.toString());
            Dio dio = Dio();
            dio.download(url.toString(), path, onReceiveProgress: (rec, total) {
              if (mounted) {
                setState(() {
                  progressString =
                      ((rec / total) * 100).toStringAsFixed(0) + "%";
                  progressString1 = ((rec / total)).toString();
                  print(progressString1);
                });
              }

              if (progressString == '100%') {
                if (mounted) {
                  setState(() {
                    downloading = 2;
                    progressString = "Completed";
                  });
                }
                print("Download completed");
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

  Future<void> openFile() async {
    final filePath = downloadpath;
    print(downloadpath);
    final result = await OpenFile.open(filePath);
    print(result.message);
    print("fileopen");
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
              Container(
                alignment: Alignment.centerLeft,
                child: RichText(
                  text: new TextSpan(
                    style: new TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      new TextSpan(
                          text: 'Date : ',
                          style: new TextStyle(fontWeight: FontWeight.bold)),
                      new TextSpan(
                        text: '${widget.date}',
                        style: new TextStyle(),
                      ),
                    ],
                  ),
                ),
              ),
              RichText(
                text: new TextSpan(
                  style: new TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                  ),
                  children: (widget.searchSuggestion != null)
                      ? widget.description
                      : <TextSpan>[
                          new TextSpan(
                              text: 'Description : ',
                              style:
                                  new TextStyle(fontWeight: FontWeight.bold)),
                          new TextSpan(
                              text: '${widget.description}',
                              style: new TextStyle()),
                        ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: RaisedButton(
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.picture_as_pdf),
                          Text(
                            "View",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      color: Color(0xff056608),
                      onPressed: () {
                        var link = (widget.searchSuggestion == null)
                            ? widget.title
                            : widget.word1;
                        if (widget.sub == 'sro' ||
                            widget.sub == 'babostapotro' ||
                            widget.sub == 'gades' ||
                            widget.sub == 'sades' ||
                            widget.sub == 'sarcharge') {
                          ///here word is description..
                          link = (widget.searchSuggestion == null)
                              ? widget.description
                              : widget.word;
                        }
                        print("link");
                        print(link);

                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return Law11(
                            name: link,
                            num: widget.num,
                            path: null,
                            gopage: 0,
                            dir: widget.sub,
                          );
                        }));
                      },
                    ),
                  ),
                  Container(
                    child: RaisedButton(
                      color: Color(0xff056608),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.file_download),
                          Text(
                            "Download",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      onPressed: () {
                        if (widget.searchSuggestion == null) {
                          setState(() {
                            downloading = 1;
                            startDownloading();
                          });
                        }
                      },
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  (downloading == 1 && downloading != 0)
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
