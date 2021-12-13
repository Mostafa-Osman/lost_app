import 'package:flutter/material.dart';
import 'package:lost_app/modules/home/CardPost.dart';

class HomePageClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: CardPost(),
    );
  }
}
