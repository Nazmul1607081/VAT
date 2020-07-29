import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class MyFileOperation extends StatefulWidget {
  @override
  _MyFileOperationState createState() => _MyFileOperationState();
}

class _MyFileOperationState extends State<MyFileOperation> {
  Directory directory;
  File file;

  void funwrite() async {
    directory = await getExternalStorageDirectory();
    file = File("${directory.path}/file.txt");
    List<String> ls = ['a,', 'b,', 'c,', 'd,'];
    for (int i = 0; i < ls.length; i++) {
      await file.writeAsString("${ls[i]}", mode: FileMode.append);
      print(ls[i]);
    }
    print("done write");
  }

  void funread() async {
    String contents = await file.readAsString();
    print(directory.path);
    print(file.path);
    print(contents);
    List<String> contentlist = contents.split(',');
    for (int i = 0; i < contentlist.length; i++) {
      print(contentlist[i]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                color: Colors.red,
                child: Container(child: Text("Write")),
                onPressed: () {
                  funwrite();
                },
              ),
              FlatButton(
                color: Colors.red,
                child: Container(child: Text("Read")),
                onPressed: () {
                  funread();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
