import 'package:flutter/material.dart';
import 'package:vatapp/components/mydrawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vatapp/components/webview.dart';
import '../constants.dart';

class ImportLink extends StatefulWidget {
  @override
  _ImportLinkState createState() => _ImportLinkState();
}

class _ImportLinkState extends State<ImportLink> {
  @override
  void initState() {
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
        title: Text(
          'গুরুত্বপূর্ণ লিংক',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ImportantLinkBody(),
    );
  }
}

class ImportantLinkBody extends StatefulWidget {
  @override
  _ImportantLinkBodyState createState() => _ImportantLinkBodyState();
}

class _ImportantLinkBodyState extends State<ImportantLinkBody> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
      child: ListView(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          StreamBuilder<QuerySnapshot>(
            //stream: Firestore.instance.collection('sro').snapshots(),
            stream: Firestore.instance
                .collection("link")
                .orderBy('no', descending: false)
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
                        return MyLinkButton(
                          title: document['title'],
                          link: document['link'],
                        );
                      });
              }
            },
          ),
          SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}

class MyLinkButton extends StatefulWidget {
  final title;
  final link;

  const MyLinkButton({Key key, this.title, this.link}) : super(key: key);
  @override
  _MyLinkButtonState createState() => _MyLinkButtonState();
}

class _MyLinkButtonState extends State<MyLinkButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: RaisedButton(
        elevation: 10,
        //color: Color(0xC5C5C7),
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
          //side: BorderSide(color: Colors.red),
        ),
        onPressed: () {
          print("mat pressed");
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) {
            return MyWebView(
              title: "${widget.title}",
              selectedUrl: '${widget.link}',
            );
          }));
        },
        child: Text(
          "${widget.title}",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Shobuj Nolua',
            fontSize: 22,
          ),
        ),
      ),
    );
  }
}

/*///1
          Container(
            height: 60,
            margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: RaisedButton(
              elevation: 10,
              //color: Color(0xC5C5C7),
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                //side: BorderSide(color: Colors.red),
              ),
              onPressed: () {
                print("mat pressed");
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return MyWebView(
                    title: "অনলাইন ভ্যাট রেজিস্ট্রেশন এবং দাখিলপত্র পেশ",
                    selectedUrl:
                        'https://www.vat.gov.bd/sap/bc/ui5_ui5/sap/zmcf_pri/index.html#/Welcome',
                  );
                }));
              },
              child: Text(
                "অনলাইন ভ্যাট রেজিস্ট্রেশন এবং দাখিলপত্র পেশ",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Shobuj Nolua',
                  fontSize: 22,
                ),
              ),
            ),
          ),

          ///2
          Container(
            height: 60,
            margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: RaisedButton(
              elevation: 10,
              //color: Color(0xC5C5C7),
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                //side: BorderSide(color: Colors.red),
              ),
              onPressed: () {
                print("mat pressed");
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return MyWebView(
                    title: "জাতীয় রাজস্ব বোর্ডের ঠিকানা",
                    selectedUrl: 'http://nbr.gov.bd/',
                  );
                }));
              },
              child: Text(
                "জাতীয় রাজস্ব বোর্ডের ঠিকানা",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Shobuj Nolua',
                  fontSize: 22,
                ),
              ),
            ),
          ),

          ///3
          Container(
            height: 60,
            margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: RaisedButton(
              elevation: 10,
              //color: Color(0xC5C5C7),
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                //side: BorderSide(color: Colors.red),
              ),
              onPressed: () {
                print("mat pressed");
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return MyWebView(
                    title: "জাতীয় রাজস্ব বোর্ডের অধীন কাস্টমস উইং",
                    selectedUrl: 'http://customs.gov.bd/index.jsf',
                  );
                }));
              },
              child: Text(
                "জাতীয় রাজস্ব বোর্ডের অধীন কাস্টমস উইং",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Shobuj Nolua',
                  fontSize: 22,
                ),
              ),
            ),
          ),
          Container(
            height: 60,
            margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: RaisedButton(
              elevation: 10,
              //color: Color(0xC5C5C7),
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                //side: BorderSide(color: Colors.red),
              ),
              onPressed: () {
                print("mat pressed");
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return MyWebView(
                    title: "জাতীয় রাজস্ব বোর্ড হতে ভ্যাট ই-লার্নিং",
                    selectedUrl: 'http://nbrelearning.gov.bd/',
                  );
                }));
              },
              child: Text(
                "জাতীয় রাজস্ব বোর্ড হতে ভ্যাট ই-লার্নিং",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Shobuj Nolua',
                  fontSize: 22,
                ),
              ),
            ),
          ),

          ///4
          Container(
            height: 60,
            margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: RaisedButton(
              elevation: 10,
              //color: Color(0xC5C5C7),
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                //side: BorderSide(color: Colors.red),
              ),
              onPressed: () {
                print("mat pressed");
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return MyWebView(
                    title: "কোন প্রতিষ্ঠানের আমদানি-রপ্তানি তথ্য",
                    selectedUrl:
                        'http://bidr.customs.gov.bd:9704/analytics/saw.dll?Dashboard&PortalPath=%2Fusers%2Fbireports%2F_portal&Page=Import%20By%20BIN&P1=dashboard&Action=Navigate&ViewState=pm34mtcnrvc7m964unv9011rjq&P16=NavRuleDefault&NavFromViewID=d%3Adashboard~p%3A3rilnd4p4sl36v93',
                  );
                }));
              },
              child: Text(
                "কোন প্রতিষ্ঠানের আমদানি-রপ্তানি তথ্য",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Shobuj Nolua',
                  fontSize: 22,
                ),
              ),
            ),
          ),

          ///5
          Container(
            height: 60,
            margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: RaisedButton(
              elevation: 10,
              //color: Color(0xC5C5C7),
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                //side: BorderSide(color: Colors.red),
              ),
              onPressed: () {
                print("mat pressed");
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return MyWebView(
                    title: "অনলাইন ট্যারিফ (এইচ এস কোড)",
                    selectedUrl:
                        'http://customs.gov.bd/portal/services/tariff/index.jsf',
                  );
                }));
              },
              child: Text(
                "অনলাইন ট্যারিফ (এইচ এস কোড)",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Shobuj Nolua',
                  fontSize: 22,
                ),
              ),
            ),
          ),

          ///6
          Container(
            height: 60,
            margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: RaisedButton(
              elevation: 10,
              //color: Color(0xC5C5C7),
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                //side: BorderSide(color: Colors.red),
              ),
              onPressed: () {
                print("mat pressed");
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return MyWebView(
                    title: "বিআইএন চেক",
                    selectedUrl:
                        'http://nbr.gov.bd/fourteen-digit-bin-search/eng',
                  );
                }));
              },
              child: Text(
                "বিআইএন চেক",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Shobuj Nolua',
                  fontSize: 22,
                ),
              ),
            ),
          ),

          ///8
          Container(
            height: 60,
            margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: RaisedButton(
              elevation: 10,
              //color: Color(0xC5C5C7),
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                //side: BorderSide(color: Colors.red),
              ),
              onPressed: () {
                print("mat pressed");
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return MyWebView(
                    title: "বাণিজ্য মন্ত্রণালয়",
                    selectedUrl: 'https://mincom.gov.bd/',
                  );
                }));
              },
              child: Text(
                "বাণিজ্য মন্ত্রণালয়",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Shobuj Nolua',
                  fontSize: 22,
                ),
              ),
            ),
          ),

          ///9
          Container(
            height: 60,
            margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: RaisedButton(
              elevation: 10,
              //color: Color(0xC5C5C7),
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                //side: BorderSide(color: Colors.red),
              ),
              onPressed: () {
                print("mat pressed");
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return MyWebView(
                    title: "বাংলাদেশের আইনসমূহ",
                    selectedUrl: 'http://bdlaws.minlaw.gov.bd/',
                  );
                }));
              },
              child: Text(
                "বাংলাদেশের আইনসমূহ",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Shobuj Nolua',
                  fontSize: 22,
                ),
              ),
            ),
          ),

          ///10
          Container(
            height: 60,
            margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: RaisedButton(
              elevation: 10,
              //color: Color(0xC5C5C7),
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                //side: BorderSide(color: Colors.red),
              ),
              onPressed: () {
                print("mat pressed");
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return MyWebView(
                    title: "বাংলাদেশ ব্যাংক আমদানি অনলাইন মনিটরিং সিস্টেম",
                    selectedUrl:
                        'https://exp.bb.org.bd/ords/f?p=116:LOGIN:15462254184777',
                  );
                }));
              },
              child: Text(
                "বাংলাদেশ ব্যাংক আমদানি অনলাইন মনিটরিং সিস্টেম",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Shobuj Nolua',
                  fontSize: 22,
                ),
              ),
            ),
          ),

          ///11
          Container(
            height: 60,
            margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: RaisedButton(
              elevation: 10,
              //color: Color(0xC5C5C7),
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                //side: BorderSide(color: Colors.red),
              ),
              onPressed: () {
                print("mat pressed");
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return MyWebView(
                    title: "বাংলাদেশ ব্যাংক রপ্তানি অনলাইন মনিটরিং সিস্টেম",
                    selectedUrl:
                        'https://exp.bb.org.bd/ords/f?p=112:LOGIN:13821079876487',
                  );
                }));
              },
              child: Text(
                "বাংলাদেশ ব্যাংক রপ্তানি অনলাইন মনিটরিং সিস্টেম",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Shobuj Nolua',
                  fontSize: 22,
                ),
              ),
            ),
          ),*/
