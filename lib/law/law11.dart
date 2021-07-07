import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';

import 'package:vatapp/bisoyvittik/bisoyvittik.dart';

import 'package:fluttertoast/fluttertoast.dart';

import 'package:firebase_storage/firebase_storage.dart';

import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

import 'package:vatapp/constants.dart';

import 'package:vatapp/form/form.dart';
import 'package:vatapp/law/pdfsettings.dart';
import 'package:vatapp/rule/rule1.dart';
import 'package:vatapp/sro/sro.dart';

import 'package:vatapp/tofsil/tofsil1.dart';
import 'package:vatapp/tofsil/tofsil2.dart';

import 'law1.dart';

import 'package:http/http.dart' as http;

class Law11 extends StatefulWidget {
  final name;
  final num;
  final nightmod;
  final horizontal;
  final fromsettings;
  final path;
  final int gopage;
  final dir;

  const Law11(
      {Key key,
      this.name,
      this.num,
      this.nightmod,
      this.path,
      this.gopage,
      this.dir,
      this.horizontal,
      this.fromsettings})
      : super(key: key);

  @override
  _Law11State createState() => _Law11State();
}

bool pdf_nightmnnode = false;
bool pdf_pagemode = false;

class _Law11State extends State<Law11> {
  String _chashedfile;

  Directory directory;
  File file, file1;

  doPdfSettings() async {
    directory = await getExternalStorageDirectory();
    file = File("${directory.path}/pdfsetings1.txt");
    file1 = File("${directory.path}/pdfsetings2.txt");
    if (await file.exists()) {
      String contents = await file.readAsString();

      if (mounted) {
        setState(() {
          if (contents == 'true') {
            pdf_nightmnnode = true;
          } else {
            pdf_nightmnnode = false;
          }
        });
      }

      print("contents");
      print(contents);
    }
    if (await file1.exists()) {
      String contents = await file1.readAsString();
      print(contents);
      if (mounted) {
        setState(() {
          if (contents == 'true') {
            pdf_pagemode = true;
          } else {
            pdf_pagemode = false;
          }
        });
      }
    }
    print("pdf modes :");
    print(pdf_nightmnnode);
    print(pdf_pagemode);
  }

  void init() async {
    //doPdfSettings();

    navigationDir = widget.dir;

    print("after setting");
    print(widget.gopage);
    print(widget.nightmod);

    getFileFromUrl();
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<Null> getFileFromUrl() async {
    doPdfSettings();
    try {
      final Directory tempdir = Directory.systemTemp;
      final path = '${tempdir.path}${widget.dir}${widget.num}${widget.name}';

      print("path folder " + path);
      if (widget.path != null) {
        print(widget.nightmod);
        setState(() {
          _chashedfile = widget.path;
        });
      } else if (await File(path).exists()) {
        /// this is for new file size tricks..[
        if (await netCheck()) {
          print("this start for file size tricks..[");
          final StorageReference ref = FirebaseStorage.instance
              .ref()
              .child('${widget.dir}')
              .child('${widget.name}.pdf');
          String url = (await ref.getDownloadURL()).toString();
          print("url = " + url);

          ref.getMetadata().then((value) async {
            if (value.sizeBytes == File(path).lengthSync()) {
              print("contgras...");
              setState(() {
                _chashedfile = path;
              });
            } else {
              final File file = File(path);

              print("file size ");
              print(widget.dir);
              print(widget.name);
              print("file size ]");

              ///////////////////////////////////// akta slash dite hobe '/ er por
              /*final StorageReference ref =
            FirebaseStorage.instance.ref().child('${widget.link}');*/
/////////////[
              /// I should change the temp.pdf as required after all law file uploaded
              final StorageReference ref = FirebaseStorage.instance
                  .ref()
                  .child('${widget.dir}')
                  .child('${widget.name}.pdf');

              print("firestorage");
              print(widget.dir);
              print('${widget.name}.pdf');

              ////////]
              final StorageFileDownloadTask downloadTask =
                  ref.writeToFile(file);
              final int totalByte = (await downloadTask.future).totalByteCount;
              print(totalByte);

              if (mounted) {
                setState(() {
                  _chashedfile = file.path;
                  print("set file before disposed");

                  /*databaseReference
            .collection("form")
            .document("${widget.id}")
            .updateData({'file': file.toString()});*/
                });
              }
            }
          });

          final stopwatch = Stopwatch();
          stopwatch.start();

          http.Response r = await http.get(url);
          print("delaying");

          print("end file size tricks..]");

          ///]

        } else {
          setState(() {
            _chashedfile = path;
          });
        }
      } else {
        final net = await netCheck();
        if (!net) {
          Fluttertoast.showToast(
              msg: "No internet Connection",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.CENTER,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
          Navigator.pop(context);
        } else {
          final File file = File(path);

          print("file size ");
          print(widget.dir);
          print(widget.name);
          print("file size ]");

          ///////////////////////////////////// akta slash dite hobe '/ er por
          /*final StorageReference ref =
            FirebaseStorage.instance.ref().child('${widget.link}');*/
/////////////[
          /// I should change the temp.pdf as required after all law file uploaded
          final StorageReference ref = FirebaseStorage.instance
              .ref()
              .child('${widget.dir}')
              .child('${widget.name}.pdf');

          print("firestorage");
          print(widget.dir);
          print('${widget.name}.pdf');

          ////////]
          final StorageFileDownloadTask downloadTask = ref.writeToFile(file);
          final int totalByte = (await downloadTask.future).totalByteCount;
          print(totalByte);

          if (mounted) {
            setState(() {
              _chashedfile = file.path;
              print("set file before disposed");

              /*databaseReference
            .collection("form")
            .document("${widget.id}")
            .updateData({'file': file.toString()});*/
            });
          }
        }
      }

      print(" cashed " + _chashedfile.toString());
    } catch (e) {
      print(e);
      Fluttertoast.showToast(
          msg: "Something Error",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.blueAccent,
          textColor: Colors.white,
          fontSize: 16.0);
      print("dispose");

      Navigator.pop(context);
      // throw Exception("Error opening url file : ");
    }
  }

  @override
  void dispose() {
    super.dispose();

    //this method not called when user press android back button or quit
    print('dispose ok');
  }

  @override
  Widget build(BuildContext context) {
    return (_chashedfile == null)
        ? Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(Icons.keyboard_backspace),
                onPressed: () {
                  print('l' + widget.dir);

                  ///conditions to go back......................................................
                  if (widget.fromsettings == true) {
                    if (navigationDir == 'law') {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return Law1();
                      }));
                    } else if ((navigationDir == 'tofsil1') ||
                        (navigationDir == 'tofsil2') ||
                        (navigationDir == 'tofsil3')) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return Tofsil1();
                      }));
                    } else if (navigationDir == 'subject') {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return SubjectWise();
                      }));
                    } else if (navigationDir == 'tofsilB') {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return Tofsil2();
                      }));
                    } else if (navigationDir == 'sro') {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return Sro(
                          subject: 'sro',
                          title: 'এসআরও',
                        );
                      }));
                    } else if (navigationDir == 'gades') {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return Sro(
                          title: "(ক) সাধারন আদেশ",
                          subject: "gades",
                        );
                      }));
                    } else if (navigationDir == 'babostapotro') {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return Sro(
                          title: "(গ) ব্যাখ্যাপত্র",
                          subject: 'babostapotro',
                        );
                      }));
                    } else if (navigationDir == 'form') {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return MyForm(
                          subject: 'form',
                          title: 'ফরম',
                        );
                      }));
                    } else if (navigationDir == 'form2') {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return MyForm(
                          subject: 'form2',
                          title: 'ফরম',
                        );
                      }));
                    } else if (navigationDir == 'bibidho') {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return MyForm(
                          subject: 'bibidho',
                          title: 'ট্যারিফ ও অন্যান্য',
                        );
                      }));
                    } else if (navigationDir == 'sarcharge') {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return Sro(
                          subject: 'sarcharge',
                          title: 'সার চার্জ',
                        );
                      }));
                    } else if (navigationDir == 'abogari') {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return Sro(
                          subject: 'abogari',
                          title: 'আবগারী শুল্ক',
                        );
                      }));
                    } else if (navigationDir == 'tariff') {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return Sro(
                          subject: 'tariff',
                          title: 'বিবিধ',
                        );
                      }));
                    } else {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return Rule1();
                      }));
                    }
                    print("ki hosse ki");
                  } else {
                    print("pop");
                    Navigator.pop(context);
                  }
                  // Navigator.pop(context);
                },
              ),
              backgroundColor: Color(0xff056608),
              centerTitle: true,
              title: (widget.dir == 'law' || widget.dir == 'rule')
                  ? Text(
                      "(${widget.num}) ${widget.name}",
                      style: TextStyle(color: Colors.white),
                    )
                  : Text(
                      "${widget.name}",
                      style: TextStyle(color: Colors.white),
                    ),
            ),
            body: Column(
              children: <Widget>[
                /* (_source.keys.toList()[0] != ConnectivityResult.none)
                      ? Container()
                      : Container(
                          child: Text(
                            "Wifi/Data is not enabled",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          ),
                        ),*/
                Expanded(
                  flex: 1,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ],
            ),
          )
        : (widget.nightmod == null)
            ? FinalPdfView(
                path: _chashedfile,
                name: widget.name,
                num: widget.num,
                nightmod: pdf_nightmnnode,
                horizontal: pdf_pagemode,
                gopage: widget.gopage,
                dir: widget.dir,
                fromsetting: widget.fromsettings,
              )
            : FinalPdfView(
                path: _chashedfile,
                name: widget.name,
                num: widget.num,
                nightmod: pdf_nightmnnode,
                horizontal: pdf_pagemode,
                gopage: widget.gopage,
                dir: widget.dir,
                fromsetting: widget.fromsettings,
              );
  }
}

class FinalPdfView extends StatefulWidget {
  final String path;
  final name;
  final num;
  final nightmod;
  final horizontal;
  final gopage;
  final dir;
  final fromsetting;

  const FinalPdfView(
      {Key key,
      this.path,
      this.name,
      this.num,
      this.nightmod,
      this.gopage,
      this.dir,
      this.horizontal,
      this.fromsetting})
      : super(key: key);
  @override
  _FinalPdfViewState createState() => _FinalPdfViewState();
}

String navigationDir = "";

class _FinalPdfViewState extends State<FinalPdfView> {
  int _totalPages = 0;
  int _currentPage = 0;
  bool pdfReady = false;
  PDFViewController _pdfViewController;

  screenOff() async {
    await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    print("inner law11 go page");
    print(widget.gopage);
    navigationDir = widget.dir;
    print(navigationDir);
    print("n");

    screenOff();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _lastScreenOrientation = MediaQuery.of(context).orientation;
    });
  }

  Orientation _lastScreenOrientation;
  _repushViewer() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => Law11(
              name: widget.name,
              num: widget.num,
              path: null,
              gopage: 0,
              dir: widget.dir,
            )));
  }

  int fpageno = 0;
  _showMaterialDialog() {
    showDialog(
        context: context,
        builder: (_) => new AlertDialog(
              backgroundColor: Colors.black12,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              title: Text(
                'Go to the page no:',
                style: TextStyle(
                  color: Colors.green,
                ),
              ),
              content: Container(
                width: 10,
                height: 30,
                color: Colors.white,
                child: TextField(
                  onChanged: (t) {
                    fpageno = int.parse(t);
                  },
                ),
              ),
              actions: <Widget>[
                FlatButton(
                  onPressed: () =>
                      Navigator.of(context, rootNavigator: true).pop(),
                  child: Text('Cancel'),
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => Law11(
                              name: widget.name,
                              num: widget.num,
                              path: null,
                              gopage: fpageno,
                              dir: widget.dir,
                            )));
                    Navigator.of(context, rootNavigator: true).pop();
                  },
                  /*Navigator.of(context).pop(true)*/
                  child: Text('Go'),
                ),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    if (_lastScreenOrientation != null &&
        _lastScreenOrientation != MediaQuery.of(context).orientation) {
      // Completely render the page.
      Future.delayed(Duration(microseconds: 100), _repushViewer);
    }
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.keyboard_backspace),
          onPressed: () {
            // print('kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk' + widget.dir);
            ///conditions to go back2 down...............................................................................
            if (widget.fromsetting == true) {
              if (navigationDir == 'law') {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return Law1();
                }));
              } else if ((navigationDir == 'tofsil1') ||
                  (navigationDir == 'tofsil2') ||
                  (navigationDir == 'tofsil3')) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return Tofsil1();
                }));
              } else if (navigationDir == 'subject') {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return SubjectWise();
                }));
              } else if (navigationDir == 'tofsilB') {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return Tofsil2();
                }));
              } else if (navigationDir == 'sro') {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return Sro(
                    subject: 'sro',
                    title: 'এসআরও',
                  );
                }));
              } else if (navigationDir == 'gades') {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return Sro(
                    title: "(ক) সাধারন আদেশ",
                    subject: "gades",
                  );
                }));
              } else if (navigationDir == 'babostapotro') {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return Sro(
                    title: "(গ) ব্যাখ্যাপত্র",
                    subject: 'babostapotro',
                  );
                }));
              } else if (navigationDir == 'form') {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return MyForm(
                    subject: 'form',
                    title: 'ফরম',
                  );
                }));
              } else if (navigationDir == 'form2') {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return MyForm(
                    subject: 'form2',
                    title: 'ফরম',
                  );
                }));
              } else if (navigationDir == 'bibidho') {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return MyForm(
                    subject: 'bibidho',
                    title: 'আবগারী শুল্ক',
                  );
                }));
              } else if (navigationDir == 'sarcharge') {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return Sro(
                    subject: 'sarcharge',
                    title: 'সার চার্জ',
                  );
                }));
              } else if (navigationDir == 'abogari') {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return Sro(
                    subject: 'abogari',
                    title: 'বিবিধ',
                    //title: 'আবগারী শুল্ক',
                  );
                }));
              } else if (navigationDir == 'tariff') {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return Sro(
                    subject: 'tariff',
                    title: 'ট্যারিফ ও অন্যান্য',
                  );
                }));
              } else {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return Rule1();
                }));
              }
            } else {
              Navigator.pop(context);
            }
            // Navigator.pop(context);
          },
        ),
        backgroundColor: Color(0xff056608),
        title: (widget.dir == 'law' || widget.dir == 'rule')
            ? Text(
                "(${widget.num}) ${widget.name}",
                style: TextStyle(color: Colors.white),
              )
            : Text(
                "${widget.name}",
                style: TextStyle(color: Colors.white),
              ),
      ),
      body: Stack(
        children: <Widget>[
          PDFView(
            filePath: widget.path,
            autoSpacing: true,
            enableSwipe: true,
            fitEachPage: true,
            pageSnap: true,
            swipeHorizontal: pdf_pagemode,
            nightMode: pdf_nightmnnode,
            onError: (e) {
              print(e);
              Fluttertoast.showToast(
                  msg: "Something Error",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  backgroundColor: Colors.blueAccent,
                  textColor: Colors.white,
                  fontSize: 16.0);
            },
            onRender: (_pages) {
              setState(() {
                _totalPages = _pages;
                pdfReady = true;
                setState(() {
                  _pdfViewController.setPage(widget.gopage);
                });
              });
            },
            onViewCreated: (PDFViewController vc) {
              _pdfViewController = vc;
              //print("onview created " + widget.gopage);
            },
            onPageChanged: (int page, int total) {
              setState(() {
                _currentPage = page;
              });
            },
            onPageError: (page, e) {},
          ),
          !pdfReady
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Offstage()
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          /*Container(
            height: 40,
            width: 60,
            child: TextField(
              onChanged: (value) {
                setState(() {
                  gotopage = int.parse(value);
                });
              },
              decoration: InputDecoration(hintText: "Page no"),
            ),
          ),
          FloatingActionButton.extended(
            backgroundColor: Colors.red,
            label: Text("$gotopage"),
            onPressed: () {
              _pdfViewController.setPage(gotopage);
            },
          ),*/
          FloatingActionButton.extended(
            backgroundColor: Colors.red,
            label: Text("${_currentPage + 1}/${_totalPages}"),
            onPressed: () {
              _showMaterialDialog();
              /* _pdfViewController.setPage(_currentPage);*/
            },
          )
        ],
      ),
    );
  }
}

/*PopupMenuButton<int>(
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text("Night Mode"),
                    Switch(
                      value: nightmode ,
                      onChanged: (value) {
                        setState(() {
                          nightmode = value;
                          print(nightmode);
                        });
                      },
                      activeTrackColor: Colors.lightGreenAccent,
                      activeColor: Colors.green,
                    ),
                  ],
                ),
              ),
              PopupMenuItem(
                value: 2,
                child: Text("Second"),
              ),
            ],
          )*/
