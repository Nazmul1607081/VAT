import 'package:flutter/material.dart';

class MyTextFormField extends StatefulWidget {
  final controller;
  final labelText;
  final validationMassage;
  final onChange;
  final obscureText;
  final isPass;
  final maxLine;
  final keyBoard;
  const MyTextFormField(
      {Key key,
      @required this.controller,
      @required this.labelText,
      @required this.validationMassage,
      @required this.onChange,
      @required this.obscureText,
      @required this.isPass,
      this.maxLine,
      this.keyBoard})
      : super(key: key);
  @override
  _MyTextFormFieldState createState() => _MyTextFormFieldState();
}

class _MyTextFormFieldState extends State<MyTextFormField> {
  bool suff = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: TextFormField(
        style: TextStyle(color: Colors.black),
        controller: widget.controller,
        obscureText: (widget.isPass == false) ? false : suff,
        decoration: InputDecoration(
          suffixIcon: (widget.isPass == true)
              ? Padding(
                  padding: const EdgeInsetsDirectional.only(end: 12.0),
                  child: IconButton(
                    icon: (suff)
                        ? Icon(Icons.visibility_off)
                        : Icon(Icons.visibility),
                    onPressed: () {
                      setState(() {
                        suff = !suff;
                      });
                    },
                  ), // myIcon is a 48px-wide widget.
                )
              : null,
          labelText: widget.labelText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        validator: (value) {
          if (value.isEmpty) {
            return widget.validationMassage;
          }

          return null;
        },
        onChanged: widget.onChange,
        keyboardType: (widget.keyBoard == null)
            ? TextInputType.multiline
            : widget.keyBoard,
        maxLines: (widget.isPass != true) ? widget.maxLine : 1,
      ),
    );
  }
}
