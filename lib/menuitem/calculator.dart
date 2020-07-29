import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vatapp/components/mydrawer.dart';

import 'package:decimal/decimal.dart';
import 'package:string_validator/string_validator.dart';

class MyCalculator extends StatefulWidget {
  @override
  _MyCalculatorState createState() => _MyCalculatorState();
}

class _MyCalculatorState extends State<MyCalculator> {
  Future<bool> _backPop() async {
    print("back button event");
    return Future.value(false);
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
          'ক্যালকুলেটর',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        /* decoration: BoxDecoration(
              //color: Color(0xff056608),
              image: DecorationImage(
                image: AssetImage("images/backlaw.png"),
                fit: BoxFit.cover,
              ),
            ),*/
        child: CalculatorBody(),
      ),
    );
  }
}

class Item {
  const Item(this.name);
  final String name;
}

String vatratetype;
String sdf;
String sdrate;
String basetype;
String amount;
String reducedrate;
String vat;
String sd;
String vatrate;

String inputtax;
String outputtax;
String incadj;
String decadj;
String lastclosingbalance;
String finalvalue;

String netpayablevat;
String treasurydeposite;
String closingbalance;

class CalculatorBody extends StatefulWidget {
  @override
  _CalculatorBodyState createState() => _CalculatorBodyState();
}

class _CalculatorBodyState extends State<CalculatorBody> {
  Item selectedUser;
  Item selectedUser1;
  Item selectedUser2;
  List<Item> users = <Item>[
    const Item(
      'Standard',
    ),
    const Item(
      'Reduced',
    ),
    const Item(
      'Tobacco',
    ),
  ];

  List<Item> supplements = <Item>[
    const Item(
      'Yes',
    ),
    const Item(
      'No',
    ),
  ];
  List<Item> base = <Item>[
    const Item(
      'Inclusive',
    ),
    const Item(
      'Exclusive',
    ),
  ];

  String hint = "Input Rate";

  void calculate() {
    if (vatratetype == 'Tobacco') {
      setState(() {
        vat = (Decimal.parse(amount) * Decimal.parse('.15')).toString();
        sd = (Decimal.parse(amount) *
                (Decimal.parse(vatrate) / Decimal.parse('100')))
            .toString();
        finalvalue = amount;
      });
    } else if (vatratetype == 'Standard') {
      ///standard
      if (sdf == 'Yes') {
        ///yes
        if (basetype == 'Inclusive') {
          ///yes inclusive
          setState(() {
            final temp = Decimal.parse(amount) *
                (Decimal.parse('15') / Decimal.parse('115'));
            vat = temp.toString();
            print(vat);
            final temp1 = (Decimal.parse(amount) - Decimal.parse(vat)) *
                (Decimal.parse(sdrate) /
                    (Decimal.parse('100') + Decimal.parse(sdrate)));
            sd = temp1.toString();
            print(sd);
          });
        } else {
          ///yes exclusive
          setState(() {
            final temp1 = Decimal.parse(amount) *
                (Decimal.parse(sdrate) / Decimal.parse('100'));
            sd = temp1.toString();
            print(sd);
            final temp = (Decimal.parse(amount) + Decimal.parse(sd)) *
                Decimal.parse('0.15');
            vat = temp.toString();
            print(vat);
          });
        }
      } else {
        ///no
        if (basetype == 'Inclusive') {
          setState(() {
            final temp = Decimal.parse(amount) *
                (Decimal.parse('15') / Decimal.parse('115'));
            vat = temp.toString();
            print(vat);
            sd = "No SD";
            print(sd);
          });
        } else {
          setState(() {
            final temp = Decimal.parse(amount) * Decimal.parse('0.15');
            vat = temp.toString();
            print(vat);
            sd = "No SD";
            print(sd);
          });
        }
      }
    } else {
      ///reduced
      if (basetype == 'Inclusive') {
        print("test");
        print(reducedrate);
        print(amount);

        setState(() {
          final temp = Decimal.parse(amount) *
              (Decimal.parse(reducedrate) /
                  (Decimal.parse(reducedrate) + Decimal.parse('100')));
          vat = temp.toString();
          print(vat);
          sd = "No SD";
          print(sd);
        });
      } else {
        setState(() {
          final temp = Decimal.parse(amount) *
              (Decimal.parse(reducedrate) / (Decimal.parse('100')));
          vat = temp.toString();
          print(vat);
          sd = "No SD";
          print(sd);
        });
      }
    }

    ///inclusive or ex
    if (vatratetype == 'Standard') {
      if (basetype == 'Inclusive') {
        setState(() {
          if (sdf == 'No') {
            sd = '0';
          }
          finalvalue =
              (Decimal.parse(amount) - (Decimal.parse(vat) + Decimal.parse(sd)))
                  .toString();
        });
      }
      if (basetype == 'Exclusive') {
        setState(() {
          if (sdf == 'No') {
            sd = '0';
          }
          finalvalue =
              (Decimal.parse(amount) + (Decimal.parse(vat) + Decimal.parse(sd)))
                  .toString();
        });
      }
    }
    if (vatratetype == 'Reduced') {
      if (basetype == 'Inclusive') {
        setState(() {
          finalvalue =
              (Decimal.parse(amount) - (Decimal.parse(vat))).toString();
        });
      }
      if (basetype == 'Exclusive') {
        setState(() {
          finalvalue =
              (Decimal.parse(amount) + (Decimal.parse(vat))).toString();
        });
      }
    }

    ///net payable
    setState(() {
      outputtax = vat;
      netpayablevat = (Decimal.parse(outputtax) -
              Decimal.parse(inputtax) +
              Decimal.parse(incadj) -
              Decimal.parse(decadj) -
              Decimal.parse(lastclosingbalance))
          .toString();
      closingbalance =
          (Decimal.parse(netpayablevat) - Decimal.parse(treasurydeposite))
              .toString();
    });

    /// net calculation
  }

  TextEditingController textEditingController;
  TextEditingController textEditingController1;
  TextEditingController textEditingController2;
  TextEditingController textEditingController3;
  TextEditingController textEditingController4;
  TextEditingController textEditingController5;
  TextEditingController textEditingController6;
  TextEditingController textEditingController7;
  TextEditingController textEditingController8;
  TextEditingController textEditingController9;

  @override
  void initState() {
    textEditingController = new TextEditingController(text: "");
    textEditingController1 = new TextEditingController(text: "");
    textEditingController2 = new TextEditingController(text: "");
    textEditingController3 = new TextEditingController(text: "");
    textEditingController4 = new TextEditingController(text: "");
    textEditingController5 = new TextEditingController(text: "");
    textEditingController6 = new TextEditingController(text: "");
    textEditingController7 = new TextEditingController(text: "");
    textEditingController8 = new TextEditingController(text: "");
    textEditingController9 = new TextEditingController(text: "");
    // TODO: implement initState
    super.initState();
    print("welcome to vat calculator");

    vatratetype = '';
    sdf = '';
    sdrate = '0';
    basetype = '';
    amount = '0';
    reducedrate = '';
    vat = 'please input data';
    sd = 'please input data';
    vatrate = '0';

    inputtax = '0';
    outputtax = '0';
    incadj = '0';
    decadj = '0';
    lastclosingbalance = '0';

    finalvalue = '0';

    netpayablevat = '0';
    treasurydeposite = '0';
    closingbalance = '0';
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          padding: EdgeInsets.fromLTRB(60, 5, 60, 10),
          child: Image.asset('images/calculatorheading.jpg'),
        ),

        ///vat type
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Card(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.yellow,
                    //color: Colors.green,
                  ),
                  // color: Colors.green,
                  color: Color(0xff056608),

                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                width: 150,
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                child: Text(
                  "VAT Type",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(0),
              margin: EdgeInsets.all(0),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Color(0xff056608),
                  //color: Colors.green,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              width: 160,
              child: Center(
                child: DropdownButton<Item>(
                  underline: Container(),
                  focusColor: Colors.red,
                  hint: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Standard/Reduced"),
                      Text("/Tobacco")
                    ],
                  ),
                  value: selectedUser,
                  onChanged: (Item Value) {
                    setState(() {
                      selectedUser = Value;
                      vatratetype = selectedUser.name;
                      //calculate();
                    });
                  },
                  items: users.map((Item user) {
                    return DropdownMenuItem<Item>(
                      value: user,
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            user.name,
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),

        ///start vat type condition

        (vatratetype == 'Tobacco')
            ?

            ///vat rate
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Card(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.yellow,
                          //color: Colors.green,
                        ),
                        // color: Colors.green,
                        color: Color(0xff056608),

                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      width: 150,
                      padding:
                          EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                      child: Text(
                        "Supplementary Duty Rate",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(0),
                    margin: EdgeInsets.all(0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Color(0xff056608),
                        //color: Colors.green,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    width: 160,
                    child: Center(
                      child: TextField(
                        controller: textEditingController1,
                        onChanged: (value) {
                          setState(() {
                            if (isFloat(value) || isInt(value)) {
                              setState(() {
                                vatrate = value;
                                calculate();
                              });
                            } else {
                              setState(() {
                                sd = 'no neumaric value';
                                vat = "no neumaric value";
                              });
                            }
                          });
                        },
                        keyboardType: TextInputType.numberWithOptions(
                          decimal: true,
                        ),
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(hintText: "input Value"),
                      ),
                    ),
                  ),
                ],
              )
            : Container(),

        (vatratetype == 'Standard')
            ?

            ///supplementary duty
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Card(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.yellow,
                          //color: Colors.green,
                        ),
                        // color: Colors.green,
                        color: Color(0xff056608),

                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      width: 150,
                      padding:
                          EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                      child: Text(
                        "Supplementary Duty",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(0),
                    margin: EdgeInsets.all(0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Color(0xff056608),
                        //color: Colors.green,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    width: 160,
                    child: Center(
                      child: DropdownButton<Item>(
                        underline: Container(),
                        focusColor: Colors.red,
                        hint: Text("Yes/No"),
                        value: selectedUser1,
                        onChanged: (Item Value) {
                          setState(() {
                            selectedUser1 = Value;
                            sdf = selectedUser1.name;
                            calculate();
                          });
                        },
                        items: supplements.map((Item supplements) {
                          return DropdownMenuItem<Item>(
                            value: supplements,
                            child: Row(
                              children: <Widget>[
                                SizedBox(
                                  width: 30,
                                ),
                                Text(
                                  supplements.name,
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              )
            : Container(),

        (vatratetype == 'Standard' && sdf == "Yes")
            ?

            ///supplementary duty rate
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Card(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.yellow,
                          //color: Colors.green,
                        ),
                        // color: Colors.green,
                        color: Color(0xff056608),

                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      width: 150,
                      padding:
                          EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                      child: Text(
                        "Supplementary Duty Rate",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(0),
                    margin: EdgeInsets.all(0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Color(0xff056608),
                        //color: Colors.green,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    width: 160,
                    child: Center(
                      child: TextField(
                        controller: textEditingController2,
                        onChanged: (value) {
                          setState(() {
                            if (isFloat(value) || isInt(value)) {
                              setState(() {
                                sdrate = value;
                                calculate();
                              });
                            } else {
                              setState(() {
                                sd = 'wrong value inserted';
                                vat = 'wrong value inserted';
                                finalvalue = 'wrong value inserted';
                              });
                            }
                          });
                        },
                        keyboardType: TextInputType.numberWithOptions(
                          decimal: true,
                        ),
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(hintText: '%'),
                      ),
                    ),
                  ),
                ],
              )
            : Container(),
        (vatratetype == 'Reduced')
            ?

            ///reduced rate
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Card(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.yellow,
                          //color: Colors.green,
                        ),
                        // color: Colors.green,
                        color: Color(0xff056608),

                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      width: 150,
                      padding:
                          EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                      child: Text(
                        "Reduced Rate",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(0),
                    margin: EdgeInsets.all(0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Color(0xff056608),
                        //color: Colors.green,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    width: 160,
                    child: Center(
                      child: TextField(
                        controller: textEditingController3,
                        onChanged: (value) {
                          setState(() {
                            if (isFloat(value) || isInt(value)) {
                              setState(() {
                                reducedrate = value;
                                calculate();
                              });
                            } else {
                              setState(() {
                                sd = 'no neumaric value';
                                vat = "no neumaric value";
                              });
                            }
                          });
                        },
                        keyboardType: TextInputType.numberWithOptions(
                          decimal: true,
                        ),
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(hintText: "input Value"),
                      ),
                    ),
                  ),
                ],
              )
            : Container(),

        (vatratetype != 'Tobacco')
            ?

            ///base
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Card(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.yellow,
                          //color: Colors.green,
                        ),
                        // color: Colors.green,
                        color: Color(0xff056608),

                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      width: 150,
                      padding:
                          EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                      child: Text(
                        "Base",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(0),
                    margin: EdgeInsets.all(0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Color(0xff056608),
                        //color: Colors.green,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    width: 160,
                    child: Center(
                      child: DropdownButton<Item>(
                        underline: Container(),
                        focusColor: Colors.red,
                        hint: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Inclusive/",
                              style: TextStyle(fontSize: 14),
                            ),
                            Text(
                              "Exclusive",
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                        value: selectedUser2,
                        onChanged: (Item Value) {
                          setState(() {
                            selectedUser2 = Value;
                            basetype = selectedUser2.name;
                            calculate();
                          });
                        },
                        items: base.map((Item user) {
                          return DropdownMenuItem<Item>(
                            value: user,
                            child: Row(
                              children: <Widget>[
                                SizedBox(
                                  width: 30,
                                ),
                                Text(
                                  user.name,
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              )
            : Container(),

        ///I can say this is static
        ///value
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Card(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.yellow,
                    //color: Colors.green,
                  ),
                  // color: Colors.green,
                  color: Color(0xff056608),

                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                width: 150,
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                child: Text(
                  "Value",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(0),
              margin: EdgeInsets.all(0),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Color(0xff056608),
                  //color: Colors.green,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              width: 160,
              child: Center(
                child: TextField(
                  controller: textEditingController4,
                  onChanged: (value) {
                    print(value);
                    print("re");
                    if (isFloat(value) || isInt(value)) {
                      print("if");
                      amount = value;
                      /*textEditingController.value =
                          TextEditingValue(text: "$value");*/
                      calculate();
                    } else {
                      print("else");
                      setState(() {
                        amount = value;
                        sd = 'wrong value inserted';
                        vat = 'wrong value inserted';
                        finalvalue = 'wrong value inserted';
                      });
                    }
                  },
                  keyboardType: TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(hintText: "input Value"),
                ),
              ),
            ),
          ],
        ),

        ///calculate
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Card(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.yellow,
                    //color: Colors.green,
                  ),
                  // color: Colors.green,
                  color: Colors.redAccent,

                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                width: 150,
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                child: Text(
                  "Results",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),

        ///sd
        ///
        (sdf == 'Yes' || vatratetype == 'Tobacco')
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Card(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.yellow,
                          //color: Colors.green,
                        ),
                        // color: Colors.green,
                        color: Color(0xff056608),

                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      width: 150,
                      padding:
                          EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                      child: Text(
                        "Supplementary Duty",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Card(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xff056608),
                          //color: Colors.green,
                        ),
                        // color: Colors.green,
                        color: Colors.white,

                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      width: 150,
                      padding:
                          EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                      child: Text(
                        sd,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : Container(),

        ///vat
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Card(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.yellow,
                    //color: Colors.green,
                  ),
                  // color: Colors.green,
                  color: Color(0xff056608),

                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                width: 150,
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                child: Text(
                  "VAT",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Card(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color(0xff056608),
                    //color: Colors.green,
                  ),
                  // color: Colors.green,
                  color: Colors.white,

                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                width: 150,
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                child: Text(
                  vat,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),

        ///final value
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Card(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.yellow,
                    //color: Colors.green,
                  ),
                  // color: Colors.green,
                  color: Color(0xff056608),

                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                width: 150,
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                child: Text(
                  "Value",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Card(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color(0xff056608),
                    //color: Colors.green,
                  ),
                  // color: Colors.green,
                  color: Colors.white,

                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                width: 150,
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                child: Text(
                  finalvalue,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),

        ///net payable vat
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Card(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.yellow,
                    //color: Colors.green,
                  ),
                  // color: Colors.green,
                  color: Colors.redAccent,

                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                width: 150,
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                child: Text(
                  "Net Payable VAT",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),

        ///output tax
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Card(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.yellow,
                    //color: Colors.green,
                  ),
                  // color: Colors.green,
                  color: Color(0xff056608),

                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                width: 150,
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                child: Text(
                  "Output Tax",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Card(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color(0xff056608),
                    //color: Colors.green,
                  ),
                  // color: Colors.green,
                  color: Colors.white,

                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                width: 150,
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                child: Text(
                  outputtax,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),

        ///input tax
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Card(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.yellow,
                    //color: Colors.green,
                  ),
                  // color: Colors.green,
                  color: Color(0xff056608),

                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                width: 150,
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                child: Text(
                  "Input Tax Credit",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(0),
              margin: EdgeInsets.all(0),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Color(0xff056608),
                  //color: Colors.green,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              width: 160,
              child: Center(
                child: TextField(
                  controller: textEditingController5,
                  onChanged: (value) {
                    setState(() {
                      inputtax = value;
                      calculate();
                    });
                  },
                  keyboardType: TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(hintText: "input value"),
                ),
              ),
            ),
          ],
        ),

        ///inc adj
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Card(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.yellow,
                    //color: Colors.green,
                  ),
                  // color: Colors.green,
                  color: Color(0xff056608),

                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                width: 150,
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                child: Text(
                  "Increasing Adjustment",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(0),
              margin: EdgeInsets.all(0),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Color(0xff056608),
                  //color: Colors.green,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              width: 160,
              child: Center(
                child: TextField(
                  controller: textEditingController6,
                  onChanged: (value) {
                    setState(() {
                      incadj = value;
                      calculate();
                    });
                  },
                  keyboardType: TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(hintText: "input value"),
                ),
              ),
            ),
          ],
        ),

        ///dec adj
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Card(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.yellow,
                    //color: Colors.green,
                  ),
                  // color: Colors.green,
                  color: Color(0xff056608),

                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                width: 150,
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                child: Text(
                  "Decreasing Adjustment",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(0),
              margin: EdgeInsets.all(0),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Color(0xff056608),
                  //color: Colors.green,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              width: 160,
              child: Center(
                child: TextField(
                  controller: textEditingController7,
                  onChanged: (value) {
                    setState(() {
                      decadj = value;
                      calculate();
                    });
                  },
                  keyboardType: TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(hintText: "input Value"),
                ),
              ),
            ),
          ],
        ),

        ///last closing balance
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Card(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.yellow,
                    //color: Colors.green,
                  ),
                  // color: Colors.green,
                  color: Color(0xff056608),

                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                width: 150,
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                child: Text(
                  "Last Closing Balance",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(0),
              margin: EdgeInsets.all(0),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Color(0xff056608),
                  //color: Colors.green,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              width: 160,
              child: Center(
                child: TextField(
                  controller: textEditingController8,
                  onChanged: (value) {
                    setState(() {
                      lastclosingbalance = value;
                      calculate();
                    });
                  },
                  keyboardType: TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(hintText: "input value"),
                ),
              ),
            ),
          ],
        ),

        ///calculate
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Card(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.yellow,
                    //color: Colors.green,
                  ),
                  // color: Colors.green,
                  color: Colors.redAccent,

                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                width: 150,
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                child: Text(
                  "Results",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),

        /// net payable vat
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Card(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.yellow,
                    //color: Colors.green,
                  ),
                  // color: Colors.green,
                  color: Color(0xff056608),

                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                width: 150,
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                child: Text(
                  "Net Payable VAT",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Card(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color(0xff056608),
                    //color: Colors.green,
                  ),
                  // color: Colors.green,
                  color: Colors.white,

                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                width: 150,
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                child: Text(
                  netpayablevat,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),

        ///treasury deposite
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Card(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.yellow,
                    //color: Colors.green,
                  ),
                  // color: Colors.green,
                  color: Color(0xff056608),

                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                width: 150,
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                child: Text(
                  "Treasury Deposit",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(0),
              margin: EdgeInsets.all(0),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Color(0xff056608),
                  //color: Colors.green,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              width: 160,
              child: Center(
                child: TextField(
                  controller: textEditingController9,
                  onChanged: (value) {
                    setState(() {
                      treasurydeposite = value;
                      calculate();
                    });
                  },
                  keyboardType: TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(hintText: "input value"),
                ),
              ),
            ),
          ],
        ),

        /// closing balance
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Card(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.yellow,
                    //color: Colors.green,
                  ),
                  // color: Colors.green,
                  color: Color(0xff056608),

                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                width: 150,
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                child: Text(
                  "Closing Balance",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Card(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color(0xff056608),
                    //color: Colors.green,
                  ),
                  // color: Colors.green,
                  color: Colors.white,

                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                width: 150,
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                child: Text(
                  closingbalance,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
