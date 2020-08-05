import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vatapp/components/mydrawer.dart';
import 'package:vatapp/law/headinganddara.dart';

class Rule1 extends StatefulWidget {
  @override
  _Rule1State createState() => _Rule1State();
}

class _Rule1State extends State<Rule1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.keyboard_backspace),
            onPressed: () {
              Navigator.pop(context);
            }),
        backgroundColor: Color(0xff056608),
        centerTitle: true,
        title: Text('মূল্য সংযোজন কর ও সম্পূরক শুল্ক বিধিমালা, ২০১৬'),
      ),
      body: Container(
        color: Colors.white,
        child: Rule1Body(),
      ),
    );
  }
}

class Rule1Body extends StatefulWidget {
  @override
  _Rule1BodyState createState() => _Rule1BodyState();
}

class _Rule1BodyState extends State<Rule1Body> {
  List<Widget> chapter1 = [];
  List<Widget> chapter2 = [];
  List<Widget> chapter3 = [];
  List<Widget> chapter4 = [];
  List<Widget> chapter5 = [];
  List<Widget> chapter6 = [];
  List<Widget> chapter7 = [];
  List<Widget> chapter8 = [];
  List<Widget> chapter9 = [];
  List<Widget> chapter10 = [];
  List<Widget> chapter11 = [];
  List<Widget> chapter12 = [];
  List<Widget> chapter13 = [];
  List<Widget> chapter14 = [];
  List<Widget> chapter15 = [];
  List<Widget> chapter16 = [];
  List<Widget> chapter17 = [];
  List<Widget> chapter18 = [];

  bool chap1show = false;
  bool chap2show = false;
  bool chap3show = false;
  bool chap4show = false;
  bool chap5show = false;
  bool chap6show = false;
  bool chap7show = false;
  bool chap8show = false;
  bool chap9show = false;
  bool chap10show = false;
  bool chap11show = false;
  bool chap12show = false;
  bool chap13show = false;
  bool chap14show = false;
  bool chap15show = false;
  bool chap16show = false;
  bool chap17show = false;
  bool chap18show = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    chapter1.clear();
    chap1show = false;
    chapter2.clear();
    chap2show = false;
    chapter3.clear();
    chap3show = false;
    chapter4.clear();
    chap4show = false;
    chapter5.clear();
    chap5show = false;
    chapter6.clear();
    chap6show = false;
    chapter7.clear();
    chap7show = false;
    chapter8.clear();
    chap8show = false;
    chapter9.clear();
    chap9show = false;
    chapter10.clear();
    chap10show = false;
    chapter11.clear();
    chap11show = false;
    chapter12.clear();
    chap12show = false;
    chapter13.clear();
    chap13show = false;
    chapter14.clear();
    chap14show = false;
    chapter15.clear();
    chap15show = false;
    chapter16.clear();
    chap16show = false;
    chapter17.clear();
    chap17show = false;
    chapter18.clear();
    chap18show = false;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        //////1

        InkWell(
          onTap: () {
            setState(() {
              if (chap1show) {
                chap1show = false;
                chapter1.clear();
              } else {
                chap1show = true;
                chapter1.add(ChapRow(
                  name: 'সংক্ষিপ্ত শিরোনাম ও প্রবর্তন',
                  num: '১',
                  leftalignment: 15.0,
                  colorno: '0',
                  dir: 'rule',
                ));

                chapter1.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter1.add(ChapRow(
                  name: 'সংজ্ঞা',
                  num: '২',
                  leftalignment: 15.0,
                  colorno: '1',
                  dir: 'rule',
                ));

                chapter1.add(
                  SizedBox(
                    height: 1,
                  ),
                );
              }
            });
          },
          child: Heading(
            chapno: 'প্রথম অধ্যায়',
            chapitle: 'প্রারম্ভিক',
          ),
        ),
        ListView.builder(
            itemCount: chapter1.length,
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemBuilder: (context, index) {
              return chapter1[index];
            }),
        SizedBox(
          height: 2,
        ),

        /////2

        InkWell(
          onTap: () {
            setState(() {
              if (chap2show) {
                chap2show = false;
                chapter2.clear();
              } else {
                chap2show = true;
                chapter2.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter2.add(ChapRow(
                  name: 'নিবন্ধন বা তালিকাভুক্তির সীমা নির্ধারণ',
                  num: '৩',
                  leftalignment: 20.0,
                  colorno: '0',
                  dir: 'rule',
                ));
                chapter2.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter2.add(ChapRow(
                  name: 'নিবন্ধনের আবেদন ও নিবন্ধন প্রদান',
                  num: '৪',
                  leftalignment: 20.0,
                  colorno: '1',
                  dir: 'rule',
                ));
                chapter2.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter2.add(ChapRow(
                  name: 'তালিকাভুক্তির আবেদন ও তালিকাভুক্তিকরণ',
                  num: '৫',
                  leftalignment: 20.0,
                  colorno: '0',
                  dir: 'rule',
                ));

                chapter2.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter2.add(ChapRow(
                  name: 'স্বেচ্ছা নিবন্ধন',
                  num: '৬',
                  leftalignment: 20.0,
                  colorno: '1',
                  dir: 'rule',
                ));

                chapter2.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter2.add(ChapRow(
                  name:
                      'বিভাগীয় কর্মকর্তা কর্তৃক স্ব-উদ্যোগে নিবন্ধিত বা তালিকাভুক্তিকরণ',
                  num: '৭',
                  leftalignment: 20.0,
                  colorno: '0',
                  dir: 'rule',
                ));
                chapter2.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter2.add(ChapRow(
                  name: 'মূসক নিবন্ধন বাতিল',
                  num: '৮',
                  leftalignment: 20.0,
                  colorno: '1',
                  dir: 'rule',
                ));
                chapter2.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter2.add(ChapRow(
                  name: 'টার্ণওভার কর তালিকাভুক্তি বাতিল',
                  num: '৯',
                  leftalignment: 20.0,
                  colorno: '0',
                  dir: 'rule',
                ));
                chapter2.add(
                  SizedBox(
                    height: 1,
                  ),
                );

                chapter2.add(ChapRow(
                  name: 'নিবন্ধিত বা তালিকাভুক্ত ব্যক্তিবর্গের তালিকা',
                  num: '১০',
                  leftalignment: 15.0,
                  colorno: '1',
                  dir: 'rule',
                ));
                chapter2.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter2.add(ChapRow(
                  name: 'ব্যবসায় সনাক্তকরণ সংখ্যার ব্যবহার',
                  num: '১১',
                  leftalignment: 15.0,
                  colorno: '0',
                  dir: 'rule',
                ));
                chapter2.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter2.add(ChapRow(
                  name: 'পরিবর্তিত তথ্য অবহিতকরণ',
                  num: '১২',
                  leftalignment: 15.0,
                  colorno: '1',
                  dir: 'rule',
                ));
                chapter2.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter2.add(ChapRow(
                  name: 'ব্যবসায়ের স্থান পরিবর্তন',
                  num: '১৩',
                  leftalignment: 15.0,
                  colorno: '0',
                  dir: 'rule',
                ));
                chapter2.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter2.add(ChapRow(
                  name: 'নিবন্ধন সনদপত্র বা তালিকাভুক্তিপত্রের নকল',
                  num: '১৪',
                  leftalignment: 15.0,
                  colorno: '1',
                  dir: 'rule',
                ));
                chapter2.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter2.add(ChapRow(
                  name: 'ক্রান্তিকালীণ নিবন্ধন বা তালিকাভুক্তি',
                  num: '১৫',
                  leftalignment: 15.0,
                  colorno: '0',
                  dir: 'rule',
                ));
                chapter2.add(
                  SizedBox(
                    height: 1,
                  ),
                );
              }
            });
          },
          child: Heading(
            chapno: 'দ্বিতীয় অধ্যায়',
            chapitle: 'মূসক নিবন্ধন ও টার্ণওভার কর তালিকাভুক্তি',
          ),
        ),
        ListView.builder(
            itemCount: chapter2.length,
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemBuilder: (context, index) {
              return chapter2[index];
            }),
        SizedBox(
          height: 2,
        ),

        //////3333333333

        InkWell(
          onTap: () {
            setState(() {
              if (chap3show) {
                chap3show = false;
                chapter3.clear();
              } else {
                chap3show = true;
                chapter3.add(
                  SizedBox(
                    height: 1,
                  ),
                );

                chapter3.add(ChapRow(
                  name: 'মূসক এজেন্ট নিয়োগ, ইত্যাদি',
                  num: '১৬',
                  leftalignment: 15.0,
                  colorno: '0',
                  dir: 'rule',
                ));

                chapter3.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter3.add(ChapRow(
                  name: 'মূসক এজেন্ট মনোনয়ন',
                  num: '১৭',
                  leftalignment: 15.0,
                  colorno: '1',
                  dir: 'rule',
                ));

                chapter3.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter3.add(ChapRow(
                  name:
                      'আন্তর্জাতিক দরপত্রের বিপরীতে বৈদেশিক মুদ্রায় পণ্য সরবরাহ বা সেবা প্রদান',
                  num: '১৮ক',
                  leftalignment: 5.0,
                  colorno: '0',
                  dir: 'rule',
                ));

                chapter3.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter3.add(ChapRow(
                  name: 'ট্রাভেল এজেন্ট এবং ট্যুর অপারেটর',
                  num: '১৮',
                  leftalignment: 15.0,
                  colorno: '1',
                  dir: 'rule',
                ));

                chapter3.add(
                  SizedBox(
                    height: 1,
                  ),
                );

                //chap2show = true;
              }
            });
          },
          child: Heading(
            chapno: 'তৃতীয় অধ্যায়',
            chapitle: 'মূসক আরোপ',
          ),
        ),
        ListView.builder(
            itemCount: chapter3.length,
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemBuilder: (context, index) {
              return chapter3[index];
            }),
        SizedBox(
          height: 2,
        ),

        /////////////444444444

        InkWell(
          onTap: () {
            setState(() {
              if (chap4show) {
                chap4show = false;
                chapter4.clear();
              } else {
                chapter4.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chap4show = true;
                chapter4.add(ChapRow(
                  name: 'আমদানি পর্যায়ে পরিশোধিত আগাম কর সমন্বয় ও ফেরত',
                  num: '১৯',
                  leftalignment: 15.0,
                  colorno: '0',
                  dir: 'rule',
                ));

                chapter4.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter4.add(ChapRow(
                  name: 'পণবিহীন করযোগ্য সরবরাহের মূল্য নির্ধারণ',
                  num: '২০',
                  leftalignment: 15.0,
                  colorno: '1',
                  dir: 'rule',
                ));

                chapter4.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter4.add(ChapRow(
                  name: 'উপকরণ উৎপাদ সহগ ঘোষণা',
                  num: '২১',
                  leftalignment: 15.0,
                  colorno: '0',
                  dir: 'rule',
                ));

                chapter4.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter4.add(ChapRow(
                  name: 'চলমান ব্যবসা বিক্রয়ের পদ্ধতি',
                  num: '২২',
                  leftalignment: 15.0,
                  colorno: '1',
                  dir: 'rule',
                ));

                chapter4.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter4.add(ChapRow(
                  name:
                      'আগাম মূল্য পরিশোধিত টেলিযোগাযোগ সেবা গ্রহণকারী বা দ্রব্য ব্যবহারকারী-'
                  /*'আগাম মূল্য পরিশোধিত টেলিযোগাযোগ সেবা গ্রহণকারী বা দ্রব্য ব্যবহারকারী ব্যক্তি কর্তৃক রেয়াত গ্রহণ পদ্ধতি'*/,
                  num: '২৩',
                  leftalignment: 15.0,
                  colorno: '0',
                  dir: 'rule',
                ));

                chapter4.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter4.add(ChapRow(
                  name:
                      'অনিবন্ধিত পাওনাদার কর্তৃক ঋণ পরিশোধে সম্পত্তি বিক্রয়ের পদ্ধতি',
                  num: '২৪',
                  leftalignment: 15.0,
                  colorno: '1',
                  dir: 'rule',
                ));

                chapter4.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter4.add(ChapRow(
                  name: 'অব্যবহৃত বা ব্যবহারের অনুপযোগী উপকরণের নিম্পত্তিকরণ',
                  num: '২৪ক',
                  leftalignment: 5.0,
                  colorno: '0',
                  dir: 'rule',
                ));

                chapter4.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter4.add(ChapRow(
                  name:
                      'দুর্ঘটনায় ক্ষতিগ্রস্ত বা ধ্বংসপ্রাপ্ত পণ্যের নিম্পত্তিকরণ',
                  num: '২৪খ',
                  leftalignment: 5.0,
                  colorno: '1',
                  dir: 'rule',
                ));

                chapter4.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter4.add(ChapRow(
                  name:
                      'বর্জ্য (ওয়েস্ট) বা উপজাত (বাই-প্রোডাক্ট) পণ্যের সরবরাহ ও নিষ্পত্তিকরণ',
                  num: '২৪গ',
                  leftalignment: 5.0,
                  colorno: '0',
                  dir: 'rule',
                ));

                chapter4.add(
                  SizedBox(
                    height: 1,
                  ),
                );
              }
            });
          },
          child: Heading(
            chapno: 'চতুর্থ অধ্যায়',
            chapitle: 'মূসক আদায় পদ্ধতি',
          ),
        ),
        ListView.builder(
            itemCount: chapter4.length,
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemBuilder: (context, index) {
              return chapter4[index];
            }),
        SizedBox(
          height: 2,
        ),

        /////////5555555555
        InkWell(
          onTap: () {
            setState(() {
              if (chap5show) {
                chap5show = false;
                chapter5.clear();
              } else {
                chap5show = true;

                chapter5.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter5.add(ChapRow(
                  name: 'কর পরিশোধ পদ্ধতি',
                  num: '২৫',
                  leftalignment: 15.0,
                  colorno: '0',
                  dir: 'rule',
                ));

                chapter5.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter5.add(ChapRow(
                  name: 'আংশিক উপকরণ কর রেয়াত গ্রহণ',
                  num: '২৬',
                  leftalignment: 15.0,
                  colorno: '1',
                  dir: 'rule',
                ));

                chapter5.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter5.add(ChapRow(
                  name:
                      'সমন্বয় ঘটনা প্রবাহের ক্ষেত্রে সরবরাহোত্তর সমন্বয় পদ্ধতি',
                  num: '২৭',
                  leftalignment: 15.0,
                  colorno: '0',
                  dir: 'rule',
                ));

                chapter5.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter5.add(ChapRow(
                  name: 'অনাদায়ী পণের জন্য সরবরাহোত্তর সমন্বয়',
                  num: '২৮',
                  leftalignment: 15.0,
                  colorno: '1',
                  dir: 'rule',
                ));

                chapter5.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter5.add(ChapRow(
                  name:
                      'ব্যাংকিং ব্যাবস্থার মাধ্যমে অর্থ পরিশোধ না করার কারণে সমন্বয়',
                  num: '২৯',
                  leftalignment: 15.0,
                  colorno: '0',
                  dir: 'rule',
                ));

                chapter5.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter5.add(ChapRow(
                  name: 'ব্যক্তিগত উদ্দেশ্যে ব্যবহৃত সম্পদের ক্ষেত্রে সমন্বয়',
                  num: '৩০',
                  leftalignment: 15.0,
                  colorno: '1',
                  dir: 'rule',
                ));

                chapter5.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter5.add(ChapRow(
                  name: 'নিবন্ধিত হওয়ার ক্ষেত্রে উপকরণ কর ও মূসক সমন্বয়',
                  num: '৩১',
                  leftalignment: 15.0,
                  colorno: '0',
                  dir: 'rule',
                ));

                chapter5.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter5.add(ChapRow(
                  name: 'নিবন্ধন বাতিলের পরিপ্রেক্ষিতে সমন্বয়',
                  num: '৩২',
                  leftalignment: 15.0,
                  colorno: '1',
                  dir: 'rule',
                ));

                chapter5.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter5.add(ChapRow(
                  name:
                      'পুনঃবিক্রয়ের জন্য ক্রীত ব্যবহৃত পণ্যের ক্ষেত্রে সমন্বয়',
                  num: '৩৩',
                  leftalignment: 15.0,
                  colorno: '0',
                  dir: 'rule',
                ));

                chapter5.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter5.add(ChapRow(
                  name: 'বীমা সংক্রান্ত সমন্বয়',
                  num: '৩৪',
                  leftalignment: 15.0,
                  colorno: '1',
                  dir: 'rule',
                ));

                chapter5.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter5.add(ChapRow(
                  name:
                      'লটারী, লাকী-ড্র, র‌্যাফেল ড্র, হাউজি এবং অনুরূপ কার্যক্রমের ক্ষেত্রে সমন্বয়',
                  num: '৩৫',
                  leftalignment: 15.0,
                  colorno: '0',
                  dir: 'rule',
                ));

                chapter5.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter5.add(ChapRow(
                  name: 'করহার পরিবর্তনের ক্ষেত্রে সমন্বয়',
                  num: '৩৬',
                  leftalignment: 15.0,
                  colorno: '1',
                  dir: 'rule',
                ));

                chapter5.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter5.add(ChapRow(
                  name:
                      'অনিবন্ধিত সরবরাহ গ্রহীতা কর্তৃক উৎসে কর্তৃত মূসক পরিশোধ',
                  num: '৩৭',
                  leftalignment: 15.0,
                  colorno: '0',
                  dir: 'rule',
                ));

                chapter5.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter5.add(ChapRow(
                  name:
                      'হিসাব রক্ষণ কর্মকর্তা কর্তৃক অনিবন্ধিত সরবরাহ গ্রহীতার পক্ষে উৎসে মূসক কর্তন ও পরিশোধ',
                  num: '৩৮',
                  leftalignment: 15.0,
                  colorno: '1',
                  dir: 'rule',
                ));

                chapter5.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter5.add(ChapRow(
                  name: 'উৎসে কর্তনের পর সরবরাহকারী কর্তৃক হ্রাসকারী সমন্বয়',
                  num: '৩৯',
                  leftalignment: 15.0,
                  colorno: '0',
                  dir: 'rule',
                ));

                chapter5.add(
                  SizedBox(
                    height: 1,
                  ),
                );
              }
            });
          },
          child: Heading(
            chapno: 'পঞ্চম অধ্যায়',
            chapitle: 'করদাতা কর্তৃক প্রদেয় নীট কর নিরূপন ও পরিশোধ',
          ),
        ),
        ListView.builder(
            itemCount: chapter5.length,
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemBuilder: (context, index) {
              return chapter5[index];
            }),
        SizedBox(
          height: 2,
        ),

        ////////////////66666666666

        InkWell(
          onTap: () {
            setState(() {
              if (chap6show) {
                chap6show = false;
                chapter6.clear();
              } else {
                chap6show = true;
                chapter6.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter6.add(ChapRow(
                  name: 'মূসক হিসাব রক্ষণ',
                  num: '৪০',
                  leftalignment: 15.0,
                  colorno: '0',
                  dir: 'rule',
                ));

                chapter6.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter6.add(ChapRow(
                  name: 'টার্ণওভার কর হিসাবরক্ষণ',
                  num: '৪১',
                  leftalignment: 15.0,
                  colorno: '1',
                  dir: 'rule',
                ));

                chapter6.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter6.add(ChapRow(
                  name: 'ক্রয়-বিক্রয়ের তথ্য দাখিল',
                  num: '৪২',
                  leftalignment: 15.0,
                  colorno: '0',
                  dir: 'rule',
                ));

                chapter6.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter6.add(ChapRow(
                  name:
                      'প্রতিনিধি কর্তৃক জারীকৃত অথবা প্রতিনিধি বরাবর জারীকৃত দলিল',
                  num: '৪৩',
                  leftalignment: 15.0,
                  colorno: '1',
                  dir: 'rule',
                ));

                chapter6.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter6.add(ChapRow(
                  name: 'প্রতিলিপি সংক্রান্ত বাধানিষেধ',
                  num: '৪৪',
                  leftalignment: 15.0,
                  colorno: '0',
                  dir: 'rule',
                ));

                chapter6.add(
                  SizedBox(
                    height: 1,
                  ),
                );
              }
            });
          },
          child: Heading(
            chapno: 'ষষ্ঠ অধ্যায়',
            chapitle: 'চালানপত্র এবং দলিলপত্র',
          ),
        ),
        ListView.builder(
            itemCount: chapter6.length,
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemBuilder: (context, index) {
              return chapter6[index];
            }),
        SizedBox(
          height: 2,
        ),

        //////77777777777777

        InkWell(
          onTap: () {
            setState(() {
              if (chap7show) {
                chap7show = false;
                chapter7.clear();
              } else {
                chap7show = true;
                chapter7.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter7.add(ChapRow(
                  name: 'রপ্তানির ক্ষেত্রে সম্পূরক শুল্ক সমন্বয়',
                  num: '৪৫',
                  leftalignment: 15.0,
                  colorno: '0',
                  dir: 'rule',
                ));
              }
            });
          },
          child: Heading(
            chapno: 'সপ্তম অধ্যায়',
            chapitle: 'সম্পূরক শুল্ক আরোপ ও আদায়',
          ),
        ),
        ListView.builder(
            itemCount: chapter7.length,
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemBuilder: (context, index) {
              return chapter7[index];
            }),
        SizedBox(
          height: 2,
        ),

        //////////////////////18

        InkWell(
          onTap: () {
            setState(() {
              if (chap18show) {
                chap18show = false;
                chapter18.clear();
              } else {
                chap18show = true;
                chapter18.add(ChapRow(
                  name: 'টার্ণওভার কর সমন্বয়',
                  num: '৪৬',
                  leftalignment: 15.0,
                  colorno: '0',
                  dir: 'rule',
                ));

                chapter18.add(
                  SizedBox(
                    height: 1,
                  ),
                );
              }
            });
          },
          child: Heading(
            chapno: 'অষ্টম অধ্যায়',
            chapitle: 'টার্ণওভার কর আরোপ ও আদায়',
          ),
        ),
        ListView.builder(
            itemCount: chapter18.length,
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemBuilder: (context, index) {
              return chapter18[index];
            }),
        SizedBox(
          height: 2,
        ),

        /////////৯৯৯৯৯৯৯

        InkWell(
          onTap: () {
            setState(() {
              if (chap8show) {
                chap8show = false;
                chapter8.clear();
              } else {
                chap8show = true;
                chapter8.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter8.add(ChapRow(
                  name: 'দাখিলপত্র পেশ',
                  num: '৪৭',
                  leftalignment: 15.0,
                  colorno: '0',
                  dir: 'rule',
                ));

                chapter8.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter8.add(ChapRow(
                  name: 'বিলম্বে দাখিলপত্র পেশের পদ্ধতি',
                  num: '৪৮',
                  leftalignment: 15.0,
                  colorno: '1',
                  dir: 'rule',
                ));

                chapter8.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter8.add(ChapRow(
                  name: 'দাখিলপত্র সংশোধন',
                  num: '৪৯',
                  leftalignment: 15.0,
                  colorno: '0',
                  dir: 'rule',
                ));

                chapter8.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter8.add(ChapRow(
                  name: 'পূর্ণ, অতিরিক্ত অথবা বিকল্প দাখিলপত্র',
                  num: '৫০',
                  leftalignment: 15.0,
                  colorno: '1',
                  dir: 'rule',
                ));

                chapter8.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter8.add(ChapRow(
                  name: 'ডাক বা বাহক মারফত দাখিলপত্র দাখিলের ক্ষেত্রে সময় গণনা',
                  num: '৫১',
                  leftalignment: 15.0,
                  colorno: '0',
                  dir: 'rule',
                ));

                chapter8.add(
                  SizedBox(
                    height: 1,
                  ),
                );
              }
            });
          },
          child: Heading(
            chapno: 'নবম অধ্যায়',
            chapitle: 'দাখিলপত্র পেশ ও উহার সংশোধন',
          ),
        ),
        ListView.builder(
            itemCount: chapter8.length,
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemBuilder: (context, index) {
              return chapter8[index];
            }),
        SizedBox(
          height: 2,
        ),

        /////////////১০

        InkWell(
          onTap: () {
            setState(() {
              if (chap9show) {
                chap9show = false;
                chapter9.clear();
              } else {
                chap9show = true;
                chapter9.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter9.add(ChapRow(
                  name: 'ফেরত প্রদান',
                  num: '৫২',
                  leftalignment: 15.0,
                  colorno: '0',
                  dir: 'rule',
                ));

                chapter9.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter9.add(ChapRow(
                  name: 'বাতিল',
                  num: '৫৩',
                  leftalignment: 15.0,
                  colorno: '1',
                  dir: 'rule',
                ));

                chapter9.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter9.add(ChapRow(
                  name: 'ফেরত প্রদত্ত অর্থের প্রয়োগ',
                  num: '৫৪',
                  leftalignment: 15.0,
                  colorno: '0',
                  dir: 'rule',
                ));

                chapter9.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter9.add(ChapRow(
                  name:
                      'কূটনৈতিক এবং অন্যান্য আন্তর্জাতিক সংস্থা কর্তৃক প্রদত্ত কর ফেরত প্রদান',
                  num: '৫৫',
                  leftalignment: 15.0,
                  colorno: '1',
                  dir: 'rule',
                ));

                chapter9.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter9.add(ChapRow(
                  name: 'বৈদেশিক পর্যটকদের কর ফেরত',
                  num: '৫৬',
                  leftalignment: 15.0,
                  colorno: '0',
                  dir: 'rule',
                ));

                chapter9.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter9.add(ChapRow(
                  name:
                      'বৈদেশিক পর্যটকদের মূসক ফেরত সনদ জারির লক্ষ্যে নিবন্ধিত ব্যক্তি নির্বাচন',
                  num: '৫৭',
                  leftalignment: 15.0,
                  colorno: '1',
                  dir: 'rule',
                ));

                chapter9.add(
                  SizedBox(
                    height: 1,
                  ),
                );
              }
            });
          },
          child: Heading(
            chapno: 'দশম অধ্যায়',
            chapitle: 'ঋণাত্মক নীট অর্থ জের টানা ও ফেরত প্রদান',
          ),
        ),
        ListView.builder(
            itemCount: chapter9.length,
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemBuilder: (context, index) {
              return chapter9[index];
            }),
        SizedBox(
          height: 2,
        ),

        //////////999999999999

        InkWell(
          onTap: () {
            setState(() {
              if (chap10show) {
                chap10show = false;
                chapter10.clear();
              } else {
                chap10show = true;
                chapter10.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter10.add(ChapRow(
                  name: 'কর নির্ধারণ পদ্ধতি',
                  num: '৫৭ক',
                  leftalignment: 5.0,
                  colorno: '0',
                  dir: 'rule',
                ));

                chapter10.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter10.add(ChapRow(
                  name:
                      'বিশেষ পরিকল্প (Scheme) হইতে কর সুবিধা রদকরণ (negation)',
                  num: '৫৮',
                  leftalignment: 15.0,
                  colorno: '1',
                  dir: 'rule',
                ));
              }
            });
          },
          child: Heading(
            chapno: 'একাদশ অধ্যায়',
            chapitle: 'কমিশনার কর্তৃক কর নির্ধারণ: কর সুবিধা রদকরণ',
          ),
        ),
        ListView.builder(
            itemCount: chapter10.length,
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemBuilder: (context, index) {
              return chapter10[index];
            }),
        SizedBox(
          height: 2,
        ),

        //////////////////১১১১১১১১১১১১১১

        InkWell(
          onTap: () {
            setState(() {
              if (chap11show) {
                chap11show = false;
                chapter11.clear();
              } else {
                chap11show = true;

                chapter11.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter11.add(ChapRow(
                  name:
                      'মূসক কর্মকর্তার আদেশ বা সিদ্ধান্ত সংশোধনে বোর্ডের ক্ষমতা',
                  num: '৫৯',
                  leftalignment: 15.0,
                  colorno: '0',
                  dir: 'rule',
                ));

                chapter11.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter11.add(ChapRow(
                  name: 'মূসক কর্মকর্তার প্রবেশ ও তল্লাশির ক্ষমতা',
                  num: '৬০',
                  leftalignment: 15.0,
                  colorno: '1',
                  dir: 'rule',
                ));

                chapter11.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter11.add(ChapRow(
                  name: 'রেকর্ড, দলিলপত্র, পণ্য বা পণ্যবাহী যান জব্দকরণ',
                  num: '৬১',
                  leftalignment: 15.0,
                  colorno: '0',
                  dir: 'rule',
                ));

                chapter11.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter11.add(ChapRow(
                  name: 'জব্দকৃত রেকর্ড বা দলিলপত্র ফেরত প্রদান',
                  num: '৬২',
                  leftalignment: 15.0,
                  colorno: '1',
                  dir: 'rule',
                ));

                chapter11.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter11.add(ChapRow(
                  name: 'জব্দকৃত পণ্য ও পণ্যবাহী যান ছাড় প্রদান',
                  num: '৬৩',
                  leftalignment: 15.0,
                  colorno: '0',
                  dir: 'rule',
                ));

                chapter11.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter11.add(ChapRow(
                  name: 'জরিমানা আরোপের পদ্ধতি',
                  num: '৬৪',
                  leftalignment: 15.0,
                  colorno: '1',
                  dir: 'rule',
                ));

                chapter11.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter11.add(ChapRow(
                  name:
                      'ব্যাংক হিসাব অপরিচালনযোগ্য (freeze) করিবার ক্ষমতা ও পদ্ধতি',
                  num: '৬৫',
                  leftalignment: 15.0,
                  colorno: '0',
                  dir: 'rule',
                ));

                chapter11.add(
                  SizedBox(
                    height: 1,
                  ),
                );
              }
            });
          },

          ///12
          child: Heading(
            chapno: 'দ্বাদশ অধ্যায়',
            chapitle: 'মূসক কর্তৃপক্ষ',
          ),
        ),
        ListView.builder(
            itemCount: chapter11.length,
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemBuilder: (context, index) {
              return chapter11[index];
            }),
        SizedBox(
          height: 2,
        ),
        ///////////////////12

        InkWell(
          onTap: () {
            setState(() {
              if (chap12show) {
                chap12show = false;
                chapter12.clear();
              } else {
                chap12show = true;
                chapter12.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter12.add(ChapRow(
                  name: 'করদাতার কর সংশ্লিষ্ট কার্যক্রম নিরীক্ষা',
                  num: '৬৬ক',
                  leftalignment: 5.0,
                  colorno: '1',
                  dir: 'rule',
                ));

                chapter12.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter12.add(ChapRow(
                  name: 'তত্ত্বাবধানাধীন সরবরাহ, পর্যবেক্ষণ ও নজরদারি',
                  num: '৬৬',
                  leftalignment: 15.0,
                  colorno: '0',
                  dir: 'rule',
                ));

                chapter12.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter12.add(ChapRow(
                  name: 'বিশেষ নিরীক্ষা সম্পন্নের লক্ষ্যে নিরীক্ষক নিয়োগ',
                  num: '৬৭',
                  leftalignment: 15.0,
                  colorno: '1',
                  dir: 'rule',
                ));

                chapter12.add(
                  SizedBox(
                    height: 1,
                  ),
                );
              }
            });
          },

          ///13
          child: Heading(
            chapno: 'ত্রয়োদশ অধ্যায়',
            chapitle: 'নিরীক্ষা এবং অনুসন্ধান',
          ),
        ),
        ListView.builder(
            itemCount: chapter12.length,
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemBuilder: (context, index) {
              return chapter12[index];
            }),
        SizedBox(
          height: 2,
        ),
        ///////////////////13

        InkWell(
          onTap: () {
            setState(() {
              if (chap13show) {
                chap13show = false;
                chapter13.clear();
              } else {
                chap13show = true;
                chapter13.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter13.add(ChapRow(
                  name: 'বকেয়া কর আদায়ের সাধারণ পদ্ধতি',
                  num: '৬৮',
                  leftalignment: 15.0,
                  colorno: '0',
                  dir: 'rule',
                ));

                chapter13.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter13.add(ChapRow(
                  name:
                      'কোনো আয়কর, শুল্ক, মূসক বা আবগারি কর্তৃপক্ষের নিয়ন্ত্রনাধীন অর্থ হইতে কর্তন পদ্ধতি',
                  num: '৬৯',
                  leftalignment: 15.0,
                  colorno: '1',
                  dir: 'rule',
                ));

                chapter13.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter13.add(ChapRow(
                  name:
                      'কোন ব্যক্তি, সহযোগী বা আর্থিক প্রতিষ্ঠান বা ব্যাংক হইতে কর্তন পদ্ধতি',
                  num: '৭০',
                  leftalignment: 15.0,
                  colorno: '0',
                  dir: 'rule',
                ));

                chapter13.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter13.add(ChapRow(
                  name:
                      'কোন খেলাপি করদাতার ব্যাংক হিসাব অপরিচালনযোগ্য করিবার পদ্ধতি',
                  num: '৭১',
                  leftalignment: 15.0,
                  colorno: '1',
                  dir: 'rule',
                ));

                chapter13.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter13.add(ChapRow(
                  name:
                      'কোন খেলাপি করদাতার ব্যবসায় অঙ্গন তালাবদ্ধ করিবার পদ্ধতি',
                  num: '৭২',
                  leftalignment: 15.0,
                  colorno: '0',
                  dir: 'rule',
                ));

                chapter13.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter13.add(ChapRow(
                  name: 'কোন খেলাপি করদাতার অস্থাবর সম্পত্তি জব্দকরণ পদ্ধতি',
                  num: '৭৩',
                  leftalignment: 10.0,
                  colorno: '1',
                  dir: 'rule',
                ));

                chapter13.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter13.add(ChapRow(
                  name: 'কোন খেলাপি করদাতার স্থাবর সম্পত্তি ক্রোক পদ্ধতি',
                  num: '৭৪',
                  leftalignment: 10.0,
                  colorno: '0',
                  dir: 'rule',
                ));

                chapter13.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter13.add(ChapRow(
                  name:
                      'কোন খেলাপি করদাতার অস্থাবর সম্পত্তি জব্দকরণ বা স্থাবর সম্পত্তি ক্রোকের আদেশ জারি',
                  num: '৭৫',
                  leftalignment: 10.0,
                  colorno: '1',
                  dir: 'rule',
                ));

                chapter13.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter13.add(ChapRow(
                  name: 'খেলাপি করদাতার ব্যবসা অঙ্গন তালাবদ্ধকরণ-',

                  /*'খেলাপি করদাতার ব্যবসা অঙ্গন তালাবদ্ধকরণ, অস্থাবর সম্পত্তি জব্দকরণ বা স্থাবর সম্পত্তি ক্রোককরণের অসহযোগিতা বা বাধা প্রদান',*/
                  num: '৭৬',
                  leftalignment: 10.0,
                  colorno: '0',
                  dir: 'rule',
                ));

                chapter13.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter13.add(ChapRow(
                  name: 'সুদ, খরচ, চার্জ ইত্যাদি',
                  num: '৭৭',
                  leftalignment: 10.0,
                  colorno: '1',
                  dir: 'rule',
                ));

                chapter13.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter13.add(ChapRow(
                  name: 'যে সম্পত্তি ক্রোক বা জব্দ করা যাইবে না',
                  num: '৭৮',
                  leftalignment: 10.0,
                  colorno: '0',
                  dir: 'rule',
                ));

                chapter13.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter13.add(ChapRow(
                  name: 'ডিক্রি স্থগিতকরণ',
                  num: '৭৯',
                  leftalignment: 10.0,
                  colorno: '1',
                  dir: 'rule',
                ));

                chapter13.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter13.add(ChapRow(
                  name: 'কর্মচারীর বেতন স্থগিতকরণ',
                  num: '৮০',
                  leftalignment: 10.0,
                  colorno: '0',
                  dir: 'rule',
                ));

                chapter13.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter13.add(ChapRow(
                  name: 'শেয়ার বা হস্তান্তরযোগ্য দলিল জব্দকরণ',
                  num: '৮১',
                  leftalignment: 10.0,
                  colorno: '1',
                  dir: 'rule',
                ));

                chapter13.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter13.add(ChapRow(
                  name:
                      'ব্যাংক বা গণকর্মচারীর তত্ত্বাবধানে থাকা সম্পদ ক্রোক বা জব্দকরণ',
                  num: '৮২',
                  leftalignment: 10.0,
                  colorno: '0',
                  dir: 'rule',
                ));

                chapter13.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter13.add(ChapRow(
                  name: 'কোন যৌথ মালিকানার সম্পত্তি ক্রোক বা জব্দকরণ',
                  num: '৮৩',
                  leftalignment: 10.0,
                  colorno: '1',
                  dir: 'rule',
                ));

                chapter13.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter13.add(ChapRow(
                  name:
                      'সম্পত্তি ক্রোক বা জব্দকরনের পূর্বে উহার তালিকা প্রস্তুতকরণ',
                  num: '৮৪',
                  leftalignment: 10.0,
                  colorno: '0',
                  dir: 'rule',
                ));

                chapter13.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter13.add(ChapRow(
                  name: 'সম্পত্তি ক্রোক বা জব্দকরণের সময়',
                  num: '৮৫',
                  leftalignment: 10.0,
                  colorno: '1',
                  dir: 'rule',
                ));

                chapter13.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter13.add(ChapRow(
                  name: 'সম্পত্তি ক্রোক বা জব্দকরণের সীমা',
                  num: '৮৬',
                  leftalignment: 10.0,
                  colorno: '0',
                  dir: 'rule',
                ));

                chapter13.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter13.add(ChapRow(
                  name:
                      'সম্পত্তি ক্রোক বা জব্দকরণের জন্য উহাতে প্রবেশের ক্ষমতা',
                  num: '৮৭',
                  leftalignment: 10.0,
                  colorno: '1',
                  dir: 'rule',
                ));

                chapter13.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter13.add(ChapRow(
                  name:
                      'সম্পত্তি ক্রোক বা জব্দকরণের জন্য পুলিশসহ সরকারী-বেসরকারী কর্মকর্তার সহায়তা',
                  num: '৮৮',
                  leftalignment: 10.0,
                  colorno: '0',
                  dir: 'rule',
                ));

                chapter13.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter13.add(ChapRow(
                  name:
                      'স্থাবর সম্পত্তি ক্রোক বা অস্থাবর সম্পত্তি জব্দের ক্ষেত্রে বকেয়া আদায়-',
                  num: '৮৯',
                  leftalignment: 10.0,
                  colorno: '1',
                  dir: 'rule',
                ));

                chapter13.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter13.add(ChapRow(
                  name:
                      'কোন খেলাপি করদাতার ক্রোকি স্থাবর সম্পত্তি বা জব্দকৃত অস্থাবর সম্পত্তি বিক্রয়ের পদ্ধতি',
                  num: '৯০',
                  leftalignment: 10.0,
                  colorno: '0',
                  dir: 'rule',
                ));

                chapter13.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter13.add(ChapRow(
                  name:
                      'কোন খেলাপি করদাতার ক্রোকি স্থাবর সম্পত্তি বা জব্দকৃত অস্থাবর সম্পত্তি জব্দকরণের সার্টিফিকেট প্রত্যাহার',
                  num: '৯১',
                  leftalignment: 10.0,
                  colorno: '1',
                  dir: 'rule',
                ));

                chapter13.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter13.add(ChapRow(
                  name: 'খেলাপি করদাতার কোন জিম্মাদারের নিকট হইতে জামানত গ্রহণ',
                  num: '৯২',
                  leftalignment: 10.0,
                  colorno: '0',
                  dir: 'rule',
                ));

                chapter13.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter13.add(ChapRow(
                  name: 'রিসিভার কর্তৃক কর পরিশোধের পদ্ধতি',
                  num: '৯৩',
                  leftalignment: 10.0,
                  colorno: '1',
                  dir: 'rule',
                ));

                chapter13.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter13.add(ChapRow(
                  name: 'বকেয়া কর কিস্তিতে পরিশোধের পদ্ধতি',
                  num: '৯৪',
                  leftalignment: 10.0,
                  colorno: '0',
                  dir: 'rule',
                ));

                chapter13.add(
                  SizedBox(
                    height: 1,
                  ),
                );
              }
            });
          },

          ///14
          child: Heading(
            chapno: 'চতুর্দশ অধ্যায়',
            chapitle: 'বকেয়া কর আদায়',
          ),
        ),
        ListView.builder(
            itemCount: chapter13.length,
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemBuilder: (context, index) {
              return chapter13[index];
            }),
        SizedBox(
          height: 2,
        ),

        //////////////////14

        InkWell(
          onTap: () {
            setState(() {
              if (chap14show) {
                chap14show = false;
                chapter14.clear();
              } else {
                chap14show = true;
                chapter14.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter14.add(ChapRow(
                  name: 'রেকর্ড এবং হিসাব সংরক্ষণ',
                  num: '৯৫',
                  leftalignment: 15.0,
                  colorno: '0',
                  dir: 'rule',
                ));

                chapter14.add(
                  SizedBox(
                    height: 1,
                  ),
                );
              }
            });
          },

          ///15
          child: Heading(
            chapno: 'পঞ্চদশ অধ্যায়',
            chapitle: 'ফরম, নোটিশ এবং রেকর্ডপত্র  সংরক্ষণ',
          ),
        ),
        ListView.builder(
            itemCount: chapter14.length,
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemBuilder: (context, index) {
              return chapter14[index];
            }),
        SizedBox(
          height: 2,
        ),

        /////////////////15

        InkWell(
          onTap: () {
            setState(() {
              if (chap15show) {
                chap15show = false;
                chapter15.clear();
              } else {
                chap15show = true;
                chapter15.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter15.add(ChapRow(
                  name: 'অপরাধের তদন্ত পদ্ধতি',
                  num: '৯৬',
                  leftalignment: 15.0,
                  colorno: '0',
                  dir: 'rule',
                ));

                chapter15.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter15.add(ChapRow(
                  name: 'অপরাধের আপোষরফার পদ্ধতি',
                  num: '৯৭',
                  leftalignment: 15.0,
                  colorno: '1',
                  dir: 'rule',
                ));

                chapter15.add(
                  SizedBox(
                    height: 1,
                  ),
                );
              }
            });
          },

          ///16
          child: Heading(
            chapno: 'ষোড়শ অধ্যায়',
            chapitle: 'অপরাধ, বিচার ও দন্ড',
          ),
        ),
        ListView.builder(
            itemCount: chapter15.length,
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemBuilder: (context, index) {
              return chapter15[index];
            }),
        SizedBox(
          height: 2,
        ),
        //////////////////16
        InkWell(
          onTap: () {
            setState(() {
              if (chap16show) {
                chap16show = false;
                chapter16.clear();
              } else {
                chap16show = true;
                chapter16.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter16.add(ChapRow(
                  name: 'কমিশনার (আপিল) এর নিকট আপিল ও উহার নিষ্পত্তির পদ্ধতি',
                  num: '৯৮',
                  leftalignment: 15.0,
                  colorno: '0',
                  dir: 'rule',
                ));

                chapter16.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter16.add(ChapRow(
                  name: 'বিকল্প বিরোধ নিষ্পত্তির পদ্ধতি',
                  num: '৯৯',
                  leftalignment: 15.0,
                  colorno: '1',
                  dir: 'rule',
                ));

                chapter16.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter16.add(ChapRow(
                  name: 'সহায়তাকারীর বিরুদ্ধে আপত্তি',
                  num: '১০০',
                  leftalignment: 10.0,
                  colorno: '0',
                  dir: 'rule',
                ));

                chapter16.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter16.add(ChapRow(
                  name: 'সহায়তাকারীর যোগ্যতা, নিয়োগ এবং তালিকা',
                  num: '১০১',
                  leftalignment: 10.0,
                  colorno: '1',
                  dir: 'rule',
                ));

                chapter16.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter16.add(ChapRow(
                  name: 'সহায়তাকারীর দায়িত্ব ও কর্তব্য',
                  num: '১০২',
                  leftalignment: 10.0,
                  colorno: '0',
                  dir: 'rule',
                ));

                chapter16.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter16.add(ChapRow(
                  name: 'সহায়তাকারীর আচরণ-বিধি',
                  num: '১০৩',
                  leftalignment: 10.0,
                  colorno: '1',
                  dir: 'rule',
                ));

                chapter16.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter16.add(ChapRow(
                  name: 'স্বার্থের দ্বন্দ',
                  num: '১০৪',
                  leftalignment: 10.0,
                  colorno: '0',
                  dir: 'rule',
                ));

                chapter16.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter16.add(ChapRow(
                  name:
                      'বিকল্প বিরোধ নিষ্পত্তির ক্ষেত্রে আবেদনকারীর অধিকার ও দায়িত্ব',
                  num: '১০৫',
                  leftalignment: 10.0,
                  colorno: '1',
                  dir: 'rule',
                ));

                chapter16.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter16.add(ChapRow(
                  name:
                      'মূল্য সংযোজন কর বিভাগের জন্য বিভাগীয় সহায়তাকারী মনোনয়ন',
                  num: '১০৬',
                  leftalignment: 10.0,
                  colorno: '0',
                  dir: 'rule',
                ));

                chapter16.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter16.add(ChapRow(
                  name: 'সহায়তাকারীর সম্মানী',
                  num: '১০৭',
                  leftalignment: 10.0,
                  colorno: '1',
                  dir: 'rule',
                ));

                chapter16.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter16.add(ChapRow(
                  name: 'অধিকার সংরক্ষণ',
                  num: '১০৮',
                  leftalignment: 10.0,
                  colorno: '0',
                  dir: 'rule',
                ));

                chapter16.add(
                  SizedBox(
                    height: 1,
                  ),
                );
              }
            });
          },

          ///17
          child: Heading(
            chapno: 'সপ্তদশ অধ্যায়',
            chapitle: 'আপীল ও রিভিশন',
          ),
        ),
        ListView.builder(
            itemCount: chapter16.length,
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemBuilder: (context, index) {
              return chapter16[index];
            }),
        SizedBox(
          height: 2,
        ),
        //////////17

        InkWell(
          onTap: () {
            setState(() {
              if (chap17show) {
                chap17show = false;
                chapter17.clear();
              } else {
                chap17show = true;
                chapter17.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter17.add(ChapRow(
                  name: 'মূসক পরামর্শক লাইসেন্স প্রদান পদ্ধতি',
                  num: '১০৯',
                  leftalignment: 10.0,
                  colorno: '0',
                  dir: 'rule',
                ));

                chapter17.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter17.add(ChapRow(
                  name:
                      'মূসক পরামর্শক লাইসেন্সের জন্য আবেদনকারীর যোগ্যতা ও অযোগ্যতা',
                  num: '১১০',
                  leftalignment: 10.0,
                  colorno: '1',
                  dir: 'rule',
                ));

                chapter17.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter17.add(ChapRow(
                  name: 'আবেদনের জন্য প্রয়োজনীয় দলিলাদি',
                  num: '১১১',
                  leftalignment: 10.0,
                  colorno: '0',
                  dir: 'rule',
                ));

                chapter17.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter17.add(ChapRow(
                  name: 'বাতিল',
                  num: '১১২',
                  leftalignment: 10.0,
                  colorno: '1',
                  dir: 'rule',
                ));

                chapter17.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter17.add(ChapRow(
                  name: 'মূসক পরামর্শকের দায়িত্ব',
                  num: '১১৩',
                  leftalignment: 10.0,
                  colorno: '0',
                  dir: 'rule',
                ));

                chapter17.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter17.add(ChapRow(
                  name: 'মূসক পরামর্শকের অপরাধ ও দন্ড',
                  num: '১১৪',
                  leftalignment: 10.0,
                  colorno: '1',
                  dir: 'rule',
                ));

                chapter17.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter17.add(ChapRow(
                  name: 'দলিলপত্রের প্রত্যয়িত অনুলিপি',
                  num: '১১৫',
                  leftalignment: 10.0,
                  colorno: '0',
                  dir: 'rule',
                ));

                chapter17.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter17.add(ChapRow(
                  name: 'মূসক ছাড়পত্র ও সম্মাননাপত্র প্রদানের পদ্ধতি',
                  num: '১১৬',
                  leftalignment: 10.0,
                  colorno: '1',
                  dir: 'rule',
                ));

                chapter17.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter17.add(ChapRow(
                  name: 'মূসক ছাড়পত্র ও সম্মাননাপত্রের ব্যবহার',
                  num: '১১৭',
                  leftalignment: 10.0,
                  colorno: '0',
                  dir: 'rule',
                ));

                chapter17.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter17.add(ChapRow(
                  name:
                      'আদেশ, বিজ্ঞপ্তি, ব্যাখ্যা, পরিপত্র, স্পষ্টিকরণ ইত্যাদি জারির ক্ষমতা',
                  num: '১১৮ক',
                  leftalignment: 2.0,
                  colorno: '1',
                  dir: 'rule',
                ));

                chapter17.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter17.add(ChapRow(
                  name: 'সরবরাহ প্রদান হইতে সাময়িক বিরতির ঘোষণা।',
                  num: '১১৮খ',
                  leftalignment: 2.0,
                  colorno: '0',
                  dir: 'rule',
                ));

                chapter17.add(
                  SizedBox(
                    height: 1,
                  ),
                );

                chapter17.add(ChapRow(
                  name:
                      'মূসক আইন, 1991 এর অধীন চলতি হিসাব (মূসক-18) এ স্থিত সমাপনী জের সমন্বয়',
                  num: '১১৮',
                  leftalignment: 10.0,
                  colorno: '1',
                  dir: 'rule',
                ));

                chapter17.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter17.add(ChapRow(
                  name: 'রহিতকরণ ও হেফাজতকরণ',
                  num: '১১৯',
                  leftalignment: 10.0,
                  colorno: '0',
                  dir: 'rule',
                ));

                chapter17.add(
                  SizedBox(
                    height: 1,
                  ),
                );
              }
            });
          },

          ///18
          child: Heading(
            chapno: 'অষ্টাদশ অধ্যায়',
            chapitle: 'বিবিধ',
          ),
        ),
        ListView.builder(
            itemCount: chapter17.length,
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemBuilder: (context, index) {
              return chapter17[index];
            }),
        SizedBox(
          height: 2,
        ),
      ],
    );
  }
}

/*

         InkWell(
          onTap: () {
            setState(() {
              if (chap8show) {
                chap8show = false;
                chapter8.clear();
              } else {
                chap8show = true;
                chapter13.add(ChapRow(
                  name: 'সম্পূরক শুল্ক আরোপ',
                  num: '১০০',
                  leftalignment: 10.0,
                  colorno: '0',
                ));

                chapter13.add(
                  SizedBox(
                    height: 1,
                  ),
                );
              }
            });
          },
          child: Heading(
            chapno: 'অষ্টম অধ্যায়',
            chapitle: 'দাখিলপত্র পেশ ও উহার সংশোধন',
          ),
        ),
        ListView.builder(
            itemCount: chapter8.length,
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemBuilder: (context, index) {
              return chapter8[index];
            }),
        SizedBox(
          height: 2,
        ),







        */

/*Container(
                  color: Colors.black12,
                  padding: EdgeInsets.all(15),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return Law11();
                      }));
                    },
                    child: Text(
                      "২৬। অব্যাহতিপ্রাপ্ত সরবরাহ বা অব্যাহতিপ্রাপ্ত আমদানি",
                      style: TextStyle(
                          fontSize: 26,
                          color: Colors.black,
                          fontFamily: 'Shobuj Nolua'),
                    ),
                  ),
                )*/
