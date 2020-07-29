import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vatapp/components/appbar.dart';
import 'package:vatapp/components/gridview.dart';
import 'package:vatapp/components/mydrawer.dart';

class AboutMe extends StatefulWidget {
  @override
  _AboutMeState createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {
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
        title: Text('আমাদের সম্পর্কে'),
      ),
      body: Container(
        color: Color(0xff056608),
        child: ListView(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  CircleAvatar(
                    child: Image.asset("images/vai.jpg"),
                    radius: 50,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "      আবু সুফিয়ান, পিতা: আব্দুল অজুদ, মাতা: জামিলা খাতুন দ্বীপজেলা ভোলার অত্যন্ত মনোমুগ্ধকর দ্বীপ মনপুরায় ৩ জানুয়ারী, ১৯৮৪ সালে জন্মগ্রহণ করেন। শৈশব ও কৈশোর কেটেছে ভোলা জেলার বোরহানউদ্দিন থানাধীন উদয়পুর গ্রামে। কুলসুম রহমান মাধ্যমিক বিদ্যালয়, বোরহানগঞ্জ হতে এসএসসিতে বিজ্ঞান বিভাগে যশোর বোর্ডের অধীনে ২০০০ সালে স্টার মার্কস পেয়ে উত্তীর্ণ হন। অতঃপর তিনি ২০০২ সালে কুমিল্লা, রামচন্দ্রপুরে অবস্থিত অধ্যাপক আব্দুল মজিদ কলেজ হতে কুমিলা বোর্ডের মানবিক বিভাগ হতে ৬ষ্ঠ স্থানসহ সাফল্যের সহিত উত্তীর্ণ হন। এরপর ঢাকা বিশ্ববিদ্যালয়ের সমাজ বিজ্ঞান বিভাগ হতে ২০০৬ সালে স্নাতক ও ২০০৭ সালে স্নাতকোত্তর ডিগ্রি অর্জন করেন। ব্যাংকিং পেশা দিয়ে ক্যারিয়ার শুরু করার পর ২০১১ সালে পিএসসির নন-ক্যাডার নিয়োগের মাধ্যমে জাতীয় রাজস্ব বোর্ডে সহকারী রাজস্ব কর্মকর্তা হিসেবে যোগদান করেন। ২০১৭ সালের ডিসেম্বরে রাজস্ব কর্মকর্তা হিসাবে পদোন্নতি পান। মাঠ পর্যায়ে ভ্যাটের কাজের ক্ষেত্রে প্রতিনিয়ত নানাবিধ জটিলতার মধ্যে দিয়ে যেতে হয়। দীর্ঘদিন মাঠ পর্যায়ে ভ্যাট ও কাস্টমস বিষয়ে কাজের অভিজ্ঞতার ভিত্তিতে দৈনন্দিন কাজের ক্ষেত্রে যে সকল সমস্যার উদ্ভব হয় তার আলোকে সেই সকল সমস্যার সমাধান নিয়ে একটি যুগোপযোগী ডিজিটাল সেবা প্রদান এবং সর্বশেষ আপডেট তথ্য সবার হাতের নাগালে পৌঁছে দেয়া জন্য তিনি এই অ্যাপটি তৈরী করেন।",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
