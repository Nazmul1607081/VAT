import 'package:flutter/material.dart';
import 'package:vatapp/components/mydrawer.dart';

class VatSupport extends StatefulWidget {
  @override
  _VatSupportState createState() => _VatSupportState();
}

class _VatSupportState extends State<VatSupport> {
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
        title: Text('ভ্যাট সাপোর্ট'),
      ),
      body: Container(
        color: Color(0xff056608),
        padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
        child: ListView(children: <Widget>[
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
              child: RichText(
                text: TextSpan(
                  text: '১। ',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'ভ্যাট অনলাইন সাপোর্ট কল সেন্টার-',
                        style: TextStyle()),
                    TextSpan(
                      text: '16555',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff056608),
                      ),
                    ),
                  ],
                ),
              ),
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
            child: RichText(
              text: TextSpan(
                text: '২। ',
                style: TextStyle(
                  color: Colors.black,
                ),
                children: <TextSpan>[
                  TextSpan(text: 'সাপোর্ট ই-মেইল: ', style: TextStyle()),
                  TextSpan(
                    text: 'support@vat.gov.bd',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
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
            child: RichText(
              text: TextSpan(
                text: '৩। ',
                style: TextStyle(
                  color: Colors.black,
                ),
                children: <TextSpan>[
                  TextSpan(text: 'ইমেইল: ', style: TextStyle()),
                  TextSpan(
                    text: 'sufian411@gmail.com',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
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
            child: RichText(
              text: TextSpan(
                text: '৪। ',
                style: TextStyle(
                  color: Colors.black,
                ),
                children: <TextSpan>[
                  TextSpan(text: 'ফেসবুক ঠিকানা: ', style: TextStyle()),
                  TextSpan(
                    text: 'https://www.facebook.com/sufiankj',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
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
            child: RichText(
              text: TextSpan(
                text: '৫। ',
                style: TextStyle(
                  color: Colors.black,
                ),
                children: <TextSpan>[
                  TextSpan(text: 'ফেসবুক পেইজ: ', style: TextStyle()),
                  TextSpan(
                    text: 'শুল্ক ও ভ্যাট পাঠশালা',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xff056608),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
