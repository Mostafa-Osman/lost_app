import 'package:flutter/material.dart';
import 'package:lost_app/shared/components/PostCard.dart';
import 'package:lost_app/shared/styles/color.dart';

class HomeClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Align(
        alignment: Alignment.center,
        child: Container(
          width: 500,
          color: white,
          child: PostCard(),
        ),
      ),
    );
  }
}
