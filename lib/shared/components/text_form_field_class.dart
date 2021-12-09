import 'package:flutter/material.dart';

class TextFormFieldClass extends StatelessWidget {
  //required controller
  late final TextEditingController controller;

  //validator
  FormFieldValidator<String>? validator;

  //Hint text
  String? textHint;

  //Hint color (initial color black)
  late Color hintColor;

  //Text color (initial color black)
  late Color textColor;

  //background color (initial color white)
  late Color backgroundColor;

  // prefix Icon
  Icon? prefix;

  //Rounded Rectangle Border (initial 25.0)
  late double roundedRectangleBorder;

  //obscure Text
  late bool obscureText;

  //Widget suffix Icon
  Widget? suffixIcon;

  //Text Input Type (keyboard Type)
  TextInputType? keyboardType;

  //label
  String? label;
  InputDecoration? decoration;
  TextStyle? textStyle;
  StrutStyle? structStyle;

  TextFormFieldClass({
    required this.controller,
    this.validator,
    this.textHint,
    this.hintColor = Colors.black38,
    this.textColor = const Color.fromRGBO(4, 15, 15, 1),
    this.backgroundColor = Colors.white,
    this.prefix,
    this.roundedRectangleBorder = 15.0,
    this.obscureText = false,
    this.suffixIcon,
    this.keyboardType,
    this.label,
    this.decoration,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      style: TextStyle(
        color: textColor,
        fontFamily: 'Tajawal',
      ),
      strutStyle: structStyle,
      decoration: InputDecoration(
        hintText: textHint,
        filled: true,
        fillColor: backgroundColor,
        labelText: label,
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        helperStyle: textStyle,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(roundedRectangleBorder),
        ),
        prefixIcon: prefix,
        hintStyle: TextStyle(color: hintColor),
        // icon: icon,
        suffixIcon: suffixIcon,
      ),
      obscureText: obscureText,
    );
  }
}
