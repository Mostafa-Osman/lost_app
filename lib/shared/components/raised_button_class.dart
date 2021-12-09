import 'package:flutter/material.dart';

class RaisedButtonClass extends StatefulWidget {
  late final Function onPressed;
  late final String text;
  late Color background;
  late Color textColor;
  late double textFontSize;
  late double roundedRectangleBorder;
  late double width;
  late double height;

  RaisedButtonClass({
    required this.onPressed,
    required this.text,
    this.background = const Color.fromRGBO(42, 185, 237, 1),
    this.textColor = Colors.black,
    this.textFontSize = 18,
    this.roundedRectangleBorder = 12.0,
    this.width = double.infinity,
    this.height = 45,
  });

  @override
  _RaisedButtonClassState createState() => _RaisedButtonClassState();
}

class _RaisedButtonClassState extends State<RaisedButtonClass> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: RaisedButton(
        child: Text(
          widget.text,
          style: TextStyle(
            fontSize: widget.textFontSize,
            color: widget.textColor,
            fontFamily: 'Tajawal',
          ),
        ),
        color: widget.background,
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(widget.roundedRectangleBorder), // <-- Radius
        ),
        onPressed: () => widget.onPressed(),
      ),
    );
  }
}
