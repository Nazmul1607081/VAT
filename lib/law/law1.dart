import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:vatapp/components/mydrawer.dart';
import 'headinganddara.dart';

class Law1 extends StatefulWidget {
  @override
  _Law1State createState() => _Law1State();
}

class _Law1State extends State<Law1> {
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
        title: Text('মূল্য সংযোজন কর ও সম্পূরক শুল্ক আইন, ২০১২'),
      ),
      body: Container(
        color: Colors.white,
        child: Law1Body(),
      ),
    );
  }
}

class Law1Body extends StatefulWidget {
  @override
  _Law1BodyState createState() => _Law1BodyState();
}

class _Law1BodyState extends State<Law1Body> {
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
                print("yes");
                chap1show = false;
                chapter1.clear();
              } else {
                print("no");
                chap1show = true;
                chapter1.add(ChapRow(
                  name: 'সংক্ষিপ্ত শিরোনাম ও প্রবর্তন',
                  num: '১',
                  leftalignment: 15.0,
                  colorno: '0',
                  dir: 'law',
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
                  dir: 'law',
                ));

                chapter1.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter1.add(ChapRow(
                  name: 'আইনের প্রাধান্য',
                  num: '৩',
                  leftalignment: 15.0,
                  colorno: '0',
                  dir: 'law',
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
                  name: 'মূসক নিবন্ধনযোগ্য ব্যক্তি',
                  num: '৪',
                  leftalignment: 20.0,
                  colorno: '1',
                  dir: 'law',
                ));
                chapter2.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter2.add(ChapRow(
                  name: 'কেন্দ্রীয় বা শাখা ইউনিটের নিবন্ধন',
                  num: '৫',
                  leftalignment: 20.0,
                  colorno: '0',
                  dir: 'law',
                ));
                chapter2.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter2.add(ChapRow(
                  name: 'মূসক নিবন্ধন',
                  num: '৬',
                  dir: 'law',
                  leftalignment: 20.0,
                  colorno: '1',
                ));

                chapter2.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter2.add(ChapRow(
                  name: 'নিবন্ধিত ব্যক্তিবর্গের তালিকা প্রকাশ ও সংরক্ষণ',
                  num: '৭',
                  leftalignment: 20.0,
                  colorno: '0',
                  dir: 'law',
                ));

                chapter2.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter2.add(ChapRow(
                  name: 'স্বেচ্ছা মূসক নিবন্ধন',
                  num: '৮',
                  leftalignment: 20.0,
                  colorno: '1',
                  dir: 'law',
                ));
                chapter2.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter2.add(ChapRow(
                  name: 'মূসক নিবন্ধন বাতিল',
                  num: '৯',
                  leftalignment: 20.0,
                  dir: 'law',
                  colorno: '0',
                ));
                chapter2.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter2.add(ChapRow(
                  name: 'তালিকাভুক্তিযোগ্য ব্যক্তি ও তালিকাভুক্তি',
                  num: '১০',
                  leftalignment: 15.0,
                  colorno: '1',
                  dir: 'law',
                ));
                chapter2.add(
                  SizedBox(
                    height: 1,
                  ),
                );

                chapter2.add(ChapRow(
                  name: 'তালিকাভুক্তি বাতিল',
                  num: '১১',
                  leftalignment: 15.0,
                  colorno: '0',
                  dir: 'law',
                ));
                chapter2.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter2.add(ChapRow(
                  name:
                      'স্ব-উদ্যোগে নিবন্ধনযোগ্য ও তালিকাভুক্তিযোগ্য ব্যক্তিকে নিবন্ধন বা তালিকাভুক্তিকরণ',
                  num: '১২',
                  leftalignment: 15.0,
                  dir: 'law',
                  colorno: '1',
                ));
                chapter2.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter2.add(ChapRow(
                  name:
                      'সনদপত্র প্রদর্শনে নিবন্ধিত বা তালিকাভুক্ত ব্যক্তির দায়িত্ব',
                  num: '১৩',
                  leftalignment: 15.0,
                  colorno: '0',
                  dir: 'law',
                ));
                chapter2.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter2.add(ChapRow(
                  name:
                      'পরিবর্তিত তথ্য অবহিতকরণে নিবন্ধিত বা তালিকাভু্কত ব্যক্তির দায়িত্ব',
                  num: '১৪',
                  leftalignment: 15.0,
                  dir: 'law',
                  colorno: '1',
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
                  name: 'মূসক আরোপ',
                  num: '১৫',
                  leftalignment: 15.0,
                  colorno: '0',
                  dir: 'law',
                ));

                chapter3.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter3.add(ChapRow(
                  name: 'মূল্য সংযোজন কর পরিশোধে দায়ী ব্যক্তি',
                  num: '১৬',
                  leftalignment: 15.0,
                  colorno: '1',
                  dir: 'law',
                ));

                chapter3.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter3.add(ChapRow(
                  name: 'বাংলাদেশে প্রদত্ত সরবরাহ',
                  num: '১৭',
                  leftalignment: 15.0,
                  colorno: '0',
                  dir: 'law',
                ));

                chapter3.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter3.add(ChapRow(
                  name: 'নিবন্ধিত সরবরাহকারী এবং সরবরাহগ্রহীতা',
                  num: '১৮',
                  leftalignment: 15.0,
                  colorno: '1',
                  dir: 'law',
                ));

                chapter3.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter3.add(ChapRow(
                  name: 'অনাবাসিক ব্যক্তির মূসক এজেন্ট',
                  num: '১৯',
                  leftalignment: 15.0,
                  colorno: '0',
                  dir: 'law',
                ));

                chapter3.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter3.add(ChapRow(
                  num: '২০',
                  name: 'আমদানিকৃত সেবার ক্ষেত্রে গ্রহীতার নিকট হইতে কর আদায়',
                  leftalignment: 15.0,
                  colorno: '1',
                  dir: 'law',
                ));
                chapter3.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter3.add(ChapRow(
                  num: '২১',
                  name: 'শূন্যহার বিশিষ্ট সরবরাহ',
                  leftalignment: 15.0,
                  colorno: '0',
                  dir: 'law',
                ));

                chapter3.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter3.add(ChapRow(
                  name: 'বাংলাদেশের বাহিরে অবস্থিত ভূমি',
                  num: '২২',
                  leftalignment: 15.0,
                  colorno: '1',
                  dir: 'law',
                ));

                chapter3.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter3.add(ChapRow(
                  name: 'রপ্তানির নিমিত্ত পণ্য সরবরাহ',
                  num: '২৩',
                  leftalignment: 15.0,
                  colorno: '0',
                  dir: 'law',
                ));

                chapter3.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter3.add(ChapRow(
                  name: 'শূন্যহার বিশিষ্ট সেবা সরবরাহ',
                  num: '২৪',
                  leftalignment: 15.0,
                  dir: 'law',
                  colorno: '1',
                ));

                chapter3.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter3.add(ChapRow(
                  name: 'ট্রাভেল এজেন্ট এন্ড ট্যুর অপারেটর',
                  num: '২৫',
                  leftalignment: 15.0,
                  dir: 'law',
                  colorno: '0',
                ));

                chapter3.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter3.add(ChapRow(
                  name: 'অব্যাহতিপ্রাপ্ত সরবরাহ বা অব্যাহতিপ্রাপ্ত আমদানি',
                  num: '২৬',
                  leftalignment: 15.0,
                  dir: 'law',
                  colorno: '1',
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
                chap4show = true;
                chapter4.add(ChapRow(
                  name: 'করযোগ্য আমদানির উপর মূসক আদায় পদ্ধতি',
                  num: '২৭',
                  leftalignment: 15.0,
                  colorno: '0',
                  dir: 'law',
                ));

                chapter4.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter4.add(ChapRow(
                  name: 'করযোগ্য আমদানির মূল্য নির্ধারণ ',
                  num: '২৮',
                  leftalignment: 15.0,
                  dir: 'law',
                  colorno: '1',
                ));

                chapter4.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter4.add(ChapRow(
                  name: 'পুনঃআমদানিকৃত পণ্যের মূল্য নির্ধারণ',
                  num: '২৯',
                  leftalignment: 15.0,
                  dir: 'law',
                  colorno: '0',
                ));

                chapter4.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter4.add(ChapRow(
                  name: 'রপ্তানির নিমিত্ত আমদানি',
                  num: '৩০',
                  dir: 'law',
                  leftalignment: 15.0,
                  colorno: '1',
                ));

                chapter4.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter4.add(ChapRow(
                  name: 'আমদানিকালে আগাম কর পরিশোধ ও সমন্বয়',
                  num: '৩১',
                  leftalignment: 15.0,
                  colorno: '0',
                  dir: 'law',
                ));

                chapter4.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter4.add(ChapRow(
                  name: 'করযোগ্য সরবরাহের মূল্য নির্ধারণ',
                  num: '৩২',
                  leftalignment: 15.0,
                  colorno: '1',
                  dir: 'law',
                ));

                chapter4.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter4.add(ChapRow(
                  name: 'বোর্ড কর্তৃক ব্যাখ্যা প্রদান',
                  num: '৩২ক',
                  leftalignment: 5.0,
                  dir: 'law',
                  colorno: '0',
                ));

                chapter4.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter4.add(ChapRow(
                  name: 'করযোগ্য সরবরাহের উপর মূসক প্রদানকাল',
                  num: '৩৩',
                  dir: 'law',
                  leftalignment: 15.0,
                  colorno: '1',
                ));

                chapter4.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter4.add(ChapRow(
                  name: 'আনুক্রমিক বা পর্যাবৃত্ত সরবরাহ',
                  num: '৩৪',
                  leftalignment: 15.0,
                  colorno: '0',
                  dir: 'law',
                ));

                chapter4.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter4.add(ChapRow(
                  name: 'একক ও বহুবিধ সরবরাহ',
                  num: '৩৫',
                  leftalignment: 15.0,
                  colorno: '1',
                  dir: 'law',
                ));

                chapter4.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter4.add(ChapRow(
                  name: 'চলমান ব্যবসা হিসাবে প্রতিষ্ঠান বিক্রয়',
                  num: '৩৬',
                  leftalignment: 15.0,
                  colorno: '0',
                  dir: 'law',
                ));

                chapter4.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter4.add(ChapRow(
                  name: 'অধিকার',
                  num: '৩৭',
                  leftalignment: 15.0,
                  dir: 'law',
                  colorno: '1',
                ));

                chapter4.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter4.add(ChapRow(
                  name: 'আগাম মূল্য পরিশোধিত টেলিযোগাযোগ দ্রব্য ও সেবা সরবরাহ',
                  num: '৩৮',
                  leftalignment: 15.0,
                  colorno: '0',
                  dir: 'law',
                ));

                chapter4.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter4.add(ChapRow(
                  name:
                      'লটারী, লাকি ড্র, হাউজি, র‌্যাফেল ড্র এবং অনুরূপ উদ্যোগ',
                  num: '৩৯',
                  leftalignment: 15.0,
                  dir: 'law',
                  colorno: '1',
                ));

                chapter4.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter4.add(ChapRow(
                  name:
                      'কর্মচারী বা কর্মকর্তাকে নগদ অর্থের পরির্তে দ্রব্যের মাধ্যমে প্রদত্ত সুবিধার মূল্য',
                  num: '৪০',
                  leftalignment: 15.0,
                  colorno: '0',
                  dir: 'law',
                ));

                chapter4.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter4.add(ChapRow(
                  name: 'কিস্তিতে পণ্য বিক্রয়',
                  num: '৪১',
                  leftalignment: 15.0,
                  dir: 'law',
                  colorno: '1',
                ));

                chapter4.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter4.add(ChapRow(
                  name: 'বাতিলকৃত লেনদেন',
                  num: '৪২',
                  leftalignment: 15.0,
                  dir: 'law',
                  colorno: '0',
                ));

                chapter4.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter4.add(ChapRow(
                  name: 'ঋণ পরিশোধে সম্পত্তি বিক্রয়',
                  num: '৪৩',
                  leftalignment: 15.0,
                  dir: 'law',
                  colorno: '1',
                ));

                chapter4.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter4.add(ChapRow(
                  name: 'বিক্রয় যন্ত্র',
                  num: '৪৪',
                  leftalignment: 15.0,
                  dir: 'law',
                  colorno: '0',
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
                chapter5.add(ChapRow(
                  name: 'সরবরাহের উপর প্রদেয় নীট কর নিরূপন ও পরিশোধ পদ্ধতি',
                  num: '৪৫',
                  leftalignment: 15.0,
                  colorno: '0',
                  dir: 'law',
                ));

                chapter5.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter5.add(ChapRow(
                  name: 'উপকরণ কর রেয়াত',
                  num: '৪৬',
                  leftalignment: 15.0,
                  colorno: '1',
                  dir: 'law',
                ));

                chapter5.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter5.add(ChapRow(
                  name: 'আংশিক উপকরণ কর রেয়াত',
                  num: '৪৭',
                  leftalignment: 15.0,
                  colorno: '0',
                  dir: 'law',
                ));

                chapter5.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter5.add(ChapRow(
                  name: 'সমন্বয়',
                  num: '৪৮',
                  leftalignment: 15.0,
                  colorno: '1',
                  dir: 'law',
                ));

                chapter5.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter5.add(ChapRow(
                  name:
                      'উৎসে কর কর্তনকারী সত্তা কর্তৃক উৎসে কর কর্তন ও বৃদ্ধিকারী সমন্বয়',
                  num: '৪৯',
                  leftalignment: 15.0,
                  colorno: '0',
                  dir: 'law',
                ));

                chapter5.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter5.add(ChapRow(
                  name: 'উৎসে কর কর্তনের পর সরবরাহকারী কর্তৃক হ্রাসকারী সমন্বয়',
                  num: '৫০',
                  leftalignment: 15.0,
                  colorno: '1',
                  dir: 'law',
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
                chapter6.add(ChapRow(
                  name: 'কর চালানপত্র',
                  num: '৫১',
                  leftalignment: 15.0,
                  colorno: '0',
                  dir: 'law',
                ));

                chapter6.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter6.add(ChapRow(
                  name: 'ক্রেডিট নোট এবং ডেবিট নোট',
                  num: '৫২',
                  leftalignment: 15.0,
                  dir: 'law',
                  colorno: '1',
                ));

                chapter6.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter6.add(ChapRow(
                  name: 'সমন্বিত কর চালানপত্র এবং উৎসে কর কর্তন সনদপত্র',
                  num: '৫৩',
                  leftalignment: 15.0,
                  dir: 'law',
                  colorno: '0',
                ));

                chapter6.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter6.add(ChapRow(
                  name: 'কর দলিলাদি সংক্রান্ত অন্যান্য বিধান',
                  num: '৫৪',
                  leftalignment: 15.0,
                  colorno: '1',
                  dir: 'law',
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
                chapter7.add(ChapRow(
                  name: 'সম্পূরক শুল্ক আরোপ',
                  num: '৫৫',
                  leftalignment: 15.0,
                  dir: 'law',
                  colorno: '0',
                ));

                chapter7.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter7.add(ChapRow(
                  name: 'সম্পূরক শুল্ক পরিশোধে দায়ী ব্যক্তি',
                  num: '৫৬',
                  leftalignment: 15.0,
                  colorno: '1',
                  dir: 'law',
                ));

                chapter7.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter7.add(ChapRow(
                  name: 'সম্পূরক শুল্ক আরোপযোগ্য মূল্য',
                  num: '৫৭',
                  leftalignment: 15.0,
                  colorno: '0',
                  dir: 'law',
                ));

                chapter7.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter7.add(ChapRow(
                  name: 'তামাক এবং এলকোহলযু্ক্ত পণ্যের ক্ষেত্রে বিশেষ পরিকল্প',
                  num: '৫৮',
                  leftalignment: 15.0,
                  colorno: '1',
                  dir: 'law',
                ));

                chapter7.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter7.add(ChapRow(
                  name: 'আমদানির উপর সম্পূরক শুল্ক আদায়',
                  num: '৫৯',
                  leftalignment: 15.0,
                  colorno: '0',
                  dir: 'law',
                ));

                chapter7.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter7.add(ChapRow(
                  name: 'সরবরাহের উপর সম্পূরক শুল্ক আদায়',
                  num: '৬০',
                  leftalignment: 15.0,
                  colorno: '1',
                  dir: 'law',
                ));

                chapter7.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter7.add(ChapRow(
                  name: 'সম্পূরক শুল্ক আদায়যোগ্য পণ্যের অনুমিত সরবরাহ',
                  num: '৬১',
                  leftalignment: 15.0,
                  colorno: '0',
                  dir: 'law',
                ));

                chapter7.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter7.add(ChapRow(
                  name: 'সম্পূরক শুল্কের নিমিত্ত হ্রাসকারী সমন্বয়',
                  num: '৬২',
                  leftalignment: 15.0,
                  colorno: '1',
                  dir: 'law',
                ));

                chapter7.add(
                  SizedBox(
                    height: 1,
                  ),
                );
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
                  name: 'টার্ণওভার কর আরোপ ও আদায়',
                  num: '৬৩',
                  leftalignment: 15.0,
                  colorno: '0',
                  dir: 'law',
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

        /////////8888888888

        InkWell(
          onTap: () {
            setState(() {
              if (chap8show) {
                chap8show = false;
                chapter8.clear();
              } else {
                chap8show = true;
                chapter8.add(ChapRow(
                  name: 'দাখিলপত্র পেশ',
                  num: '৬৪',
                  leftalignment: 15.0,
                  colorno: '0',
                  dir: 'law',
                ));

                chapter8.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter8.add(ChapRow(
                  name: 'বিলম্বে দাখিলপত্র পেশ',
                  num: '৬৫',
                  leftalignment: 15.0,
                  colorno: '1',
                  dir: 'law',
                ));

                chapter8.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter8.add(ChapRow(
                  name: 'দাখিলপত্রে সংশোধন',
                  num: '৬৬',
                  leftalignment: 15.0,
                  colorno: '0',
                  dir: 'law',
                ));

                chapter8.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter8.add(ChapRow(
                  name: 'পূর্ণ, অতিরিক্ত বা বিকল্প দাখিলপত্র পেশ',
                  num: '৬৭',
                  leftalignment: 15.0,
                  colorno: '1',
                  dir: 'law',
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

        /////////////৯৯৯৯৯৯৯৯৯৯৯৯৯৯৯

        InkWell(
          onTap: () {
            setState(() {
              if (chap9show) {
                chap9show = false;
                chapter9.clear();
              } else {
                chap9show = true;
                chapter9.add(ChapRow(
                  name: 'ঋণাত্মক নীট অর্থ জের টানা ও ফেরত প্রদান',
                  num: '৬৮',
                  leftalignment: 15.0,
                  colorno: '0',
                  dir: 'law',
                ));

                chapter9.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter9.add(ChapRow(
                  name: 'ঋণাত্মক নীট অর্থ জের টানা ব্যতিরেকে ফেরত প্রদান',
                  num: '৬৯',
                  leftalignment: 15.0,
                  colorno: '1',
                  dir: 'law',
                ));

                chapter9.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter9.add(ChapRow(
                  name: 'ফেরত প্রদত্ত অর্থের প্রয়োগ',
                  num: '৭০',
                  leftalignment: 15.0,
                  colorno: '0',
                  dir: 'law',
                ));

                chapter9.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter9.add(ChapRow(
                  name:
                      'কূটনৈতিক এবং অন্যান্য আন্তর্জাতিক সংস্থা কর্তৃক প্রদত্ত কর ফেরত প্রদান',
                  num: '৭১',
                  leftalignment: 15.0,
                  colorno: '1',
                  dir: 'law',
                ));

                chapter9.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter9.add(ChapRow(
                  name: 'অতিরিক্ত পরিশোধিত কর সমন্বয় বা ফেরত প্রদান',
                  num: '৭২',
                  leftalignment: 15.0,
                  colorno: '0',
                  dir: 'law',
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
                chapter10.add(ChapRow(
                  name: 'কর নির্ধারণ',
                  num: '৭৩',
                  leftalignment: 15.0,
                  colorno: '0',
                  dir: 'law',
                ));

                chapter10.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter10.add(ChapRow(
                  name: 'সরবরাহ গ্রহীতার মিথ্যা ঘোষণা',
                  num: '৭৪',
                  leftalignment: 15.0,
                  colorno: '1',
                  dir: 'law',
                ));

                chapter10.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter10.add(ChapRow(
                  name: 'সরবরাহকারীর মিথ্যা বর্ণনা',
                  num: '৭৫',
                  leftalignment: 15.0,
                  colorno: '0',
                  dir: 'law',
                ));

                chapter10.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter10.add(ChapRow(
                  name: 'কর সুবিধা প্রদান ও রদকরণ',
                  num: '৭৬',
                  leftalignment: 15.0,
                  colorno: '1',
                  dir: 'law',
                ));

                chapter10.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter10.add(ChapRow(
                  name: 'কর নির্ধারণী নোটিশের গ্রহণযোগ্যতা',
                  num: '৭৭',
                  leftalignment: 15.0,
                  colorno: '0',
                  dir: 'law',
                ));

                chapter10.add(
                  SizedBox(
                    height: 1,
                  ),
                );
              }
            });
          },
          child: Heading(
            chapno: 'একাদশ অধ্যায়',
            chapitle: 'কমিশনার কর্তৃক কর নির্ধারণ',
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
                chapter11.add(ChapRow(
                  name: 'মূল্য সংযোজন কর কর্তৃপক্ষ এবং উহার কর্মকর্তা',
                  num: '৭৮',
                  leftalignment: 15.0,
                  colorno: '0',
                  dir: 'law',
                ));

                chapter11.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter11.add(ChapRow(
                  name: 'মূসক কর্তৃপক্ষের দায়িত্ব এবং কর্তব্য',
                  num: '৭৯',
                  leftalignment: 15.0,
                  colorno: '1',
                  dir: 'law',
                ));

                chapter11.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter11.add(ChapRow(
                  name:
                      'মূসক কর্মকর্তার আদেশ বা সিদ্ধান্ত সংশোধনে বোর্ডের ক্ষমতা',
                  num: '৮০',
                  leftalignment: 15.0,
                  colorno: '0',
                  dir: 'law',
                ));

                chapter11.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter11.add(ChapRow(
                  name: 'ক্ষমতা অর্পণ',
                  num: '৮১',
                  leftalignment: 15.0,
                  colorno: '1',
                  dir: 'law',
                ));

                chapter11.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter11.add(ChapRow(
                  name: 'মূসক কর্মকর্তাকে সহায়তা প্রদান',
                  num: '৮২',
                  leftalignment: 15.0,
                  colorno: '0',
                  dir: 'law',
                ));

                chapter11.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter11.add(ChapRow(
                  name: 'মূসক কর্মকর্তার প্রবেশ ও তল্লাশির ক্ষমতা',
                  num: '৮৩',
                  leftalignment: 15.0,
                  colorno: '1',
                  dir: 'law',
                ));

                chapter11.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter11.add(ChapRow(
                  name: 'পণ্য জব্দকরণ ও উহার নিষ্পত্তি',
                  num: '৮৪',
                  leftalignment: 15.0,
                  dir: 'law',
                  colorno: '0',
                ));

                chapter11.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter11.add(ChapRow(
                  name: 'ব্যর্থতা বা অনিয়মের ক্ষেত্রে জরিমানা আরোপ',
                  num: '৮৫',
                  leftalignment: 15.0,
                  dir: 'law',
                  colorno: '1',
                ));

                chapter11.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter11.add(ChapRow(
                  name:
                      'ন্যায় নির্ণয়ার্থ কাযধারা গ্রহণে মূসক কর্মকর্তাগণের আর্থিক সীমা',
                  num: '৮৬',
                  leftalignment: 15.0,
                  colorno: '0',
                  dir: 'law',
                ));

                chapter11.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter11.add(ChapRow(
                  name: 'সমন প্রেরণ',
                  num: '৮৭',
                  leftalignment: 15.0,
                  colorno: '1',
                  dir: 'law',
                ));

                chapter11.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter11.add(ChapRow(
                  name: 'শুল্ক কর্মকর্তাগণের দায়িত্ব এবং ক্ষমতা',
                  num: '৮৮',
                  leftalignment: 15.0,
                  colorno: '0',
                  dir: 'law',
                ));

                chapter11.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter11.add(ChapRow(
                  name: 'গোপনীয়তা',
                  num: '৮৯',
                  leftalignment: 15.0,
                  colorno: '1',
                  dir: 'law',
                ));

                chapter11.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter11.add(ChapRow(
                  name: 'গোপনীয়তা',
                  num: '৮৯ক',
                  leftalignment: 5.0,
                  colorno: '0',
                  dir: 'law',
                ));

                chapter11.add(
                  SizedBox(
                    height: 1,
                  ),
                );
              }
            });
          },
          child: Heading(
            chapno: 'একাদশ অধ্যায়',
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
                chapter12.add(ChapRow(
                  name: 'করদাতা অর্থনৈতিক কার্যক্রম নিরীক্ষা এবং অনুসন্ধান',
                  num: '৯০',
                  leftalignment: 15.0,
                  colorno: '0',
                  dir: 'law',
                ));

                chapter12.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter12.add(ChapRow(
                  name: 'মূসক কর্মকর্তাগণের ক্ষমতা',
                  num: '৯১',
                  leftalignment: 15.0,
                  dir: 'law',
                  colorno: '1',
                ));

                chapter12.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter12.add(ChapRow(
                  name: 'তত্ত্বাবধানাধীন সরবরাহ, পর্যবেক্ষণ ও নজরদারী',
                  num: '৯২',
                  leftalignment: 15.0,
                  dir: 'law',
                  colorno: '0',
                ));

                chapter12.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter12.add(ChapRow(
                  name: 'একাধিক দাপ্তরিক নিরীক্ষা',
                  num: '৯৩',
                  leftalignment: 15.0,
                  dir: 'law',
                  colorno: '1',
                ));

                chapter12.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter12.add(ChapRow(
                  name: 'বিশেষ নিরীক্ষা',
                  num: '৯৪',
                  leftalignment: 15.0,
                  colorno: '0',
                  dir: 'law',
                ));

                chapter12.add(
                  SizedBox(
                    height: 1,
                  ),
                );
              }
            });
          },
          child: Heading(
            chapno: 'দ্বাদশ অধ্যায়',
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
                chapter13.add(ChapRow(
                  name: 'বকেয়া কর আদায়',
                  num: '৯৫',
                  leftalignment: 15.0,
                  colorno: '0',
                  dir: 'law',
                ));

                chapter13.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter13.add(ChapRow(
                  name: 'দেওয়ানী কাযবিধির অধীন মূসক কর্মকর্তার ক্ষমতা',
                  num: '৯৬',
                  leftalignment: 15.0,
                  dir: 'law',
                  colorno: '1',
                ));

                chapter13.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter13.add(ChapRow(
                  name: 'বকেয়া কর আদায়ের ক্ষেত্রে অধিক্ষেত্রের পরিবর্তন',
                  num: '৯৭',
                  leftalignment: 15.0,
                  colorno: '0',
                  dir: 'law',
                ));

                chapter13.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter13.add(ChapRow(
                  name: 'আদায়কৃত অর্থ বা জামানতের বিলিবন্টন',
                  num: '৯৮',
                  leftalignment: 15.0,
                  colorno: '1',
                  dir: 'law',
                ));

                chapter13.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter13.add(ChapRow(
                  name:
                      'খেলাপি করদাতার স্থাবর সম্পত্তির উপর সরকারের পূর্বস্বত্ব ও উহার ক্রোক',
                  num: '৯৯',
                  leftalignment: 15.0,
                  colorno: '0',
                  dir: 'law',
                ));

                chapter13.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter13.add(ChapRow(
                  name:
                      'পণ্য জব্দকরণ, উহার বিক্রয় ও বিক্রয়লব্ধ অর্থের বিলিবন্টন',
                  num: '১০০',
                  leftalignment: 10.0,
                  colorno: '1',
                  dir: 'law',
                ));

                chapter13.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter13.add(ChapRow(
                  name: 'প্রতিনিধির দায়িত্ব এবং বাধ্যবাধকতা',
                  num: '১০১',
                  leftalignment: 10.0,
                  colorno: '0',
                  dir: 'law',
                ));

                chapter13.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter13.add(ChapRow(
                  name: 'রিসিভারের দায়িত্ব',
                  num: '১০২',
                  leftalignment: 10.0,
                  colorno: '1',
                  dir: 'law',
                ));

                chapter13.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter13.add(ChapRow(
                  name:
                      'কোম্পানি বা ব্যক্তি সংঘ বা সম্পত্তি উন্নয়নে যৌথ উদ্যোগের পরিচালক বা উদ্যোক্তার দায়',
                  num: '১০৩',
                  leftalignment: 10.0,
                  colorno: '0',
                  dir: 'law',
                ));

                chapter13.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter13.add(ChapRow(
                  name: 'অংশিদারী কারবার বা অনিগমিত সংঘের ধারাবাহিকতা',
                  num: '১০৪',
                  leftalignment: 10.0,
                  colorno: '1',
                  dir: 'law',
                ));

                chapter13.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter13.add(ChapRow(
                  name: 'করদাতার মৃত্যু বা দেউলিয়াত্ব ঘোষণা',
                  num: '১০৫',
                  leftalignment: 10.0,
                  colorno: '0',
                  dir: 'law',
                ));

                chapter13.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter13.add(ChapRow(
                  name: 'বকেয়া কর কিস্তিতে পরিশোধ',
                  num: '১০৬',
                  leftalignment: 10.0,
                  colorno: '1',
                  dir: 'law',
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
            chapno: 'ত্রয়োদশ অধ্যায়',
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
                chapter14.add(ChapRow(
                  name: 'রেকর্ডপত্র এবং হিসাব রক্ষণ',
                  num: '১০৭',
                  leftalignment: 10.0,
                  colorno: '0',
                  dir: 'law',
                ));

                chapter14.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter14.add(ChapRow(
                  name: 'ফরম, নোটিশ এবং দলিলপত্রের সত্যায়ন',
                  num: '১০৮',
                  leftalignment: 10.0,
                  colorno: '1',
                  dir: 'law',
                ));

                chapter14.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter14.add(ChapRow(
                  name: 'নোটিশ জারি',
                  num: '১০৯',
                  leftalignment: 10.0,
                  colorno: '0',
                  dir: 'law',
                ));

                chapter14.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter14.add(ChapRow(
                  name: 'দলিলপত্রের বৈধতা',
                  num: '১১০',
                  leftalignment: 10.0,
                  colorno: '1',
                  dir: 'law',
                ));

                chapter14.add(
                  SizedBox(
                    height: 1,
                  ),
                );
              }
            });
          },
          child: Heading(
            chapno: 'চতুর্দশ অধ্যায়',
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
                chapter15.add(ChapRow(
                  name:
                      'মূসক নিবন্ধন বা টার্ণওভার কর সনদপত্র ও কর দলিল সংক্রান্ত অপরাধ ও দন্ড',
                  num: '১১১',
                  leftalignment: 10.0,
                  colorno: '0',
                  dir: 'law',
                ));

                chapter15.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter15.add(ChapRow(
                  name:
                      'মিথ্যা বা বিভ্রান্তিকর বিবৃতি বা বিবরণ প্রদানের অপরাধ ও দন্ড',
                  num: '১১২',
                  leftalignment: 10.0,
                  colorno: '1',
                  dir: 'law',
                ));

                chapter15.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter15.add(ChapRow(
                  name: 'প্রতিবন্ধকতা সৃষ্টির অপরাধ ও দন্ড',
                  num: '১১৩',
                  leftalignment: 10.0,
                  colorno: '0',
                  dir: 'law',
                ));

                chapter15.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter15.add(ChapRow(
                  name: 'অপরাধের তদন্ত, বিচার ও আপীল',
                  num: '১১৪',
                  leftalignment: 10.0,
                  colorno: '1',
                  dir: 'law',
                ));

                chapter15.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter15.add(ChapRow(
                  name:
                      'জুডিশিয়াল ম্যাজিস্ট্রেট বা মেট্রোপলিটন ম্যাজিস্ট্রেটের অতিরিক্ত ক্ষমতা',
                  num: '১১৫',
                  leftalignment: 10.0,
                  colorno: '0',
                  dir: 'law',
                ));

                chapter15.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter15.add(ChapRow(
                  name:
                      'কোম্পানি, ব্যক্তি সংঘ বা সম্পত্তি উন্নয়নে যৌথ উদ্যোগ কর্তৃক অরাধ সংঘটন',
                  num: '১১৬',
                  leftalignment: 10.0,
                  colorno: '1',
                  dir: 'law',
                ));

                chapter15.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter15.add(ChapRow(
                  name: 'অপরাধে সহায়তাকারী',
                  num: '১১৭',
                  leftalignment: 10.0,
                  colorno: '0',
                  dir: 'law',
                ));

                chapter15.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter15.add(ChapRow(
                  name: 'মামলা দায়েরের পূর্বানুমোদন',
                  num: '১১৮',
                  leftalignment: 10.0,
                  colorno: '1',
                  dir: 'law',
                ));

                chapter15.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter15.add(ChapRow(
                  name: 'অপরাধের আপোষরফা',
                  num: '১১৯',
                  leftalignment: 10.0,
                  colorno: '0',
                  dir: 'law',
                ));

                chapter15.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter15.add(ChapRow(
                  name: 'অর্থদন্ড প্রদেয় করের অতিরিক্ত',
                  num: '১২০',
                  leftalignment: 10.0,
                  colorno: '1',
                  dir: 'law',
                ));

                chapter15.add(
                  SizedBox(
                    height: 1,
                  ),
                );
              }
            });
          },
          child: Heading(
            chapno: 'পঞ্চদশ অধ্যায়',
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
                chapter16.add(ChapRow(
                  name: 'কমিশনার (আপীল) এর নিকট আপীল',
                  num: '১২১',
                  leftalignment: 10.0,
                  colorno: '0',
                  dir: 'law',
                ));

                chapter16.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter16.add(ChapRow(
                  name: 'আপীলাত ট্রাইব্যুনালে আপীল',
                  num: '১২২',
                  leftalignment: 10.0,
                  colorno: '1',
                  dir: 'law',
                ));

                chapter16.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter16.add(ChapRow(
                  name: 'কার্যধারায় সাক্ষ্য প্রমাণের দায়',
                  num: '১২৩',
                  leftalignment: 10.0,
                  colorno: '0',
                  dir: 'law',
                ));

                chapter16.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter16.add(ChapRow(
                  name: 'হাইকোর্ট বিভাগে রিভিশন',
                  num: '১২৪',
                  leftalignment: 10.0,
                  colorno: '1',
                  dir: 'law',
                ));

                chapter16.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter16.add(ChapRow(
                  name: 'বিকল্প উপায়ে বিরোধ নিষ্পত্তি',
                  num: '১২৫',
                  leftalignment: 10.0,
                  colorno: '0',
                  dir: 'law',
                ));

                chapter16.add(
                  SizedBox(
                    height: 1,
                  ),
                );
              }
            });
          },
          child: Heading(
            chapno: 'ষোড়শ অধ্যায়',
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
                chapter17.add(ChapRow(
                  name: 'সরকার কর্তৃক কর অব্যাহতি',
                  num: '১২৬',
                  leftalignment: 10.0,
                  colorno: '0',
                  dir: 'law',
                ));

                chapter17.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter17.add(ChapRow(
                  name: 'পুরস্কার ও কর্মদক্ষতা প্রণোদনা',
                  num: '১২৬ক',
                  leftalignment: 2.0,
                  colorno: '1',
                  dir: 'law',
                ));

                chapter17.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter17.add(ChapRow(
                  name: 'প্রদেয় করের উপর সুদ আরোপ',
                  num: '১২৭',
                  leftalignment: 10.0,
                  colorno: '0',
                  dir: 'law',
                ));

                chapter17.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter17.add(ChapRow(
                  name: 'সরকারী পাওনা অবলোপন ক্ষমতা',
                  num: '১২৭ক',
                  leftalignment: 2.0,
                  colorno: '1',
                  dir: 'law',
                ));

                chapter17.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter17.add(ChapRow(
                  name:
                      'কতিপয় পণ্য বা সেবার ক্ষেত্রে কর পরিশোধের সময় ও পদ্ধতি নির্ধারণ',
                  num: '১২৭খ',
                  leftalignment: 2.0,
                  colorno: '0',
                  dir: 'law',
                ));

                chapter17.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter17.add(ChapRow(
                  name:
                      'অনলাইনে কার্যসম্পাদন, দাখিলপত্র পেশকরণ এবং কর পরিশোধ, ইত্যাদি',
                  num: '১২৮',
                  leftalignment: 10.0,
                  colorno: '1',
                  dir: 'law',
                ));

                chapter17.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter17.add(ChapRow(
                  name: 'আদালতে মামলা দায়েরের ক্ষেত্রে প্রতিবন্ধকতা',
                  num: '১২৯',
                  leftalignment: 10.0,
                  colorno: '0',
                  dir: 'law',
                ));

                chapter17.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter17.add(ChapRow(
                  name: 'সরল বিশ্বাসে কৃত কাজকর্মের সংরক্ষণ',
                  num: '১২৯ক',
                  leftalignment: 2.0,
                  colorno: '1',
                  dir: 'law',
                ));

                chapter17.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter17.add(ChapRow(
                  name: 'মূসক পরামর্শক নিয়োগ',
                  num: '১৩০',
                  leftalignment: 10.0,
                  colorno: '0',
                  dir: 'law',
                ));

                chapter17.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter17.add(ChapRow(
                  name: 'করণিক ত্রুটি ইত্যাদির সংশোধন',
                  num: '১৩১',
                  leftalignment: 10.0,
                  colorno: '1',
                  dir: 'law',
                ));

                chapter17.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter17.add(ChapRow(
                  name: 'দাখিলপত্রের প্রত্যায়িত অনুলিপি',
                  num: '১৩২',
                  leftalignment: 10.0,
                  colorno: '0',
                  dir: 'law',
                ));

                chapter17.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter17.add(ChapRow(
                  name: 'মূসক ছাড়পত্র প্রদান',
                  num: '১৩৩',
                  leftalignment: 10.0,
                  colorno: '1',
                  dir: 'law',
                ));

                chapter17.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter17.add(ChapRow(
                  name: 'ব্যক্তি মালিকানাধীন প্রতিষ্ঠানের মাধ্যমে কার্যসম্পাদন',
                  num: '১৩৪',
                  leftalignment: 10.0,
                  colorno: '0',
                  dir: 'law',
                ));

                chapter17.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter17.add(ChapRow(
                  name: 'বিধি প্রণয়নের ক্ষমতা',
                  num: '১৩৫',
                  leftalignment: 10.0,
                  colorno: '1',
                  dir: 'law',
                ));

                chapter17.add(
                  SizedBox(
                    height: 1,
                  ),
                );

                chapter17.add(ChapRow(
                  name: 'মূসক কর্মকর্তা ও কর্মচারীদের',
                  num: '১৩৫ক',
                  leftalignment: 2.0,
                  colorno: '0',
                  dir: 'law',
                ));

                chapter17.add(
                  SizedBox(
                    height: 1,
                  ),
                );

                chapter17.add(ChapRow(
                  name: 'ইংরেজীতে অনুদিত পাঠ প্রকাশ',
                  num: '১৩৬',
                  leftalignment: 10.0,
                  colorno: '1',
                  dir: 'law',
                ));

                chapter17.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter17.add(ChapRow(
                  name: 'রহিতকরণ ও হেফাজত',
                  num: '১৩৭',
                  leftalignment: 10.0,
                  colorno: '0',
                  dir: 'law',
                ));

                chapter17.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter17.add(ChapRow(
                  name: 'ক্রান্তিকালীণ কর হিসাব',
                  num: '১৩৮',
                  leftalignment: 10.0,
                  dir: 'law',
                  colorno: '1',
                ));

                chapter17.add(
                  SizedBox(
                    height: 1,
                  ),
                );
                chapter17.add(ChapRow(
                  name: 'এই আইন প্রবর্তনের পর আবদ্ধ চুক্তি',
                  num: '১৩৯',
                  leftalignment: 10.0,
                  colorno: '0',
                  dir: 'law',
                ));

                chapter17.add(
                  SizedBox(
                    height: 1,
                  ),
                );
              }
            });
          },
          child: Heading(
            chapno: 'সপ্তদশ অধ্যায়',
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
