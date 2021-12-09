import 'package:flutter/material.dart';
import 'package:lost_app/shared/components/text_class.dart';

class TextButtonClass extends StatefulWidget {
  // required text
  late String text;

  // required Function (Action happen when press in text)
  late Function onPress;

  //initial font size 15
  double fontSize;

  //initial TextAlign center
  TextAlign textAlign;

  //initial FontWeight bold
  FontWeight fontWeight;

  //initial Text color black
  Color textColor = Colors.black;

  TextButtonClass({
    // required text
    required this.text,
    required this.onPress,
    this.fontSize = 15,
    this.textAlign = TextAlign.center,
    this.fontWeight = FontWeight.bold,
    this.textColor = Colors.black,
  });

  @override
  State<TextButtonClass> createState() => _TextButtonClassState();
}

class _TextButtonClassState extends State<TextButtonClass> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: TextClass(
        text: widget.text,
        fontSize: widget.fontSize,
        fontWeight: widget.fontWeight,
        textColor: widget.textColor,
        textAlign: widget.textAlign,
      ),
      onPressed: () => widget.onPress(),
    );
  }
}
