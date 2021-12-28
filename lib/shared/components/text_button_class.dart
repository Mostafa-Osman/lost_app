import 'package:flutter/material.dart';
import 'package:lost_app/shared/components/text_class.dart';

class TextButtonClass extends StatelessWidget {
  // required text
  final String text;

  // required Function (Action happen when press in text)
  final Function onPressed;

  //initial font size 15
  final double fontSize;

  //initial TextAlign center
  final TextAlign textAlign;

  //initial FontWeight bold
  final FontWeight fontWeight;

  //initial Text color black
  final Color textColor;

  TextButtonClass({
    required this.text,
    required this.onPressed,
    this.fontSize = 15,
    this.textAlign = TextAlign.center,
    this.fontWeight = FontWeight.bold,
    this.textColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(
        text,
        style: TextStyle(
            fontSize: fontSize, fontWeight: fontWeight, color: textColor),
        textAlign: textAlign,
      ),
      onPressed: () => onPressed(),
    );
  }
}
