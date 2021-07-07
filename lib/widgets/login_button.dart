import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vatapp/widgets/text_widget.dart';

class MyLoginButton extends StatelessWidget {
  final String label;
  final onClick;

  const MyLoginButton({Key key, this.label, this.onClick}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: onClick,
        child: Material(
          borderRadius: BorderRadius.circular(30),
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: MyText(
              label: label,
              size: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
