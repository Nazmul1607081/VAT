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

final databaseReference = Firestore.instance;

class LoadingPdf extends StatefulWidget {
  final link;
  final title;
  final id;
  final loc;
  final sub;

  const LoadingPdf(
      {Key key, this.link, this.title, this.id, this.loc, this.sub})
      : super(key: key);
  @override
  _LoadingPdfState createState() => _LoadingPdfState();
}

class _LoadingPdfState extends State<LoadingPdf> {
  String _chashedfile;
  @override
  void initState() {
    super.initState();
    /* if (widget.loc == null) {
      print("if");*/
    getFileFromUrl();
    /*} else {
      setState(() {
        _chashedfile = widget.loc;
      });
      print("else");
      print(_chashedfile);
    }*/
  }

  Future<Null> getFileFromUrl() async {
    try {
      final Directory tempdir = Directory.systemTemp;
      final path = '${tempdir.path}${widget.link}';

      print("path folder " + path);

      if (await File(path).exists()) {
        setState(() {
          _chashedfile = path;
        });
      } else {
        final File file = File(path);

        print("file size ");

        print("file size ]");

        ///////////////////////////////////// akta slash dite hobe '/ er por
        /*final StorageReference ref =
            FirebaseStorage.instance.ref().child('${widget.link}');*/
/////////////[

        final StorageReference ref = FirebaseStorage.instance
            .ref()
            .child('${widget.sub}')
            .child('${widget.link}');

        ////////]
        final StorageFileDownloadTask downloadTask = ref.writeToFile(file);
        final int totalByte = (await downloadTask.future).totalByteCount;
        print(totalByte);
        print(widget.id);

        setState(() {
          _chashedfile = file.path;

          /*databaseReference
            .collection("form")
            .document("${widget.id}")
            .updateData({'file': file.toString()});*/
        });
      }

      print(" chashed " + _chashedfile.toString());
    } catch (e) {
      throw Exception("Error opening url file");
    }
  }

  @override
  Widget build(BuildContext context) {
    return (_chashedfile == null)
        ? MaterialApp(
            home: Scaffold(
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
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          )
        : PdfViewPage(
            path: _chashedfile,
          );
  }
}

/*Future<void> getpdfurl() {
    final databaseReference = Firestore.instance;

    databaseReference
        .collection("${widget.link}")
        .getDocuments()
        .then((QuerySnapshot snapshot) {
      snapshot.documents.forEach((f) {
        print('${f.data}}');
        pdfurl = f.data['link'];
        print(f.data['link']);
        getFileFromUrl(pdfurl).then((f) {
          setState(() {
            urlPDFPath = f.path;
            print("lllllllllllllllllllllllllllll " + urlPDFPath);
          });
        });
      });
    });
  }*/
