import 'package:flutter/material.dart';

class Style extends StatelessWidget {
  String msg = '';
  double font = 18;
  bool bold = false;
  Style({this.msg,this.font, this.bold});

  @override
  Widget build(BuildContext context) {
    return Text(
      msg,
      style: TextStyle(
        color: Colors.white,
        fontSize: font,
        fontWeight: FontWeight.bold ?? !bold,
      ),
    );
  }
}
