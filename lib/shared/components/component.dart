import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// Widget Text
Widget defaultText({
  // required text
  required String text,
  //initial font size 25
  double fontSize = 18,
  //initial TextAlign center
  TextAlign textAlign = TextAlign.center,
  //initial FontWeight bold
  FontWeight fontWeight = FontWeight.bold,
  //initial Text color black
  Color textColor = Colors.black,
  //initial Text backgroundColor white
  // Color backgroundColor = Colors.white,
}) =>
    Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: textColor,
        fontFamily: 'Tajawal',
      ),
    );

//Widget Text Button
Widget defaultTextButton({
  // required text
  required String text,
  // required Function (Action happen when press in text)
  required Function onPress,
  //initial font size 15
  double fontSize = 15,
  //initial TextAlign center
  TextAlign textAlign = TextAlign.center,
  //initial FontWeight bold
  FontWeight fontWeight = FontWeight.bold,
  //initial Text color black
  Color textColor = Colors.black,
}) =>
    TextButton(
      child: defaultText(
        text: text,
        fontSize: fontSize,
        fontWeight: fontWeight,
        textColor: textColor,
        textAlign: textAlign,
      ),
      onPressed: () => onPress(),
    );

//Widget TextFromField
Widget defaultTextFromField({
  //required controller
  required TextEditingController controller,
  //validator
  FormFieldValidator<String>? validator,
  //Hint text
  String? textHint,
  //Hint color (initial color black)
  Color hintColor = Colors.black,
  //Text color (initial color black)
  Color textColor = Colors.black,
  //background color (initial color white)
  Color backgroundColor = Colors.white,
  // prefix Icon
  Icon? prefix,
  //Rounded Rectangle Border (initial 25.0)
  double roundedRectangleBorder = 15.0,
  //obscure Text
  bool obscureText = false,
  //Widget suffix Icon
  Widget? suffixIcon,
  //Text Input Type (keyboard Type)
  TextInputType? keyboardType,
  //label
  String? label, InputDecoration? decoration,
  TextStyle? textStyel,

}) =>
    TextFormField(

      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      style: TextStyle(
        color: textColor,
        fontFamily: 'Tajawal',
      ),
      decoration: InputDecoration(
        hintText: textHint,
        filled: true,
        fillColor: backgroundColor,
        labelText: label,
        contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
        helperStyle: textStyel,
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

Widget defaultRaisedButton({
  required Function onPressed,
  required String text,
  Color background = const Color.fromRGBO(42, 185, 237, 1),
  Color textColor = Colors.black,
  double textFontSize = 18,
  double roundedRectangleBorder = 12.0,
  double width = double.infinity,
  double height = 45,
}) =>
    Container(
      width: width,
      height: height,
      child: RaisedButton(
        child: Text(
          text,
          style: TextStyle(
            fontSize: textFontSize,
            color: textColor,
            fontFamily: 'Tajawal',
          ),
        ),
        color: background,
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(roundedRectangleBorder), // <-- Radius
        ),
        onPressed: () => onPressed(),
      ),
    );

void navigateTo(context, widget) => Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ));

void navigatorAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
    (Route<dynamic> route) => false);

Widget defaultSmoothPageIndicator({required count, controller}) =>
    SmoothPageIndicator(
      count: count,
      controller: controller,
      effect: WormEffect(activeDotColor: const Color.fromRGBO(42, 185, 237, 1)),

    );
