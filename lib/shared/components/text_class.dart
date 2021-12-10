import 'package:flutter/material.dart';

class TextClass extends StatelessWidget {
  // required text
  late final String text;

  //initial font size 25
  late double fontSize;

  //initial TextAlign center
  late TextAlign textAlign;

  //initial FontWeight bold
  late FontWeight fontWeight;

  //initial Text color black
  late Color textColor;

  //initial Text backgroundColor white
  // Color backgroundColor = Colors.white,

  TextClass({
    required this.text,
    this.fontSize = 18,
    this.textAlign = TextAlign.center,
    this.fontWeight = FontWeight.normal,
    this.textColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: textColor,
        fontFamily: 'Tajawal',
      ),
    );
  }
}
