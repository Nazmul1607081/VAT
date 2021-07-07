import 'package:flutter/material.dart';

import 'law11.dart';

class Heading extends StatelessWidget {
  final chapno;
  final chapitle;

  const Heading({Key key, this.chapno, this.chapitle}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        // color: Color(0xff76B3EC),
        child: Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 5),
          color: Colors.purple[50],
          alignment: Alignment.center,
          child: Text(
            "$chapno",
            style: TextStyle(fontFamily: 'NiladriNodia', fontSize: 30),
          ),
        ),
        Container(
          padding: EdgeInsets.all(5),
          color: Colors.deepOrange[50],
          alignment: Alignment.center,
          child: Text(
            "$chapitle",
            style: TextStyle(fontSize: 22, fontFamily: 'NiladriNodia'),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    ));
  }
}

class MyDataCell extends StatelessWidget {
  static const mytextstyle = TextStyle(
      //backgroundColor: Colors.black12,
      fontSize: 26,
      color: Colors.black,
      fontFamily: 'NiladriNodia');
  final name;

  const MyDataCell({Key key, this.name}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("$name"),
      color: Colors.yellow,
      width: double.infinity,
    );
  }
}

class ChapRow extends StatefulWidget {
  final num;
  final name;
  final leftalignment;
  final colorno;
  final dir;
  //final detailspage;

  const ChapRow({
    Key key,
    this.num,
    this.name,
    this.leftalignment,
    this.colorno,
    this.dir,
  }) : super(key: key);

  @override
  _ChapRowState createState() => _ChapRowState();
}

class _ChapRowState extends State<ChapRow> {
  @override
  Widget build(BuildContext context) {
    String storagename;
    Color c = Colors.grey[50];
    if (widget.colorno == '1') {
      c = Colors.blueGrey[50];
    }
    setState(() {
      storagename = widget.name;
    });
    if (widget.num == '১৮খ' && widget.dir == 'rule') {
      setState(() {
        storagename =
            "অভ্যন্তরীণ ব্যাক-টু-ব্যাক ঋণপত্রের বিপরীতে বৈদেশিক মুদ্রার বিনিময়ে পণ্য বা সেবা সরবরাহ";
      });
    }
    if (widget.num == '২৩' && widget.dir == 'rule') {
      setState(() {
        storagename =
            "আগাম মূল্য পরিশোধিত টেলিযোগাযোগ সেবা গ্রহণকারী বা দ্রব্য ব্যবহারকারী ব্যক্তি কর্তৃক রেয়াত গ্রহণ পদ্ধতি";
      });
    }
    if (widget.num == '৭৬' && widget.dir == 'rule') {
      setState(() {
        storagename =
            'খেলাপি করদাতার ব্যবসা অঙ্গন তালাবদ্ধকরণ, অস্থাবর সম্পত্তি জব্দকরণ বা স্থাবর সম্পত্তি ক্রোককরণের অসহযোগিতা বা বাধা প্রদান';
      });
    }
    if (widget.num == '৮৯' && widget.dir == 'rule') {
      setState(() {
        storagename =
            'স্থাবর সম্পত্তি ক্রোক বা অস্থাবর সম্পত্তি জব্দের ক্ষেত্রে বকেয়া আদায় কর্মকর্তার কার্যপদ্ধতি';
      });
    }
/*    print(widget.num);
    print(storagename);
    print("ato");*/
    return Container(
      color: c,
      child: ListTile(
        contentPadding: EdgeInsets.all(0),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) {
            return Law11(
              name: widget.name,
              num: widget.num,
              path: null,
              gopage: 0,
              dir: widget.dir,
            );
          }));
        },
        dense: true,
        leading: Container(
          margin: EdgeInsets.all(0),
          padding: EdgeInsets.only(left: widget.leftalignment),
          child: Text(
            "${widget.num}।",
            style: TextStyle(
                fontSize: 26, color: Colors.black, fontFamily: 'Shobuj Nolua'),
          ),
        ),
        title: Container(
          padding: EdgeInsets.all(0),
          child: Text(
            "${storagename}",
            style: TextStyle(
                fontSize: 26, color: Colors.black, fontFamily: 'Shobuj Nolua'),
          ),
        ),
      ),
    );
  }
}
