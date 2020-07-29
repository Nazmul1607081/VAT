import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vatapp/components/mydrawer.dart';
import 'package:vatapp/pages/homepage.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import '../constants.dart';
import 'package:connectivity/connectivity.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  /*final _phoneController = TextEditingController();*/

  final _codeController = TextEditingController();

  String code = '';

  String hcode = '';

  FirebaseUser user;

  Future<bool> loginUser(String phone, BuildContext context) async {
    FirebaseAuth _auth = FirebaseAuth.instance;

    _auth.verifyPhoneNumber(
        phoneNumber: phone,
        timeout: Duration(seconds: 60),
        verificationCompleted: (AuthCredential credential) async {
          AuthResult result = await _auth.signInWithCredential(credential);

          user = result.user;

          if (user != null) {
            print("login successfull1");
            print(user.phoneNumber);

            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          } else {
            print("Error");
          }

          //This callback would gets called when verification is done auto maticlly
        },
        verificationFailed: (AuthException exception) {
          print(exception);
        },
        codeSent: (String verificationId, [int forceResendingToken]) {
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                if (user != null) {
                  Navigator.pop(context);
                }

                return AlertDialog(
                  backgroundColor: Colors.white70,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    side: BorderSide(color: Colors.green),
                  ),
                  title: Text("Give the code?"),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        color: Colors.white,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: hcode,
                          ),
                          controller: _codeController,
                        ),
                      ),
                    ],
                  ),
                  actions: <Widget>[
                    FlatButton(
                      child: Text("Cancel"),
                      textColor: Colors.white,
                      color: Color(0xff056608),
                      onPressed: () async {
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    FlatButton(
                      child: Text("Confirm"),
                      textColor: Colors.white,
                      color: Color(0xff056608),
                      onPressed: () async {
                        code = _codeController.text.trim();
                        AuthCredential credential =
                            PhoneAuthProvider.getCredential(
                                verificationId: verificationId, smsCode: code);

                        AuthResult result =
                            await _auth.signInWithCredential(credential);

                        FirebaseUser user = result.user;

                        if (user != null) {
                          print("login successfull");
                          print(user.phoneNumber);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()));
                        } else {
                          print("Error");
                          Navigator.pop(context);
                          Fluttertoast.showToast(
                              msg: "Failed.Please Try Again",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        }
                      },
                    )
                  ],
                );
              });
        },
        codeAutoRetrievalTimeout: null);
  }

  ///i__phone number ...
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController controller = TextEditingController();
  String initialCountry = 'BD';
  PhoneNumber number = PhoneNumber(isoCode: 'BD');
  String mymobilenumber = "";
  bool isValidmobilenumber = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff056608),
          title: Text("Login with phone number"),
          leading: IconButton(
            icon: Icon(Icons.keyboard_backspace),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        drawer: MyDrawer(),
        body: Container(
          decoration: BoxDecoration(
            //  color: Color(0xff056608),
            image: DecorationImage(
              image: backgroundimage,
              //image: AssetImage("images/pdfback.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    height: 160,
                    child: Image.asset(
                      'images/logo2.png',
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    child: InternationalPhoneNumberInput(
                      onInputChanged: (PhoneNumber number) {
                        print(number.phoneNumber);
                        setState(() {
                          mymobilenumber = number.phoneNumber;
                        });
                      },
                      onInputValidated: (bool value) {
                        print(value);
                        setState(() {
                          isValidmobilenumber = value;
                        });
                      },
                      ignoreBlank: false,
                      autoValidate: false,
                      selectorTextStyle: TextStyle(color: Colors.black),
                      initialValue: number,
                      textFieldController: controller,
                      inputBorder: OutlineInputBorder(),
                    ),
                  ),
                  /* RaisedButton(
                onPressed: () {
                  formKey.currentState.validate();
                },
                child: Text('Validate'),
              ),
              RaisedButton(
                onPressed: () {
                  getPhoneNumber('+15417543010');
                },
                child: Text('Update'),
              ),*/
                  /*SizedBox(
                height: 30,
              ),
              Row(
                children: <Widget>[
                  Container(
                    child: Text(
                      "+88",
                      style: TextStyle(color: Colors.white),
                    ),
                    width: 50,
                    padding: EdgeInsets.all(10),
                  ),
                  Container(
                    width: 200,
                    child: TextFormField(
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              borderSide:
                                  BorderSide(color: Colors.grey[200])),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              borderSide:
                                  BorderSide(color: Colors.grey[300])),
                          filled: true,
                          fillColor: Colors.grey[100],
                          hintText: "Mobile Number"),
                      controller: _phoneController,
                    ),
                  ),
                ],
              ),*/
                  SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: double.infinity,
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.yellow),
                        ),
                        child: Text("LOGIN"),
                        textColor: Colors.white,
                        padding: EdgeInsets.all(16),
                        onPressed: () {
                          print("loginpressed");
                          if (isValidmobilenumber) {
                            final phone = mymobilenumber;

                            loginUser(phone, context);
                          } else {
                            Fluttertoast.showToast(
                                msg: "Please Enter a valid Phone number",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0);
                            print("ok");
                          }
                        },
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }

  void getPhoneNumber(String phoneNumber) async {
    PhoneNumber number =
        await PhoneNumber.getRegionInfoFromPhoneNumber(phoneNumber, 'US');

    setState(() {
      this.number = number;
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
