import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vatapp/components/appbar.dart';
import 'package:vatapp/components/gridview.dart';
import 'package:vatapp/components/mydrawer.dart';

class Introduction extends StatefulWidget {
  @override
  _IntroductionState createState() => _IntroductionState();
}

class _IntroductionState extends State<Introduction> {
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
        title: Text('ভূমিকা'),
      ),
      body: Container(
        color: Color(0xff056608),
        child: Intro(),
      ),
    );
  }
}

class Intro extends StatefulWidget {
  @override
  _IntroState createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Text(
                "ভূমিকা:\n       "
                "মূল্য সংযোজন কর ও সম্পূরক শুল্ক আইন,"
                " 2012 এবং মূল্য সংযোজন কর ও সম্পূরক শুল্ক বিধিমালা,"
                " 2016 এবং তদধীনে প্রণীত বিধি বিধানের আলোকে একটি"
                " যুগোপযোগী, ডিজিটাল ও অনলাইন ভিত্তিক মূসক ব্যবস্থার"
                " প্রণয়ণের মাধ্যমে সুগঠিত টেকসই মূসক ব্যবস্থার প্রবর্তন করার"
                " প্রয়াস অব্যাহত রয়েছে। নতুন আইনে অভ্যস্ত না হওয়ায় মাঠ"
                " পর্যায়ে কাজ করতে অনেকেই সমস্যার সম্মুখিন হচ্ছেন। অনেকে ধারা,"
                " বিধি, এসআরও বা সাধারণ আদেশের মধ্যে একটার সাথে অন্যটার লিংক খুঁজে পাননা কিংবা প্রয়োজনীয় দিক-নির্দেশনার অভাবে কাজ করতে গিয়ে নানাবিধ"
                " সমসম্যার সম্মুখিন হচ্ছেন। তাই যুগোপযোগী ও ডিজিটাল প্রজন্মের বিষয়টি মাথায় রেখে নতুন ভ্যাট আইনকে আরো সহজভাবে তুলে ধরতে এবং"
                " সর্বশেষ আপডেটসহ আইন, বিধি, এসআরও ও সাধারণ আদেশ এর সাথে আন্তঃসম্পর্ক স্থাপনের নিমিত্তে “ভ্যাট গাইড” নামক এন্ড্রয়েড অ্যাপটি"
                " তৈরী করার প্রয়াস চালিয়েছি। এই অ্যাপটির মাধ্যমে আইনের সাথে জড়িত সকল বিধি বিধানের আন্তঃসম্পর্ক স্থাপন করে উপস্থাপন করা হলো।"
                " এতে ব্যবহারকারী খুব সহজেই ম্যানু থেকে তার চাহিদামত একটি বিষয় বেছে নিলেই তার সাথে সম্পর্কিত অন্যান্য বিষয়ের লিংক খুব সহজেই"
                " খুঁজে পাবেন। যারা ভ্যাট আইনে একেবারেই অনভিজ্ঞ তারাও খুব সহেজে এই অ্যাপ থেকে আইন সম্পর্কে ধারণা নিতে পারবেন। এই অ্যাপটি সকল"
                " শ্রেণীর পাঠকের কথা এবং মাঠ পর্যায়ে সৃষ্ট সমস্যার বিষয়গুলো বিবেচনায় রেখে তৈরী করা হয়েছে। মহান আল্লাহর নিকট অশেষ কৃতজ্ঞতা"
                " ও শুকরিয়া জ্ঞাপন করছি যে অবশেষে পরিকল্পনা মোতাবেক এমন জটিল একটি বিষয়ে খুব সহজ করে উপস্থাপন করতে পেরেছি। এই অ্যাপটি"
                " ব্যবহারকারীর কাজে লাগলেই আমার পরিশ্রম স্বার্থক হবে। এই অ্যাপটির মাধ্যমে ব্যবহারকারীর সমস্যা সম্পর্কে যেকোন প্রশ্ন করতে পারবেন এবং এর"
                " মাধ্যমেই তার সম্ভাব্য আইনানুগ সমাধাণ পেয়ে যাবেন খুব সহজে। তাছাড়া এতে আরো প্রয়োজনীয় অনেক বিষয় সংযোজন করা হয়েছে যার বিস্তারিত"
                " অ্যাপ ম্যাপ নামক মেনুতে তুলে ধরা হয়েছে। পর্যায়ক্রমে এর আরো উন্নতি সাধন করা হবে এবং আরো প্রয়োজনীয় ও প্রাসঙ্গিক বিষয় সংযোজন করা হবে।"
                " কারো নজরে ভুল ত্রুটি পড়লে জানিয়ে কৃতজ্ঞ করবেন সে মোতাবেক তা সংশোধন করা হবে। আমার সহকর্মী, শুভাকাঙ্খী এবং সম্মানিত করদাতা ও"
                " যারা ভ্যাট প্রাক্টিস করছেন তাঁদের প্রতি কৃতজ্ঞতা জানাই। আমি আরো কৃতজ্ঞতা প্রকাশ করছি তাদের প্রতি যারা প্রতিনিয়ত আমাকে এই কাজ করার জন্য"
                " শক্তি, সাহস ও অনুপ্রেরণা, আইডিয়া এবং মতামত দিয়ে সহযোগিতা করেছেন।\n"
                "ধন্যবাদান্তে\n"
                "আবু সুফিয়ান\n"
                "রাজস্ব কর্মকর্তা।",
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
    );
  }
}
