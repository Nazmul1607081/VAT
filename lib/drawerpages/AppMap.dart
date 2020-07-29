import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart';
import 'package:vatapp/components/mydrawer.dart';

class AppMap extends StatefulWidget {
  @override
  _AppMapState createState() => _AppMapState();
}

class _AppMapState extends State<AppMap> {
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
        title: Text('অ্যাপ ম্যাপ'),
      ),
      body: Container(
        color: Color(0xff056608),
        child: AppMapBody(),
      ),
    );
  }
}

class AppMapBody extends StatefulWidget {
  @override
  _AppMapBodyState createState() => _AppMapBodyState();
}

class _AppMapBodyState extends State<AppMapBody> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        SizedBox(
          height: 20,
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
                return AppMap1();
              }));
            },
            child: Text(
              "এ্যাপটিতে যা রয়েছে",
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
          margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
          child: RaisedButton(
            elevation: 12,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
              //side: BorderSide(color: Colors.red),
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return AppMap2();
              }));
            },
            child: Text(
              "ব্যবহারিক নির্দেশিকা:",
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
          margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
          child: RaisedButton(
            elevation: 12,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
              //side: BorderSide(color: Colors.red),
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return AppMap3();
              }));
            },
            child: Text(
              "অ্যাপটির বৈশিষ্ট্য",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Shobuj Nolua',
                fontSize: 22,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class AppMap1 extends StatefulWidget {
  @override
  _AppMap1State createState() => _AppMap1State();
}

class _AppMap1State extends State<AppMap1> {
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
        title: Text('এ্যাপটিতে যা রয়েছে'),
      ),
      body: Container(
        color: Color(0xff056608),
        padding: EdgeInsets.fromLTRB(8, 8, 8, 0),

        // color: Color(0xff056608),
        child: ListView(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
                color: Colors.white,
              ),
              child: Table(
                border: TableBorder.all(
                  color: Colors.black26,
                  width: 1,
                  style: BorderStyle.solid,
                ),
                children: [
                  TableRow(children: [
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            'এপ সম্পর্কিত',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            'আইন ও বিধি বিষয়ক',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            'অন্যান্য',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]),
                  TableRow(children: [
                    TableCell(
                      child: ListView(
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                            child: Text('১। ভূমিকা:'),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                            child: Text('২। এ্যাপ ম্যাপ'),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                            child: Text('৩। গুরুত্বপূর্ণ লিংকসমূহ'),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                            child: Text('৪। ব্যবহারকারীর\n     পরামর্শ'),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                            child: Text('৫। বিবিধ'),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                            child: Text('৬। রেজিস্ট্রেশন/ নিবন্ধন/লগইন'),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                            child: Text('৭। আমাদের সম্পর্কে'),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                            child: Text('৮। এ্যাপ তথ্য'),
                          ),
                        ],
                      ),
                      verticalAlignment: TableCellVerticalAlignment.top,
                    ),
                    TableCell(
                      child: ListView(
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                            child: Text('৯। আইনসমূহ'),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                            child: Text('১০। বিধিমালা'),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                            child: Text('১১। এসআরও'),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                            child: Text('১২। সাধারণ/\n    বিশেষ আদেশ'),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                            child: Text('১৩। ব্যাখ্যাপত্র'),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                            child: Text('১৪। তফসিল'),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                            child: Text('১৫। বিষয়ভিত্তিক\n       আলোচনা'),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                            child: Text('১৬। মূসক\n       ফরমসমূহ'),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                            child: Text(
                                '১৭। ফরম\n      পূরণের\n       নির্দেশিকা'),
                          ),
                        ],
                      ),
                      verticalAlignment: TableCellVerticalAlignment.top,
                    ),
                    TableCell(
                      child: ListView(
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                            child: Text('১৮। তথ্যানুসন্ধান'),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                            child: Text(
                                '১৯। পণ্যের ও সেবার ভ্যাট হার ও অব্যাহতির তথ্য অনুসন্ধান'),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                            child: Text('২০। এইচ এস কোড অনুসন্ধান'),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                            child: Text('২১। প্রশ্ন ও উত্তর'),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                            child: Text('২২। বিন চেক '),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                            child: Text('২৩। ভ্যাট ক্যালকুলেটর'),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                            child: Text('২৪। গুরুত্বপূর্ণ লিংকসমূহ'),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                            child: Text('২৫। সাপোর্ট'),
                          ),
                        ],
                      ),
                      verticalAlignment: TableCellVerticalAlignment.top,
                    ),
                  ]),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}

///app map option 2

class AppMap2 extends StatefulWidget {
  @override
  _AppMap2State createState() => _AppMap2State();
}

class _AppMap2State extends State<AppMap2> {
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
        title: Text('ব্যবহারিক নির্দেশিকা:'),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
        color: Color(0xff056608),
        child: ListView(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              child: Table(
                columnWidths: {0: FixedColumnWidth(120)},
                border: TableBorder.all(
                  color: Colors.black26,
                  width: 1,
                  style: BorderStyle.solid,
                ),
                children: [
                  TableRow(children: [
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            'বিষয়',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            'যা রয়েছে/ যা পাবেন',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]),
                  TableRow(children: [
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('১।  ভূমিকা: '),
                      ),
                      verticalAlignment: TableCellVerticalAlignment.bottom,
                    ),
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('এপ বিষয়ে অবতরনিকা।'),
                      ),
                      verticalAlignment: TableCellVerticalAlignment.bottom,
                    ),
                  ]),

                  ///2
                  TableRow(children: [
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('২।  এ্যাপ ম্যাপ'),
                      ),
                      verticalAlignment: TableCellVerticalAlignment.bottom,
                    ),
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            'এই এ্যাপটিতে যা রয়েছে এবং যেভাবে ব্যবহার করতে হবে সে বিষয়ে ব্যাখ্যা। '),
                      ),
                      verticalAlignment: TableCellVerticalAlignment.bottom,
                    ),
                  ]),

                  ///3
                  TableRow(children: [
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('৩। গুরুত্বপূর্ণ লিংকসমূহ'),
                      ),
                      verticalAlignment: TableCellVerticalAlignment.bottom,
                    ),
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            'ভ্যাটের সাথে সম্পর্কিত গুরুত্বপূর্ণ ও প্রয়োজনীয় লিংকসমূহ দেয়া আছে।'),
                      ),
                      verticalAlignment: TableCellVerticalAlignment.bottom,
                    ),
                  ]),

                  ///4
                  TableRow(children: [
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('৪। ব্যবহারকারীর পরামর্শ'),
                      ),
                      verticalAlignment: TableCellVerticalAlignment.bottom,
                    ),
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            'এর মাধ্যমে এই এ্যাপ সম্পর্কে ব্যবহারকারী তার মতামত জানাতে পারবেন। '),
                      ),
                      verticalAlignment: TableCellVerticalAlignment.bottom,
                    ),
                  ]),

                  ///5
                  TableRow(children: [
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('৫। বিবিধ'),
                      ),
                      verticalAlignment: TableCellVerticalAlignment.bottom,
                    ),
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('এখানে নতুন নতুন বিষয় সংযোজন করা হবে। '),
                      ),
                      verticalAlignment: TableCellVerticalAlignment.bottom,
                    ),
                  ]),

                  ///6
                  TableRow(children: [
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('৬। রেজিস্ট্রেশন/নিবন্ধন/লগইন'),
                      ),
                      verticalAlignment: TableCellVerticalAlignment.bottom,
                    ),
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            'এর মাধ্যমে নিবন্ধিহ ও লগইন করার মাধ্যমে আমাদের পূর্ণাঙ্গ সেবা ভোগ করতে পারবেন সহজে। '),
                      ),
                      verticalAlignment: TableCellVerticalAlignment.bottom,
                    ),
                  ]),

                  ///7
                  TableRow(children: [
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('৭। আমাদের সম্পর্কে'),
                      ),
                      verticalAlignment: TableCellVerticalAlignment.bottom,
                    ),
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('এপ তৈরীকারক সম্পর্কে জানতে পারবেন। '),
                      ),
                      verticalAlignment: TableCellVerticalAlignment.bottom,
                    ),
                  ]),

                  ///8
                  TableRow(children: [
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('৮। এ্যাপ তথ্য'),
                      ),
                      verticalAlignment: TableCellVerticalAlignment.top,
                    ),
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            'এই এ্যাপের আপডেট, ভার্সনসহ বিস্তারিত জানতে পারবেন। '),
                      ),
                      verticalAlignment: TableCellVerticalAlignment.top,
                    ),
                  ]),

                  ///9
                  TableRow(children: [
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('৯। আইনসমূহ'),
                      ),
                      verticalAlignment: TableCellVerticalAlignment.top,
                    ),
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            'এখানে ভ্যাট এর নতুন ও পুরাতন আইন এবং রিলেটেড অন্যান্য আইন পাবেন।'
                            " আইনের অধ্যায়, ধারা, উপ-ধারা ভিত্তিক মেনু আকারে পর্যায়ক্রমে তুলে ধরা হয়েছে যেন খুব সহজে ব্যবহারকারী তার প্রয়োজনীয় বিষয় খুজে পেতে পারেন। উক্ত ধারার সাথে সম্পর্কিত বিধি তার সাথে সাথেই লিংক করা আছে যেন সরাসরি ধারার পরেই সেই বিষয়ের সাথে জড়িত বিধি বা এসআরও বা ফরমে বা সাধারণ বা বিশেষ আদেশ বা ব্যাখ্যাপত্র খুজে পেতে পারেন। এতে করে খুব সহজে ব্যবহারকারী তার প্রয়োজনীয় তথ্য নিমিষেই হাতের নাগালে পেয়ে যাবেন।"
                            " এখানে পুরাতন আইনের সর্বশেষ সংশোধনীসহ সংযোজন করা হয়েছে যেন মামলা বা অন্যান্য বিষয়ের প্রয়োজনে উক্ত আইন ও ব্যবহারকারী খুব সহজে পেতে পারেন।"),
                      ),
                      verticalAlignment: TableCellVerticalAlignment.top,
                    ),
                  ]),

                  ///10
                  TableRow(children: [
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('১০। বিধিমালা'),
                      ),
                      verticalAlignment: TableCellVerticalAlignment.top,
                    ),
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            'এখানে ভ্যাট এর নতুন ও পুরাতন বিধিমালা এবং জড়িত অন্যান্য বিধিমালা রয়েছে যেন ব্যবাহারকারী তার চাহিদামত নতুন পুরাতন বিধিমালা খুজে পেতে পারেন।'),
                      ),
                      verticalAlignment: TableCellVerticalAlignment.top,
                    ),
                  ]),

                  ///11
                  TableRow(children: [
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('১১। এসআরও'),
                      ),
                      verticalAlignment: TableCellVerticalAlignment.top,
                    ),
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            'এখানে ভ্যাট এর নতুন ও পুরাতন এসআরও দেয়া হয়েছে। '),
                      ),
                      verticalAlignment: TableCellVerticalAlignment.top,
                    ),
                  ]),

                  ///12
                  TableRow(children: [
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('১২। সাধারণ/বিশেষ আদেশ'),
                      ),
                      verticalAlignment: TableCellVerticalAlignment.top,
                    ),
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            'ভ্যাট এর নতুন ও পুরাতন সাধারণ ও বিশেষ আদেশসমূহ রয়েছে। '),
                      ),
                      verticalAlignment: TableCellVerticalAlignment.top,
                    ),
                  ]),

                  ///13
                  TableRow(children: [
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('১৩। ব্যাখ্যাপত্র'),
                      ),
                      verticalAlignment: TableCellVerticalAlignment.top,
                    ),
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            'ভ্যাট এর নতুন ও পুরাতন ব্যাখ্যাপত্র সংযোজন করা হয়েছে। '),
                      ),
                      verticalAlignment: TableCellVerticalAlignment.top,
                    ),
                  ]),

                  ///14
                  TableRow(children: [
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('১৪। তফসিল'),
                      ),
                      verticalAlignment: TableCellVerticalAlignment.top,
                    ),
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            'নতুন আইনের তফসিলসমূহ রয়েছে। সেই সাথে পুরাতন ভ্যাট আইনের তফসিল।'),
                      ),
                      verticalAlignment: TableCellVerticalAlignment.top,
                    ),
                  ]),

                  ///15
                  TableRow(children: [
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('১৫। বিষয়ভিত্তিক আলোচনা'),
                      ),
                      verticalAlignment: TableCellVerticalAlignment.top,
                    ),
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            'আইন, বিধি ও এসআরও এবং ব্যাখ্যাপত্রের আলোকে গুরুত্বপূর্ণ বিষয়ের উপর আলোচনা প্রদান করা হয়েছে যেন ব্যবহারকারী সহজেই তার সকল প্রয়োজনীয় বিষয় বুঝতে পারেন। '),
                      ),
                      verticalAlignment: TableCellVerticalAlignment.top,
                    ),
                  ]),

                  ///16
                  TableRow(children: [
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('১৬। মূসক ফরমসমূহ'),
                      ),
                      verticalAlignment: TableCellVerticalAlignment.top,
                    ),
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            'এখানে মূসকের সকল আপডেট ফরম সংযুক্ত করা হয়েছে।ব্যবহারকারী তার প্রয়োজনে ডাউনলোড করে প্রিন্ট করতে পারবেন। '),
                      ),
                      verticalAlignment: TableCellVerticalAlignment.top,
                    ),
                  ]),

                  ///17
                  TableRow(children: [
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('১৭। ফরম পূরণের নির্দেশিকা'),
                      ),
                      verticalAlignment: TableCellVerticalAlignment.top,
                    ),
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            'মূসক ফর্মসমূহ পূরণের নির্দেশিকা প্রদান করা হয়েছে। গুরুত্বপূর্ণ ফরমসমূহ (দাখিলপত্রসহ) যেভাবে পূরন করতে হবে তার বিস্তারিত তুলে ধরা হয়েছে।'),
                      ),
                      verticalAlignment: TableCellVerticalAlignment.top,
                    ),
                  ]),

                  ///18
                  TableRow(children: [
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('১৮। তথ্যানুসন্ধান'),
                      ),
                      verticalAlignment: TableCellVerticalAlignment.top,
                    ),
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            'এই এ্যাপের মধ্যে যেসকল তথ্য রয়েছে তা সহজে অনুসন্ধানের মাধ্যমে খুঁজে পাবেন। শুধু প্রকৃত নাম দিয়ে সার্চ করতে হবে। '),
                      ),
                      verticalAlignment: TableCellVerticalAlignment.top,
                    ),
                  ]),

                  ///19

                  TableRow(children: [
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:
                            Text('১৯। পণ্যের ও সেবার ভ্যাট হার ও অব্যাহতির '),
                      ),
                      verticalAlignment: TableCellVerticalAlignment.top,
                    ),
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            'বর্তমান অর্থ বছরের জন্য পণ্য ও সেবারর উপর ভ্যাটের হার এবং অব্যাহতির তথ্যসমূহ অনুসন্ধান করতে পারবেন। অথবা মেনু থেকে সিলেক্ট করে বিভিন্ন হারের ও অব্যাহতির এবং সম্পূরক শুল্কের হারের পণ্যের ও সেবার তালিকা দেখতে পারবেন।'),
                      ),
                      verticalAlignment: TableCellVerticalAlignment.top,
                    ),
                  ]),

                  ///20
                  TableRow(children: [
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('২০। এইচ এস কোড অনুসন্ধান'),
                      ),
                      verticalAlignment: TableCellVerticalAlignment.top,
                    ),
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            'বর্তমানে ভ্যাটের জন্যও পণ্যের এইচ এস কোড দরকার হয় বিধায় এর মাধ্যমে ব্যবহারকারী খুব সহজে সার্চ দিয়ে এইচএসকোডসহ তার বিস্তারিত ট্যারিফ বিষেয়ে জানতে পারবেন। '),
                      ),
                      verticalAlignment: TableCellVerticalAlignment.top,
                    ),
                  ]),

                  ///21
                  TableRow(children: [
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('২১। প্রশ্ন ও উত্তর'),
                      ),
                      verticalAlignment: TableCellVerticalAlignment.top,
                    ),
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            'ব্যবহারকারী তার কোন জিজ্ঞাসা থাকলে এর মাধ্যমে করতে পারবেন এবং যথাশীঘ্র তার উত্তর পেয়ে যাবেন। '),
                      ),
                      verticalAlignment: TableCellVerticalAlignment.top,
                    ),
                  ]),

                  ///22
                  TableRow(children: [
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('২২। বিন চেক '),
                      ),
                      verticalAlignment: TableCellVerticalAlignment.top,
                    ),
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            'এর মাধ্যমে ব্যবহারকারী চাইলে খুব সজে বিন চেক করতে পারবেন। '),
                      ),
                      verticalAlignment: TableCellVerticalAlignment.top,
                    ),
                  ]),

                  ///23
                  TableRow(children: [
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('২৩। ভ্যাট ক্যালকুলেটর'),
                      ),
                      verticalAlignment: TableCellVerticalAlignment.top,
                    ),
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            'ভ্যাট ক্যালকুলেটরের সাহায্যে ব্যবহারকারী তার প্রয়োজনীয় তথ্য প্রদানের মাধ্যমে খুব সহজে ভ্যাটের পরিমাণ ও নীট ভ্যাট নির্ণয় করতে পারবেন। '),
                      ),
                      verticalAlignment: TableCellVerticalAlignment.top,
                    ),
                  ]),

                  ///24
                  TableRow(children: [
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('২৪। গুরুত্বপূর্ণ '),
                      ),
                      verticalAlignment: TableCellVerticalAlignment.top,
                    ),
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            'এর মাধ্যমে ভ্যাট ও কাস্টমসের সাথে জড়িত গুরুত্বপূর্ণ লিংকসমূহ পাবেন এবং লিংক থেকে সরাসরি উক্ত ঠিকানায় ক্লিক কের যেতে পারবেন। '),
                      ),
                      verticalAlignment: TableCellVerticalAlignment.top,
                    ),
                  ]),

                  ///25
                  TableRow(children: [
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('২৫। সাপোর্ট '),
                      ),
                      verticalAlignment: TableCellVerticalAlignment.top,
                    ),
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            'ভ্যাট বিষয়ক সাপোর্টের জন্য বিস্তারিত তথ্য দেয়া হয়েছে।'),
                      ),
                      verticalAlignment: TableCellVerticalAlignment.top,
                    ),
                  ]),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}

/// appoption 3
class AppMap3 extends StatefulWidget {
  @override
  _AppMap3State createState() => _AppMap3State();
}

class _AppMap3State extends State<AppMap3> {
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
        title: Text('অ্যাপটির বৈশিষ্ট্য'),
      ),
      body: Container(
        color: Color(0xff056608),
        padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
        child: ListView(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                child: Text(
                    "১। এন্ড্রয়েড প্লাটফর্মে সহজবোধ্যভাবে তৈরী করা হয়েছে যেন খুব সহজে যে কোন ব্যবহারকারী এর সুবিধা ভোগ করতে পারেন।"),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              child: Text(
                  "২। নতুন আইনের পাশাপাশি পুরাতন আইন সংযোজন করা হয়েছে এবং পর্যায়ক্রমে এ সম্পর্কিত সকল আইন এর মধ্যে সন্নিবেশ করা হবে। আইনের অধ্যায়, ধারা ভিত্তিক ম্যানু আকারে সাজানো হয়েছে এবং তার সাথে বিধিমালা এবং এসআরও ও ফরমসমূহের সাথে লিংক করা হয়েছে যেন ব্যবহারকারী খুব সহজে তার প্রয়োজনীয় তথ্য খুঁজে পেতে পারেন।"),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                child: Text(
                    "৩। কাগুজে বইয়ের মত বহন করা ও পৃষ্ঠা উল্টানোর ঝামেলা নাই। ")),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              child: Text(
                  "৪। সর্বশেষ এসআরও, সাধারণ আদেশ ও ব্যাখ্যাপত্রসমূহ সংযোজন করা হয়েছে বিধায় সহজে প্রয়োজনীয় আপডেট তথ্য পেয়ে যাবেন। "),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              child: Text(
                  "৫। ডিজিটাল ফরম্যাটে মোবইলের সামান্য জায়গা খরচ করেই এটি ব্যবহার করা যাবে বিধায় বহণ করার ঝামেলা নেই। মোবইলে মধ্যে থাকায় যেকোন স্থানে যেকোন সময় তা বের করে প্রয়োজনীয় তথ্য খুজে পেতে পারবেন। "),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              child: Text(
                  "৬। সম্পূর্ণ বিনা মূল্যে গুগল প্লে স্টোর হতে এটি ডাউনলোড করেই ব্যবহার করতে পারবেন। এর জন্য কোন টাকা খরচ করতে হবে না।"),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
