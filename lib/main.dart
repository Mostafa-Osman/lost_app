import 'package:flutter/material.dart';
import 'package:lost_app/modules/login/login.dart';
import 'package:lost_app/modules/on_boarding/on_boarding.dart';
import 'package:lost_app/modules/register/register.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      builder: (context, child) {
        return Directionality(
            textDirection: TextDirection.rtl, child: LoginScreen());
      },
    );
  }
}
