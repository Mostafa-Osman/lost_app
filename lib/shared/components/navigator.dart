import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void navigateTo(BuildContext context, String route) => Navigator.pushNamed(
      context,
      route,
    );

void navigatorAndFinish(BuildContext context,String route) => Navigator.of(context)
    .pushNamedAndRemoveUntil(route, (Route<dynamic> route) => false);

Future<Object?> navigateWithArgument(BuildContext context,String route,Object? argument) =>
    Navigator.pushNamed(context, route, arguments: argument);
