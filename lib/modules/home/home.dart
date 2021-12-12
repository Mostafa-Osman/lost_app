import 'package:flutter/material.dart';
import 'package:lost_app/modules/home/CardPost.dart';


class HomePageClass extends StatefulWidget {
  const HomePageClass({Key? key}) : super(key: key);

  @override
  _HomePageClassState createState() => _HomePageClassState();
}

class _HomePageClassState extends State<HomePageClass> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (ctx, index) {
        return CardPost();
      },
      itemCount: 10,
    );
  }
}
