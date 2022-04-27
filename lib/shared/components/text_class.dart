import 'package:flutter/material.dart';

class TextClass extends StatelessWidget {
  // required text
   final String text;

  //initial font size 25
   final double fontSize;

  //initial TextAlign center
   final  TextAlign textAlign;

  //initial FontWeight normal
   final  FontWeight fontWeight;

  //initial Text color black
   final  Color textColor;

   final TextOverflow? overflow;
   final int? maxLines;

  //initial Text backgroundColor white
  // Color backgroundColor = Colors.white,

  const TextClass({
    required this.text,
    this.fontSize = 18,
    this.textAlign = TextAlign.center,
    this.fontWeight = FontWeight.normal,
    this.textColor = Colors.black,
    this.overflow,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: overflow,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: textColor,
        fontFamily: 'Tajawal',
      ),
      maxLines: maxLines,
    );
  }
}
