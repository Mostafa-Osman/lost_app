import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lost_app/shared/components/text_class.dart';




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



