import 'package:flutter/material.dart';

class TextFormFieldClass extends StatelessWidget {

  final TextEditingController controller;


  final  FormFieldValidator<String>? validator;


  final String? textHint;
  final TextInputAction textInputAction;

 final Color hintColor;
 final TextStyle? hintStyle;
 final  TextAlign textAlign;
 final Color textColor;

 final Color backgroundColor;

 final Widget? prefix;

 final double roundedRectangleBorder;

  final bool obscureText;

  final Widget? suffixIcon;

  final TextInputType? keyboardType;

  final EdgeInsetsGeometry contentPadding;
  final String? label;
 final InputDecoration? decoration;
 final TextStyle? textStyle;
 final StrutStyle? structStyle;
 final bool autofocus;
 final int? maxLines;
 final double? fontSize;
 final TextOverflow? overflow;
 final double? height;
  const TextFormFieldClass({
    required this.controller,
    this.validator,
    this.textHint,
    this.hintStyle,
    this.hintColor = Colors.black38,
    this.textAlign=TextAlign.start,
    this.textColor = const Color.fromRGBO(4, 15, 15, 1),
    this.backgroundColor = Colors.white,
    this.prefix,
    this.roundedRectangleBorder = 10.0,
    this.obscureText = false,
    this.autofocus=false,
    this.suffixIcon,
    this.textInputAction=TextInputAction.done,
    this.keyboardType,
    this.label,
    this.decoration,
    this.textStyle,
    this.contentPadding =
        const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
    this.maxLines=1,
    this.fontSize,
    this.overflow,
    this.height, this.structStyle,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      textAlign: textAlign,
      autofocus: autofocus,
      style: TextStyle(
        color: textColor,
        fontSize: fontSize,
        overflow: overflow,
        fontFamily: 'Tajawal',
        height: height,
      ),
      strutStyle: structStyle,
      decoration: InputDecoration(
        hintText: textHint,
        filled: true,
        fillColor: backgroundColor,
        labelText: label,
        contentPadding: contentPadding,
        helperStyle: textStyle,

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(roundedRectangleBorder),

        ),
        prefixIcon: prefix,
        hintStyle: hintStyle,
        // icon: icon,
        suffixIcon: suffixIcon,
      ),
      textInputAction: textInputAction,

      obscureText: obscureText,
      maxLines:maxLines,
    );
  }
}
