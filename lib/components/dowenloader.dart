import 'package:flutter/material.dart';
import 'dart:async';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:http/http.dart' as http;
import 'package:vatapp/components/onepdf.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:open_file/open_file.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:dio/dio.dart';

final databaseReference = Firestore.instance;

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String downloadpath;
  String _openResult = 'Unknown';

  bool downloading = true;
  var progressString = "";

  init() async {
    //final Directory tempdir = Directory.systemTemp;

    print("atart temp");
    final Directory tempdir = await getExternalStorageDirectory();

    print(" temp " + tempdir.toString());
    final path = '${tempdir.path}/temp.pdf';

    final File file = File(path);

    final StorageReference ref =
        FirebaseStorage.instance.ref().child('temp.pdf');
    final url =
        await FirebaseStorage.instance.ref().child('temp.pdf').getDownloadURL();

    print(url.toString());
    Dio dio = Dio();
    dio.download(url.toString(), path, onReceiveProgress: (rec, total) {
      print("Rec: $rec , Total: $total");

      setState(() {
        downloading = true;
        progressString = ((rec / total) * 100).toStringAsFixed(0) + "%";
        print(progressString);
      });

      if (progressString == '100%') {
        setState(() {
          downloading = false;
          progressString = "Completed";
        });
        print("Download completed");
      }
    });

    /*final StorageFileDownloadTask downloadTask = ref.writeToFile(file);
    final int totalByte = (await downloadTask.future).totalByteCount;
    print(totalByte);  for dio add..*/

    setState(() {
      downloadpath = path;
      print(downloadpath + " this the download path");
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    init();
  }

  Future<void> openFile() async {
    final filePath = downloadpath;
    final result = await OpenFile.open(filePath);

    setState(() {
      _openResult = "type=${result.type}  message=${result.message}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return (downloading)
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('open result: $_openResult\n'),
                FlatButton(
                  child: Text('Tap to open file'),
                  onPressed: openFile,
                ),
              ],
            ),
          );
  }
}

/*return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          leading: IconButton(
            icon: Icon(Icons.keyboard_backspace),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text('Plugin example app'),
        ),
        body: (downloading)
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('open result: $_openResult\n'),
                    FlatButton(
                      child: Text('Tap to open file'),
                      onPressed: openFile,
                    ),
                  ],
                ),
              ),
      ),
    );*/
