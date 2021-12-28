import 'package:flutter/material.dart';

class RaisedButtonClass extends StatefulWidget {
  final Function onPressed;
  final String text;
  final Color background;
  final Color textColor;
  final double textFontSize;
  final double roundedRectangleBorder;
  final double width;
  final double height;

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
          borderRadius: BorderRadius.circular(
              widget.roundedRectangleBorder), // <-- Radius
        ),
        onPressed: () => widget.onPressed(),
      ),
    );
  }
}
