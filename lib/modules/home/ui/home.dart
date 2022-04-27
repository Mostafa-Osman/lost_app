import 'package:flutter/material.dart';
import 'package:lost_app/shared/components/post_card.dart';
import 'package:lost_app/shared/styles/color.dart';

class HomeClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Align(
        child: Container(
          width: 500,
          color: white,
          child: PostCard(),
        ),
      ),
    );
  }
}
