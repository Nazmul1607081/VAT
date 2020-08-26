import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:math';
import 'package:string_validator/string_validator.dart';
import 'package:vatapp/form/form.dart';
import 'package:vatapp/law/law11.dart';
import 'package:vatapp/sro/mypdfview.dart';

class MySearchItem {
  String title;
  String date;
  String description;
  String num;
  String dir;
  String type;
}

List<MySearchItem> searchList = [];
List<MySearchItem> searchList1 = [];

/*return MyPdfView(
                            title: document['title'],
                            date: document['date'],
                            description: document['description'],
                            num: document['no'],
                            sub: "${widget.subject}",
                          );*/

/*void funwrite(String str) async {
  directory = await getExternalStorageDirectory();
  file = File("${directory.path}/file.txt");

  await file.writeAsString("$str,", mode: FileMode.append);
  print(str);

  print("done write");
}

void funread() async {
  if (await File("${directory.path}/file.txt").exists()) {
    String contents = await file.readAsString();
    print(directory.path);
    print(file.path);
    print(contents);
    List<String> contentlist = contents.split(',');
    for (int i = 0; i < contentlist.length; i++) {
      print(contentlist[i]);
      var temp = new MySearchItem();
      temp.title = contentlist[i];
      temp.num = "";
      temp.dir = "";
      temp.type = "";
      searchList1.add(temp);
    }
  }
}*/

class MySearch extends StatefulWidget {
  @override
  _MySearchState createState() => _MySearchState();
}

class _MySearchState extends State<MySearch> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //funread();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("pressed search");
        showSearch(context: context, delegate: DataSearch());
      },
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
                child: Row(
              children: <Widget>[
                SizedBox(
                  width: 15,
                ),
                Image.asset('images/logo2.png'),
                SizedBox(
                  width: 15,
                ),
                Text("Search here..."),
              ],
            )),
          ),
          Container(
              alignment: Alignment.topRight,
              child: IconButton(
                padding: EdgeInsets.only(bottom: 0),
                icon: Icon(Icons.search),
                onPressed: () {
                  print("pressed search");
                  showSearch(context: context, delegate: DataSearch());
                },
              )),
        ],
      ),
    );
  }
}

class DataSearch extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    print("buildActions Called");
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    print("buildLeading Called");
    IconButton(
      icon: AnimatedIcon(
        progress: transitionAnimation,
        icon: AnimatedIcons.menu_arrow,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    var temp = new MySearchItem();
    temp.title = query;
    temp.num = "";
    temp.dir = "";
    temp.type = "";
    if (query.isNotEmpty) {
      bool f = true;
      for (int i = 0; i < searchList1.length; i++) {
        if (searchList1[i].title == query) {
          f = false;
        }
      }
      if (f) {
        searchList1.add(temp);
      }
    }
    // funwrite(query);
    final suggessionList = query.isEmpty
        ? searchList
        : searchList
            .where((element) =>
                (contains(element.description.toString(), query) ||
                    contains(element.title.toString(), query)))
            .toList();

    print(suggessionList.runtimeType);
    print("type");

    return ListView.builder(
        itemCount: suggessionList.length,
        itemBuilder: (context, index) {
          if (suggessionList[index].type == 'আইন') {
            return Card(
              child: Container(
                padding: EdgeInsets.only(left: 20),
                child: ListTile(
                  contentPadding: EdgeInsets.all(0),
                  onTap: () {
                    ///new add[

                    ///]
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return Law11(
                        name: suggessionList[index].title,
                        num: suggessionList[index].num,
                        path: null,
                        gopage: 0,
                        dir: suggessionList[index].dir,
                      );
                    }));
                  },
                  dense: true,
                  title: Container(
                    padding: EdgeInsets.all(0),
                    child: Text(
                      "আইনঃ ${suggessionList[index].num} । ${suggessionList[index].title}",
                      style: TextStyle(
                          fontSize: 26,
                          color: Colors.black,
                          fontFamily: 'Shobuj Nolua'),
                    ),
                  ),
                ),
              ),
            );
          } else if (suggessionList[index].type == 'বিধিমালা') {
            return Card(
              child: Container(
                padding: EdgeInsets.only(left: 20),
                child: ListTile(
                  contentPadding: EdgeInsets.all(0),
                  onTap: () {
                    ///new add[

                    ///]
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return Law11(
                        name: suggessionList[index].title,
                        num: suggessionList[index].num,
                        path: null,
                        gopage: 0,
                        dir: suggessionList[index].dir,
                      );
                    }));
                  },
                  dense: true,
                  title: Container(
                    padding: EdgeInsets.all(0),
                    child: Text(
                      "বিধিমালাঃ ${suggessionList[index].num} । ${suggessionList[index].title}",
                      style: TextStyle(
                          fontSize: 26,
                          color: Colors.black,
                          fontFamily: 'Shobuj Nolua'),
                    ),
                  ),
                ),
              ),
            );
          } else {
            if (suggessionList[index].type == 'sro') {
              ///new add[

              ///]
              return MyPdfView(
                title: suggessionList[index].title,
                date: suggessionList[index].date,
                description: suggessionList[index].description,
                num: suggessionList[index].num,
                sub: suggessionList[index].dir,
              );
            } else {
              ///new add[

              ///]
              return MyForrmView(
                title: suggessionList[index].title,
                sub: suggessionList[index].dir,
                num: suggessionList[index].num,
              );
            }
          }
        });
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // funread();
    final suggessionList = query.isEmpty
        ? searchList1
        : searchList
            .where((element) =>
                (contains(element.description.toString(), query) ||
                    contains(element.title.toString(), query) ||
                    ((element.type.toString() == 'আইন') &&
                        contains(element.type.toString(), query)) ||
                    ((element.type.toString() == 'বিধিমালা') &&
                        contains(element.type.toString(), query))))
            .toList();
    if (query.isEmpty) {
      print("empty");
      print(suggessionList.length);
      return ListView.builder(
        itemCount: suggessionList.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              onTap: () {
                query = searchList1[index].title;
                // File("${directory.path}/file.txt").delete();

                buildResults(context);
              },
              title: Text("${suggessionList[index].title}"),
              trailing: IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  searchList1.removeAt(index);

                  showSearch(context: context, delegate: DataSearch());
                },
              ),
            ),
          );
        },
      );
    }

    return ListView.builder(
        itemCount: suggessionList.length,
        itemBuilder: (context, index) {
          if (suggessionList[index].type == 'আইন') {
            List<TextSpan> textSpanList1 = [];

            String word1 = 'আইনঃ ' +
                suggessionList[index].num.toString() +
                " । " +
                suggessionList[index].title.toString();
            print(word1);
            print("this is world 1");
            List<String> tempList1 = word1.length > 1 &&
                    word1.indexOf(query) != -1 &&
                    query.length > 0
                ? word1.split(query)
                : [word1, ''];
            int i = 0;
            print(tempList1);
            print("length of templist" + tempList1.length.toString());
            tempList1.forEach((element) {
              print("element " + element);
              if (word1.indexOf(query) != -1 && i < tempList1.length - 1) {
                textSpanList1.add(TextSpan(
                  text: "${element}",
                ));
                textSpanList1.add(TextSpan(
                  text: "${query}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    background: Paint()..color = Colors.yellow,
                  ),
                ));
                print(textSpanList1);
                print("query added");
              } else {
                print("else " + element);
                textSpanList1.add(TextSpan(
                  text: "${element}",
                ));
              }
              i++;
            });
            return Card(
              elevation: 5,
              child: Container(
                padding: EdgeInsets.only(left: 20),
                child: ListTile(
                  onTap: () {
                    ///very new add[

                    ///]
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return Law11(
                        name: suggessionList[index].title,
                        num: suggessionList[index].num,
                        path: null,
                        gopage: 0,
                        dir: suggessionList[index].dir,
                      );
                    }));
                  },
                  contentPadding: EdgeInsets.all(0),
                  dense: true,
                  title: Container(
                    padding: EdgeInsets.all(0),
                    child: RichText(
                      text: TextSpan(
                        style: new TextStyle(
                            fontSize: 26,
                            color: Colors.black,
                            fontFamily: 'Shobuj Nolua'),
                        children: textSpanList1,
                      ),
                    ),
                  ),
                ),
              ),
            );
          }
          if (suggessionList[index].type == 'বিধিমালা') {
            List<TextSpan> textSpanList1 = [];

            String word1 = 'বিধিমালাঃ ' +
                suggessionList[index].num.toString() +
                " । " +
                suggessionList[index].title.toString();
            print(word1);
            print("this is world 1");
            List<String> tempList1 = word1.length > 1 &&
                    word1.indexOf(query) != -1 &&
                    query.length > 0
                ? word1.split(query)
                : [word1, ''];
            int i = 0;
            print(tempList1);
            print("length of templist" + tempList1.length.toString());
            tempList1.forEach((element) {
              print("element " + element);
              if (word1.indexOf(query) != -1 && i < tempList1.length - 1) {
                textSpanList1.add(TextSpan(
                  text: "${element}",
                ));
                textSpanList1.add(TextSpan(
                  text: "${query}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    background: Paint()..color = Colors.yellow,
                  ),
                ));
                print(textSpanList1);
                print("query added");
              } else {
                print("else " + element);
                textSpanList1.add(TextSpan(
                  text: "${element}",
                ));
              }
              i++;
            });

            return Card(
              elevation: 5,
              child: Container(
                padding: EdgeInsets.only(left: 20),
                child: ListTile(
                  onTap: () {
                    /// very new add[

                    ///]
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return Law11(
                        name: suggessionList[index].title,
                        num: suggessionList[index].num,
                        path: null,
                        gopage: 0,
                        dir: suggessionList[index].dir,
                      );
                    }));
                  },
                  contentPadding: EdgeInsets.all(0),
                  dense: true,
                  title: Container(
                    padding: EdgeInsets.all(0),
                    child: RichText(
                      text: TextSpan(
                        style: new TextStyle(
                            fontSize: 26,
                            color: Colors.black,
                            fontFamily: 'Shobuj Nolua'),
                        children: textSpanList1,
                      ),
                    ),
                  ),
                ),
              ),
            );
          }

          ///upore ain bidhe ase...
          else if (suggessionList[index].type == 'sro') {
            List<TextSpan> textSpanList = [];
            List<TextSpan> textSpanList1 = [];
            textSpanList.add(
              TextSpan(
                  text: "Description :",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  )),
            );
            textSpanList1.add(
              TextSpan(
                  text: "Title :",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  )),
            );
            String word = suggessionList[index].description.toString();
            String word1 = suggessionList[index].title.toString();
            print(word1);
            print("this is world 1");
            List<String> tempList =
                word.length > 1 && word.indexOf(query) != -1 && query.length > 0
                    ? word.split(query)
                    : [word, ' '];
            List<String> tempList1 = word1.length > 1 &&
                    word1.indexOf(query) != -1 &&
                    query.length > 0
                ? word1.split(query)
                : [word1, ' '];

            int i = 0;
            tempList.forEach((element) {
              print(element);
              if (word.indexOf(query) != -1 && i < tempList.length - 1) {
                textSpanList.add(TextSpan(
                  text: "${element}",
                ));
                textSpanList.add(TextSpan(
                  text: "${query}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    background: Paint()..color = Colors.yellow,
                  ),
                ));
              } else {
                textSpanList.add(TextSpan(
                  text: "${element}",
                ));
              }
              i++;
            });
            i = 0;
            tempList1.forEach((element) {
              print(element);
              if (word1.indexOf(query) != -1 && i < tempList1.length - 1) {
                textSpanList1.add(TextSpan(
                  text: "${element}",
                ));
                textSpanList1.add(TextSpan(
                  text: "${query}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    background: Paint()..color = Colors.yellow,
                  ),
                ));
              } else {
                textSpanList1.add(TextSpan(
                  text: "${element}",
                ));
              }
              i++;
            });

            return MyPdfView(
              title: textSpanList1,
              date: suggessionList[index].date,
              description: textSpanList,
              /*suggessionList[index].description*/
              num: suggessionList[index].num,
              sub: suggessionList[index].dir,
              searchSuggestion: true,
              word1: word1,
              word: word,
            );
          } else {
            List<TextSpan> textSpanList1 = [];
            textSpanList1.add(
              TextSpan(
                  text: "Title :",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  )),
            );
            String word1 = suggessionList[index].title.toString();
            print(word1);
            print("this is world 1");
            List<String> tempList1 = word1.length > 1 &&
                    word1.indexOf(query) != -1 &&
                    query.length > 0
                ? word1.split(query)
                : [word1, ' '];

            int i = 0;
            tempList1.forEach((element) {
              print(element);
              if (word1.indexOf(query) != -1 && i < tempList1.length - 1) {
                textSpanList1.add(TextSpan(
                  text: "${element}",
                ));
                textSpanList1.add(TextSpan(
                  text: "${query}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    background: Paint()..color = Colors.yellow,
                  ),
                ));
              } else {
                textSpanList1.add(TextSpan(
                  text: "${element}",
                ));
              }
              i++;
            });
            return MyForrmView(
              title: textSpanList1,
              num: suggessionList[index].num,
              sub: suggessionList[index].dir,
              searchSuggestion: true,
              word1: word1,
            );
          }
        });
  }
}

/*Law11(
            name: suggessionList[index],
            num: "",
            path: null,
            gopage: 0,
            dir: 'sro',
          );*/
